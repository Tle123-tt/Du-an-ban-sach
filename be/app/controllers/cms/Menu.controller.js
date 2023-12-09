const { buildParamPaging, buildResponsePaging, buildResponseException, buildResponse } = require( "../../helpers/buildData.helper" );
const DataService = require( "../../services/blog.service" );

exports.index = async ( req, res ) =>
{
	try
	{
		const filters = req.query;
		const response = await  DataService.index( filters );
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
		const response =  await DataService.show( req.params.id );
		await buildResponse(res, response);
	} catch ( e )
	{
		buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu"
		} );
	}
}

;exports.showBySlug = async ( req, res ) =>
{
	try
	{
		const response =  await DataService.showBySlug( req.params.slug );
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
		const response =  await DataService.store( req.body );
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
		const response =  await DataService.update( req.params.id, req.body );
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
		const response =  await DataService.delete( req.params.id );
		await buildResponse(res, response);
	} catch (e) {
		await buildResponseException(res, 400, {
			status: 400,
			message:  e?.message || "Không có dữ liệu"
		});
	}
};
