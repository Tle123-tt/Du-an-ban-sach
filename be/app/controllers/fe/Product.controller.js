const { buildResponseException } = require( "../../helpers/buildData.helper" );
const ProductService = require("../../services/product.service")

exports.index = async ( req, res ) =>
{

	try
	{
		req.query.status = 1;
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
