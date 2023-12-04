const { buildParamPaging, buildResponsePaging, buildResponseException } = require( "../../helpers/buildData.helper" );
const Category = require( "../../models/Category.model" );
const CategoryService = require( "../../services/category.service" );

exports.index = async ( req, res ) =>
{
	try
	{
		return await CategoryService.index( req, res );
	} catch ( e )
	{
		buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu"
		} );
	}

};

exports.show = async ( req, res ) =>
{
	try
	{
		return await CategoryService.show( req, res )
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
		return await CategoryService.store( req, res )
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
		return await CategoryService.update( req, res )
	} catch ( e )
	{
		buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu "
		} );
	}
};

exports.delete = async ( req, res ) =>
{
	try
	{
		return await CategoryService.delete( req, res )
	} catch (e) {
		buildResponseException(res, 400, {
			status: 400,
			message:  e?.message || "Không có dữ liệu"
		});
	}	
};
