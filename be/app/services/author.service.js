const { buildParamPaging, buildResponsePaging, toSlug } = require( "../helpers/buildData.helper" );
const ModelData = require( "../models/Author.model" );

exports.index = async ( filters ) =>
{
	const condition = {};
	const paging = buildParamPaging( filters );
	// execute query with page and limit values
	const dataList = await ModelData.find()
		.where( condition )
		.limit( paging.page_size )
		.skip( ( paging.page - 1 ) * paging.page_size )
		.exec();

	// get total documents in the Posts collection
	const count = await ModelData.count().where( condition );

	// return response with posts, total pages, and current page
	const meta = buildResponsePaging( paging.page, paging.page_size, count )
	const data = {
		authors: dataList
	}
	return {
		...data,
		meta
	};
};

exports.show = async ( id ) =>
{
	const data = await ModelData.findOne( { _id: id } )
	return data;
};

exports.store = async ( dataForm ) =>
{
	const data = new ModelData( dataForm );
	await data.save();
	return data;
};

exports.update = async ( id, data ) =>
{
	const result = await ModelData.findOne( { _id: id } )
	if ( !result )
	{
		throw {
			message: "Dữ liệu không tồn tại"
		}
	}
	if ( data.name )
	{
		result.name = data.name;
	}
	await result.save();
	return await this.show(id);
};

exports.delete = async ( id ) =>
{
	await ModelData.deleteOne( { _id: id } )
	return [];
};
