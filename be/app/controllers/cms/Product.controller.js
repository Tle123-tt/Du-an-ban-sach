const { buildResponse, buildResponseException } = require( "../../helpers/buildData.helper" );
const ProductService = require( "../../services/product.service" );
exports.index = async ( req, res ) =>
{
	try
	{
		const filters = req.query;
		const response = await  ProductService.index( filters );
		await buildResponse(res, response)
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
		const response =  await ProductService.show( req.params.id );
		await buildResponse(res, response);
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
		const response =  await ProductService.store( req.body );
		await buildResponse(res, response);
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
		const response =  await ProductService.update( req.params.id, req.body );
		await buildResponse(res, response);
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
		const response =  await ProductService.delete( req.params.id );
		await buildResponse(res, response);
	} catch (e) {
		await buildResponseException(res, 400, {
			status: 400,
			message:  e?.message || "Không có dữ liệu"
		});
	}	
};