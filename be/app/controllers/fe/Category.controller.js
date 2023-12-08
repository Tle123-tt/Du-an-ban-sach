const { buildParamPaging, buildResponsePaging, buildResponseException, buildResponse } = require( "../../helpers/buildData.helper" );
const CategoryService = require( "../../services/category.service" );

exports.index = async ( req, res ) =>
{
	try
	{
		const filters = req.query;
		const response = await  CategoryService.index( filters );
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
		const response =  await CategoryService.show( req.params.id );
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
		const response =  await CategoryService.showBySlug( req.params.slug );
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
		const response =  await CategoryService.store( req.body );
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
		const response =  await CategoryService.update( req.params.id, req.body );
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
		const response =  await CategoryService.delete( req.params.id );
		await buildResponse(res, response);
	} catch (e) {
		await buildResponseException(res, 400, {
			status: 400,
			message:  e?.message || "Không có dữ liệu"
		});
	}
};
