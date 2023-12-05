const { buildParamPaging, buildResponsePaging, toSlug } = require( "../helpers/buildData.helper" );
const SlideModel = require( "../models/Slide.model" );

exports.index = async ( filters ) =>
{
	const condition = {};
	const paging = buildParamPaging( filters );
	// execute query with page and limit values
	const categories = await SlideModel.find()
		.where( condition )
		.limit( paging.page_size )
		.skip( ( paging.page - 1 ) * paging.page_size )
		.exec();

	// get total documents in the Posts collection
	const count = await SlideModel.count().where( condition );

	// return response with posts, total pages, and current page
	const meta = buildResponsePaging( paging.page, paging.page_size, count )
	const status = 200;
	const data = {
		categories: categories
	}
	return {...data,meta};
};

exports.show = async ( id ) =>
{
	const category = await SlideModel.findOne( { _id: id } )
	return category;
};

exports.store = async ( data ) =>
{
	data.slug = toSlug(data.name);
	const category = new SlideModel( data );
	await category.save();
	return category;
};

exports.update = async ( id, data ) =>
{
	const category = await SlideModel.findOne( { _id: id } )
	if ( !category )
	{
		throw {
			message: "Không tồn tại phân loại"
		}
	}
	if ( data.name )
	{
		category.name = data.name;
	}

	await category.save();
	return category;
};

exports.delete = async ( id ) =>
{
	await SlideModel.deleteOne( { _id: id } )
	return [];
};
