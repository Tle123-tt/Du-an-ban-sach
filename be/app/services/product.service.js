const { buildResponsePaging, buildParamPaging, buildResponseException, toSlug } = require( "../helpers/buildData.helper" );
const ProductModel = require( "../models/Product.model" )
const CategoryModel = require( "../models/Category.model" )

exports.index = async ( req, res ) =>
{

	let condition = {}
	if ( req.query.name ) condition.name = { $regex: '.*' + req.query.name + '.*' };
	if ( req.query.price ) condition.price = req.query.price;
	if ( req.query.hot ) condition.hot = req.query.hot;
	if ( req.query.category_id ) condition.category_id = req.query.category_id;
	if ( req.query.status ) condition.status = req.query.status;

	const paging = buildParamPaging( req.query );
	const rooms = await ProductModel.find()
		.where( condition )
		.limit( paging.page_size )
		.skip( ( paging.page - 1 ) * paging.page_size )
		.populate( [ 'category' ] )
		.exec();



	// get total documents in the Posts collection
	const count = await ProductModel.count().where( condition );

	// return response with posts, total pages, and current page
	const meta = buildResponsePaging( paging.page, paging.page_size, count )
	const status = 200;
	const data = {
		rooms: rooms
	}
	res.json( {
		data,
		meta,
		status
	} );
};

exports.show = async ( req, res ) =>
{
	const room = await ProductModel.findOne(
		{
			_id: req.params.id
		} ).populate( [ 'category' ] )
	return res.status( 200 ).json( { data: room, status: 200 } );
};

exports.store = async ( req, res ) =>
{
	const category = await CategoryModel.findOne( {
		_id: req.body.category_id,
		status: 1
	} );
	if ( !category )
	{
		throw { message: "Phân loại sản phẩm không tồn tại" };
	}
	const product = new ProductModel( {
		name: req.body.name,
		avatar: req.body.avatar || null,
		description: req.body.description,
		content: req.body.content,
		price: Number( req.body.price ),
		quantity: Number( req.body.quantity ),
		status: Number( req.body.status || 1 ),
		hot: Number( req.body.hot ),
		customer: req.body.customer,
		product_images: req.body.product_images,
		slug: toSlug( req.body.slug ),
		category: category,
		total_reviews: 0,
		total_stars: 0,
		category_id: req.body.category_id
	} )
	await product.save();
	return res.status( 200 ).json( { data: product, status: 200 } );

};

exports.update = async ( req, res ) =>
{
	const product = await ProductModel.findOne(
		{
			_id: req.params.id
		} );
	const category = await CategoryModel.
		findById( req.body.category_id );
	if ( !product )
	{
		throw {
			message: "Sản phẩm không tồn tại"
		}
	}
	if ( !category )
	{
		throw { message: "Phân loại sản phẩm không tồn tại" };
	}
	if ( req.body.name )
	{
		product.name = req.body.name;
	}
	if ( req.body.avatar )
	{
		product.avatar = req.body.avatar;
	}

	if ( req.body.product_images )
	{
		product.product_images = req.body.product_images;
	}
	if ( req.body.description )
	{
		product.description = req.body.description;
	}
	if ( req.body.content )
	{
		product.content = req.body.content;
	}

	if ( req.body.price )
	{
		product.price = Number( req.body.price );
	}

	if ( req.body.category_id )
	{
		product.category_id = req.body.category_id;
		// product.category = category;
	}

	if ( req.body.quantity )
	{
		product.quantity = Number( req.body.quantity );
	}

	if ( req.body.hot )
	{
		product.hot = Number( req.body.hot );
	}

	if ( req.body.status ) product.status = Number( req.body.status );
	await product.save();
	return res.status( 200 ).json( { data: product, status: 200 } );
};

exports.delete = async ( req, res ) =>
{
	await ProductModel.deleteOne( { _id: req.params.id } )
	return res.status( 200 ).json( { data: [], status: 200 } );
};

exports.updateVoting = async ( data, number ) =>
{
	try
	{
		const product = await ProductModel.findOne( { _id: data.product_id } );
		if ( product )
		{

			product.total_reviews = product.total_reviews ? Number( product.total_reviews ) + number : number;
			product.total_stars = product.total_stars ? Number( product.total_stars ) + Number( data.total_star ) : Number( data.total_star );
			await product.save();
		}
	} catch ( e )
	{
		throw e;
	}
};
