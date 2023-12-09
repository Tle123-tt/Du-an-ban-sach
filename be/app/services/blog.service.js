const { buildParamPaging, buildResponsePaging, toSlug } = require( "../helpers/buildData.helper" );
const ModelData = require( "../models/Blog.model" );
const MenuModel = require( "../models/Menu.model" );

exports.index = async ( filters ) =>
{
	const condition = {};
	const paging = buildParamPaging( filters );

	if(filters?.menu_id) condition.menu_id = filters?.menu_id
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
	const blog = await ModelData.findOne( { _id: id } ).populate(['menu'])
	return blog;
};

exports.showBySlug = async ( slug ) =>
{
	const blog = await ModelData.findOne( { slug: slug } ).populate(['menu'])
	return blog;
};

exports.store = async ( data ) =>
{
	data.slug = toSlug(data.title);
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
			message: "Dữ liệu không tồn tại"
		}
	}
	const menu = await MenuModel.findOne( { _id: data.menu_id } )
	if ( !blog )
	{
		throw {
			message: "Dữ liệu không tồn tại"
		}
	}
	blog.title = data.title;
	blog.slug = toSlug(data.title);
	blog.status = data.status;
	blog.description = data.description;
	blog.content = data.content;
	blog.avatar = data.avatar;
	blog.tags = data.tags;
	blog.menu_id = data.menu_id;
	blog.menu = data.menu;
	blog.slug = data.slug;
	blog.author_avatar = data.author_avatar;
	blog.author_email = data.author_email;
	blog.author_name = data.author_name;

	await blog.save();
	return blog;
};

exports.delete = async ( id ) =>
{
	await ModelData.deleteOne( { _id: id } )
	return [];
};
