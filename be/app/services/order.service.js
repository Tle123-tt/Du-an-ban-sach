const TransactionModel = require( "../models/Transaction.model" );
const moment = require( "moment" );
const { buildResponsePaging, buildResponseException, makeId } = require( "../helpers/buildData.helper" );
const OrderModel = require( "../models/Order.model" );
exports.index = async ( req, res ) =>
{
	const page = req.query?.page || 1; const page_size = req.query?.page_size || 10;
	const condition = {};
	if ( req.query.receiver_name ) condition.receiver_name = req.query.receiver_name;
	if ( req.query.receiver_email ) condition.receiver_email = req.query.receiver_email;
	if ( req.query.receiver_phone ) condition.receiver_phone = req.query.receiver_phone;
	if ( req.query.status ) condition.status = req.query.status;
	if ( req.query.shipping_status ) condition.shipping_status = req.query.shipping_status;
	if ( req.query.payment_status ) condition.payment_status = req.query.payment_status;

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
	return res.status( 200 ).json( {
		data,
		meta,
		status
	} );
};

exports.show = async ( req, res ) =>
{
	const order = await OrderModel.findOne(
		{
			_id: req.params.id
		}
	).populate( 'transactions' );
	return res.status( 200 ).json( { data: order, status: 200 } );
};

exports.delete = async ( req, res ) =>
{
	await OrderModel.deleteOne( { _id: req.params.id } );
	await TransactionModel.deleteMany( { order_id: req.params.id } );
	return res.status( 200 ).json( { data: [], status: 200 } );
};


exports.update = async ( req, res ) =>
{
	const data = req.body;
	let order = await OrderModel.findOne(
		{
			_id: req.params.id
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
	return res.status( 200 ).json( { data: order, status: 200 } );
};

exports.store = async ( req, res ) =>
{
	const data = req.body;
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
		receiver_phone: data.receiver_phone,
		receiver_name: data.receiver_name,
		status: 0,
		shipping_status: 0,
		payment_type: data.payment_type,
		payment_status: data.payment_status,
		note: data.note
	});
	await order.save();
	if(order && data.products?.length > 0) {
		for(let item of data.products) {
			let transaction = new TransactionModel({
				code: makeId(10),
				product_id: item.id,
				name: item.name,
				quantity: Number(item.quantity),
				price: Number(item.price),
				total_price: Number(item.price) * Number(item.quantity) - Number(item.discount),
				order_id: order._id,
				discount: Number(item.discount)
			});
			await transaction.save();
		}
	}
	return res.status( 200 ).json( { data: order, status: 200 } );
};
