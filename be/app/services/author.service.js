const { buildParamPaging, buildResponsePaging, toSlug } = require( "../helpers/buildData.helper" );
const ModelData = require( "../models/Author.model" );

exports.index = async ( filters ) =>
{
	const condition = {};
	const paging = buildParamPaging( filters );
	// execute query with page and limit values
	const blogs = await ModelData.find()
		.where( condition )
		.limit( paging.page_size )
		.skip( ( paging.page - 1 ) * paging.page_size )
		.exec();

	// get total documents in the Posts collection
	const count = await ModelData.count().where( condition );

	// return response with posts, total pages, and current page
	const meta = buildResponsePaging( paging.page, paging.page_size, count )
	const status = 200;
	const data = {
		blogs: blogs
	}
	return {
		...data,
		meta
	};
};

exports.show = async ( id ) =>
{
	const blog = await ModelData.findOne( { _id: id } ).populate(['category_blog'])
	return blog;
};

exports.showBySlug = async ( slug ) =>
{
	const blog = await ModelData.findOne( { slug: slug } ).populate(['category_blog'])
	return blog;
};

exports.store = async ( data ) =>
{
	data.slug = toSlug(data.name);
	const blog = new ModelData( data );
	await blog.save();
	return blog;
};

exports.update = async ( id, data ) =>
{
	const blog = await ModelData.findOne( { _id: id } )
	if ( !blog )
	{
		throw {
			message: "Không tồn tại phân loại"
		}
	}
	if ( data.name )
	{
		blog.name = data.name;
	}
	if ( data.status != null )
	{
		blog.status = data.status;
	}
	if ( data.description )
	{
		blog.description = data.description;
	}
	if ( data.content )
	{
		blog.content = data.content;
	}
	if ( data.author_id )
	{
		blog.author_id = data.author_id;
	}
	if(data.tags) {
		blog.tags = data.tags
	}
	blog.category_id = data.category_id;
	blog.slug = data.slug;

	await blog.save();
	return blog;
};

exports.delete = async ( id ) =>
{
	await ModelData.deleteOne( { _id: id } )
	return [];
};
