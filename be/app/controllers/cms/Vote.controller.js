const { buildResponseException } = require( "../../helpers/buildData.helper" );

const VoteService = require( "../../services/vote.service" );

exports.index = async ( req, res ) =>
{
	// destructure page and limit and set default values

	try
	{
		return await VoteService.index( req, res )
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
		return await VoteService.show( req, res )
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
		return await VoteService.store( req, res )
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
		return await VoteService.update( req, res )
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
		return await VoteService.delete( req, res )
	} catch ( e )
	{
		buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu"
		} );
	}
};
