const { buildParamPaging, buildResponsePaging } = require( "../helpers/buildData.helper" );
const Category = require( "../models/Category.model" );

exports.index = async ( req, res ) =>
{
	const condition = {};
	const paging = buildParamPaging( req.query );
	// execute query with page and limit values
	const categories = await Category.find()
		.where( condition )
		.limit( paging.page_size )
		.skip( ( paging.page - 1 ) * paging.page_size )
		.exec();

	// get total documents in the Posts collection
	const count = await Category.count().where( condition );

	// return response with posts, total pages, and current page
	const meta = buildResponsePaging( paging.page, paging.page_size, count )
	const status = 200;
	const data = {
		categories: categories
	}
	res.json( {
		data,
		meta,
		status
	} );
};

exports.show = async ( req, res ) =>
{
	const category = await Category.findOne( { _id: req.params.id } )
	return res.status( 200 ).json( { data: category, status: 200 } );
};

exports.store = async ( req, res ) =>
{
	let data = req.body;
	const category = new Category( data );
	await category.save();
	return res.status( 200 ).json( { data: category, status: 200 } );
};

exports.update = async ( req, res ) =>
{
	const category = await Category.findOne( { _id: req.params.id } )
	if ( !category )
	{
		throw {
			message: "Không tồn tại phân loại"
		}
	}
	if ( req.body.name )
	{
		category.name = req.body.name;
	}

	await category.save();
	return res.status( 200 ).json( { data: category, status: 200 } );
};

exports.delete = async ( req, res ) =>
{
	await Category.deleteOne( { _id: req.params.id } )
	return res.status( 200 ).json( { data: [], status: 200 } );
};
