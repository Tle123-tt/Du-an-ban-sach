const TransactionModel = require( "../../models/Transaction.model" );
const moment = require( "moment" );
const { buildResponsePaging, buildResponseException } = require( "../../helpers/buildData.helper" );
const OrderModel = require( "../../models/Order.model" );
exports.index = async ( req, res ) =>
{
	const page = req.query?.page || 1; const page_size = req.query?.page_size || 10;
	try
	{
		// execute query with page and limit values
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
	} catch ( err )
	{
		console.error( 'error--------Order> ', err );
		return res.json( {
			data: {
				orders: []
			},
			meta: {
				page: 1,
				page_size: req?.query.page_size,
				total: 0
			},
			status: 200
		} );
	}
};

exports.show = async ( req, res ) =>
{
	try
	{
		const order = await OrderModel.findOne(
			{
				_id: req.params.id
			}
		).populate( 'transactions' )
		return res.status( 200 ).json( { data: order, status: 200 } );
	} catch {
		res.status( 404 )
		res.send( { error: "Order doesn't exist!" } )
	}
};

exports.delete = async ( req, res ) =>
{
	try
	{
		await OrderModel.deleteOne( { _id: req.params.id } );
		await TransactionModel.deleteMany( { order_id: req.params.id } );
		return res.status( 200 ).json( { data: [], status: 200 } );
	} catch {
		res.status( 404 )
		res.send( { error: "Order doesn't exist!" } )
	}
};


exports.update = async ( req, res ) =>
{
	try
	{
		const data = req.body;
		let order = await OrderModel.findOne(
			{
				_id: req.params.id
			}
		);
		if(!order) {
			throw {

			}
		}

		if ( data?.status )
		{
			order.status = data.status;
		}
		if ( data.payment_status )
		{
			order.payment_status = Number(data.payment_status);
		}
		if ( data.payment_type )
		{
			order.payment_type = Number(data.payment_type);
		}
		if ( data.shipping_status )
		{
			order.shipping_status = Number(data.shipping_status);
		}
		await order.save();
		return res.status( 200 ).json( { data: order, status: 200 } );
	} catch ( e )
	{
		console.log( 'Order update error--------> ', e );
		buildResponseException(res, 400, {
			status: 400,
			message:  e?.message || "Không có dữ liệu"
		});
		
	}
};
