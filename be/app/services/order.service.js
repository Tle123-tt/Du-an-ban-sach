const TransactionModel = require( "../models/Transaction.model" );
const moment = require( "moment" );
const { buildResponsePaging, buildResponseException, makeId } = require( "../helpers/buildData.helper" );
const OrderModel = require( "../models/Order.model" );
const { sendMailOrder } = require( "./sendMail.service" );
const ProductModel = require("../models/Product.model");
exports.index = async ( filters ) =>
{
	const page = filters?.page || 1; const page_size = filters?.page_size || 10;
	const condition = {};
	if ( filters?.receiver_name ) condition.receiver_name = filters.receiver_name;
	if ( filters?.receiver_email ) condition.receiver_email = filters.receiver_email;
	if ( filters?.receiver_phone ) condition.receiver_phone = filters.receiver_phone;
	if ( filters?.status ) condition.status = filters.status;
	if ( filters?.shipping_status ) condition.shipping_status = filters.shipping_status;
	if ( filters?.payment_status ) condition.payment_status = filters.payment_status;

	const orders = await OrderModel.find()
		.where( condition )
		.limit( page_size )
		.skip( ( page - 1 ) * page_size )
		.populate( [ 'transactions' ] )
		.sort( { created_at: 'desc' } )
		.exec();

	// get total documents in the Posts collection
	const count = await OrderModel.find().where( condition ).count();

	// return response with posts, total pages, and current page
	const meta = buildResponsePaging( page, page_size, count )
	const status = 200;
	const data = {
		orders: orders
	}
	return  {
		...data,
		meta
	};
};

exports.show = async ( req, res ) =>
{
	const order = await OrderModel.findOne(
		{
			_id: req.params.id
		}
	).populate( 'transactions' );
	return order;
};

exports.delete = async ( id ) =>
{
	await OrderModel.deleteOne( { _id: id } );
	await TransactionModel.deleteMany( { order_id: id } );
	return [];
};


exports.update = async ( id, data ) =>
{
	let order = await OrderModel.findOne(
		{
			_id: id
		}
	);
	if ( !order )
	{
		throw {
			message: "Không có dữ liệu"
		}
	}

	if ( data?.status )
	{
		order.status = data.status;
	}
	if ( data.payment_status )
	{
		order.payment_status = Number( data.payment_status );
	}
	if ( data.payment_type )
	{
		order.payment_type = Number( data.payment_type );
	}
	if ( data.shipping_status )
	{
		order.shipping_status = Number( data.shipping_status );
	}
	await order.save();
	return order;
};

exports.cancel = async ( id, data ) =>
{
	let order = await OrderModel.findOne(
		{
			_id: id
		}
	);
	if ( !order )
	{
		throw {
			message: "Không có dữ liệu"
		}
	}

	order.status = -1
	await order.save();
	return order;
};

exports.webhook = async (filters) => {
    let _id = filters.vnp_TxnRef;
    if (filters.vnp_ResponseCode !== "00") { // filters.vnp_ResponseCode === "00" thanh toán thành công
        const order = await OrderModel.findById({ _id: _id }).populate(['transactions']);
        if (order) {
			sendMailOrder(order);
			order.payment_status = 1;
			order.save();
        }

    }
}

exports.store = async ( data ) =>
{
	if(!data.products || data.products?.length <= 0) {
		throw {
			message: "Vui lòng chọn sản phẩm"
		}
	}
	let order = new OrderModel({
		total_discount: data.total_discount,
		total_price: data.total_price,
		receiver_address: data.receiver_address,
		receiver_email: data.receiver_email,
		receiver_phone: data.phone,
		receiver_name: data.name,
		user_id: data.user_id,
		status: 0,
		shipping_status: 0,
		payment_type: data.payment_type,
		payment_status: data.payment_status,
		note: data.note
	});
	await order.save();
	if(order && data.products?.length > 0) {
		for(let item of data.products) {
			console.log('------------ item: ', item);
			let transaction = new TransactionModel({
				code: makeId(10),
				product_id: item.id,
				name: item.name,
				avatar: item.avatar,
				quantity: Number(item.quantity),
				price: Number(item.price),
				user_id: order.user_id,
				total_price: Number(item.price) * Number(item.quantity) - Number(0),
				order_id: order._id,
				discount: Number(item.discount)
			});
			await transaction.save();
			await order.transactions.push(transaction);
			await order.save();

			const product = await ProductModel.findOne( { _id: item.id } );
			if ( product )
			{
				product.pay = product.pay ? product.pay + 1 : 1;
				await product.save();
			}
		}
	}
	console.log('---------- OK');
	return order;
};
