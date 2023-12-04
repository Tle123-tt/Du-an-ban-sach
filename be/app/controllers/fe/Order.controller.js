const moment = require( "moment" );
const {  buildResponseException } = require( "../../helpers/buildData.helper" );
const OrderService = require( "../../services/order.service" );
exports.index = async ( req, res ) =>
{
	try
	{
		return await OrderService.index( req, res );
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
		return await OrderService.show( req, res );
	} catch ( e )
	{
		buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu"
		} );
	}
};

exports.delete = async ( req, res ) =>
{
	try
	{
		return await OrderService.delete( req, res );
	} catch ( e )
	{
		buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu"
		} );
	}
};


exports.update = async ( req, res ) =>
{
	try
	{
		return await OrderService.update( req, res );
	} catch ( e )
	{
		console.log( 'Order update error--------> ', e );
		buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu"
		} );

	}
};

exports.store = async ( req, res ) =>
{
	try
	{
		return await OrderService.store( req, res );
	} catch ( e )
	{
		console.log( 'Order update error--------> ', e );
		buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu"
		} );

	}
};
