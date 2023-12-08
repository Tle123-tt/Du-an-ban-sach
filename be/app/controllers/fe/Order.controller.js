const TransactionModel = require( "../../models/Transaction.model" );
const moment = require( "moment" );
const { buildResponsePaging, buildResponseException, buildResponse } = require( "../../helpers/buildData.helper" );
const OrderModel = require( "../../models/Order.model" );
const OrderService = require( "../../services/order.service" );
exports.index = async ( req, res ) =>
{
	try
	{
		const filters = req.query;
		const response = await OrderService.index( filters );
		await buildResponse( res, response )
	} catch ( e )
	{
		await buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu"
		} );
	}

};

exports.show = async ( req, res ) =>
{
	try
	{
		const response = await OrderService.show( req.params.id );
		await buildResponse( res, response );
	} catch ( e )
	{
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
		const response = await OrderService.store( req.body );
		console.log('---------------- response ', response);
		await buildResponse( res, response );
	} catch ( e )
	{
		await buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu"
		} );
	}

};

exports.update = async ( req, res ) =>
{
	try
	{
		const response = await OrderService.update( req.params.id, req.body );
		await buildResponse( req, response );
	} catch ( e )
	{
		await buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu "
		} );
	}
};

exports.delete = async ( req, res ) =>
{
	try
	{
		const response = await OrderService.delete( req.params.id );
		await buildResponse( req, response );
	} catch ( e )
	{
		await buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu"
		} );
	}
};


exports.webhook = async ( req, res ) =>
{
	try
	{
		const response = await OrderService.webhook( req.params.id );
		await buildResponse( req, response );
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

