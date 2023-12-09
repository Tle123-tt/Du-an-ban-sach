const { buildParamPaging, buildResponsePaging, toSlug } = require( "../helpers/buildData.helper" );
const ModelData = require( "../models/Blog.model" );
const MenuModel = require( "../models/Menu.model" );
const UserModel = require( "../models/User.model" );
const BlogLikeModel = require( "../models/BlogLike.model" );

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

exports.show = async ( id, params = {} ) =>
{
	const blog = await ModelData.findOne( { _id: id } ).populate(['menu'])
	if(params?.user_id) {
		const blogLike = await BlogLikeModel.findOne({
			blog_id: id,
			user_id: params.user_id
		});
		if(blogLike) {
			blog.user_like = blogLike.type || 0
		}
	}
	return blog;
};

exports.showBySlug = async ( slug, params = {} ) =>
{
	const blog = await ModelData.findOne( { slug: slug } ).populate(['menu']);

	if(params?.user_id && blog) {
		const blogLike = await BlogLikeModel.findOne({
			blog_id: blog._id,
			user_id: params.user_id
		});
		if(blogLike) {
			blog.user_like = blogLike.type || 0
		}
	}
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

exports.LikeOrDislike = async ( id, data ) =>
{
	const blog = await ModelData.findOne( { _id: id } )
	if ( !blog )
	{
		throw {
			message: "Dữ liệu không tồn tại"
		}
	}
	const user = await UserModel.findOne( { _id: data.user_id } )
	if ( !user )
	{
		throw {
			message: "Nguời dùng không tồn tại"
		}
	}
	let blogLike = await BlogLikeModel.findOne({
		user_id: data.user_id,
		blog_id: id
	});
	
	if(!blogLike) {
		const newBlogLike = new BlogLikeModel({
			user_id: data.user_id,
			blog_id: id,
			blog: blog,
			type: data.type,
			user: user
		});
		await newBlogLike.save();
		
	} else {
		
		if(blogLike.type == data.type) {
			await BlogLikeModel.deleteOne({_id: blogLike.id});
		} else {
			blogLike.type = data.type;
			await blogLike.save();
		}
		
	}
	blog.total_like = await BlogLikeModel.count().where( {
		blog_id: id,
		type: 1
	} );
	blog.total_dislike = await BlogLikeModel.count().where( {
		blog_id: id,
		type: 2
	} );
	
	await blog.save();
	return await this.show(id, {user_id: data.user_id});
};
