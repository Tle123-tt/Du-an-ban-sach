const { buildResponseException } = require( "../../helpers/buildData.helper" );
const ProductService = require("../../services/product.service")

exports.index = async ( req, res ) =>
{

	try
	{
		return await ProductService.index(req, res);
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
		return await ProductService.show(req, res);
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
		return await ProductService.store(req, res);
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
		return await ProductService.update(req, res);
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
		return await ProductService.delete(req, res);
	} catch ( e )
	{
		buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu"
		} );
	}
};
