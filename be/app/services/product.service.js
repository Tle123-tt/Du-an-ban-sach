const { buildResponsePaging, buildParamPaging, buildResponseException, toSlug } = require( "../helpers/buildData.helper" );
const ProductModel = require( "../models/Product.model" )
const CategoryModel = require( "../models/Category.model" );
const AuthorModel = require( "../models/Author.model" );

exports.index = async ( filters ) =>
{

	let condition = {}
	if ( filters?.name ) condition.name = { $regex: '.*' + filters.name + '.*' };
	if ( filters?.price ) condition.price = filters.price;
	if ( filters?.hot ) condition.hot = filters.hot;
	if ( filters?.category_id ) condition.category_id = filters.category_id;
	if ( filters?.status ) condition.status = filters.status;
	if ( filters?.price_from != null && filters?.price_to )
	{
		condition.price = {
			$gt: filters?.price_from,
			$lt: filters?.price_to,
		}
	}

	console.log( condition );

	const paging = buildParamPaging( filters );
	const products = await ProductModel.find()
		.where( condition )
		.limit( paging.page_size )
		.skip( ( paging.page - 1 ) * paging.page_size )
		.populate( [ 'category', 'author' ] )
		.exec();



	// get total documents in the Posts collection
	const count = await ProductModel.count().where( condition );

	// return response with posts, total pages, and current page
	const meta = buildResponsePaging( paging.page, paging.page_size, count )
	const status = 200;
	const data = {
		products: products
	}
	return {
		...data,
		meta
	};
};

exports.show = async ( id ) =>
{
	const data = await ProductModel.findOne(
		{
			_id: id
		} )
		.populate( [ 'category', 'author' ] )
	return data;
};

exports.showBySlug = async ( slug ) =>
{
	return await ProductModel.findOne(
		{
			slug: slug
		} ).populate( [ 'category', 'author' ] );
};

exports.store = async ( data ) =>
{
	const category = await CategoryModel.findOne( {
		_id: data.category_id,
		status: 1
	} );
	if ( !category )
	{
		throw { message: "Phân loại sản phẩm không tồn tại" };
	}
	const author = await AuthorModel.findOne( {
		_id: data.author_id,
		status: 1
	} );
	if ( !author )
	{
		throw { message: "Không tìm thấy tác giả" };
	}
	const product = new ProductModel( {
		name: data.name,
		avatar: data.avatar || null,
		description: data.description,
		content: data.content,
		price: Number( data.price ),
		quantity: Number( data.quantity ),
		status: Number( data.status || 1 ),
		hot: Number( data.hot ),
		customer: data.customer,
		product_images: data.product_images,
		author_id: data.author_id,
		author: author,
		slug: toSlug( data.slug ),
		category: category,
		total_reviews: 0,
		total_stars: 0,
		category_id: data.category_id
	} )
	await product.save();
	return product;

};

exports.update = async ( id, data ) =>
{
	const product = await ProductModel.findOne(
		{
			_id: id
		} );
	const category = await CategoryModel.
		findById( data.category_id );
	const author = await AuthorModel.findOne( {
		_id: data.author_id,
		status: 1
	} );
	console.log( author );

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
	if ( !author )
	{
		throw { message: "Không tìm thấy tác giả" };
	}
	if ( data.name )
	{
		product.name = data.name;
	}
	if ( data.author_id )
	{
		product.author_id = data.author_id;
		product.author = author;
	}
	if ( data.avatar )
	{
		product.avatar = data.avatar;
	}

	if ( data.product_images )
	{
		product.product_images = data.product_images;
	}
	if ( data.description )
	{
		product.description = data.description;
	}
	if ( data.content )
	{
		product.content = data.content;
	}

	if ( data.price )
	{
		product.price = Number( data.price );
	}

	if ( data.category_id )
	{
		product.category_id = data.category_id;
		product.category = category;
	}

	if ( data.quantity )
	{
		product.quantity = Number( data.quantity );
	}

	if ( data.hot )
	{
		product.hot = Number( data.hot );
	}



	if ( data.status ) product.status = Number( data.status );
	await product.save();
	return await this.show( id );
};

exports.delete = async ( id ) =>
{
	await ProductModel.deleteOne( { _id: id } )
	return []
};

exports.updateVoting = async ( data, number ) =>
{
	try
	{
		let numberVote = data.vote_number;
		const product = await ProductModel.findOne( { _id: data.product_id } );
		if ( product )
		{
			product.total_reviews = product.total_reviews ? Number( product.total_reviews ) + number : number;
			product.total_staupdateVotingrs = product.total_stars ? Number( product.total_stars ) + Number( numberVote ) : Number( numberVote );
			await product.save();
		}
	} catch ( e )
	{
		throw e;
	}
};
