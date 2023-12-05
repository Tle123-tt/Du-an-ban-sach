const { buildResponsePaging } = require( "../helpers/buildData.helper" );
const Vote = require( "../models/Vote.model" );
const ProductService = require( "./product.service" );


exports.index = async ( filters ) =>
{
	// destructure page and limit and set default values
	const page = filters?.page || 1; const page_size = filters?.page_size || 10;
	const condition = {};
	if ( filters?.user_id ) condition.user_id = filters.user_id;
	if ( filters?.product_id ) condition.product_id = filters.product_id;
	if ( filters?.vote_number ) condition.vote_number = filters.vote_number;
	// execute query with page and limit values
	const votes = await Vote.find()
		.populate( [ 'user' ] )
		.where( condition )
		.limit( page_size )
		.skip( ( page - 1 ) * page_size )
		.exec();

	// get total documents in the Posts collection
	const count = await Vote.count().where( condition );

	const total_star = [];
	for ( let i = 1; i < 6; i++ )
	{
		let obj = {
			_id: i,
			count: await Vote.count( { vote_number: i } ).where( {
				product_id: filters?.product_id || 0
			} )
		}
		total_star.push( obj )
	}


	// return response with posts, total pages, and current page
	const meta = buildResponsePaging( page, page_size, count )
	const status = 200;
	const data = {
		votes: votes,
		total_star: total_star
	}
	return {
		...data,
		meta
	};
};

exports.show = async ( id ) =>
{
	const vote = await Vote.findOne( { _id: id } )
	return vote;
};

exports.store = async ( data ) =>
{
	const vote = new Vote( data );
	await vote.save();
	await ProductService.updateVoting( data, 1 );
	return vote;
};

exports.update = async ( id, data ) =>
{
	const vote = await Vote.findOne( { _id: id } );

	if ( vote )
	{
		if ( data?.vote_content )
		{
			vote.vote_content = data?.vote_content;
		}
		if ( data?.vote_number )
		{
			vote.vote_number = data?.vote_number;
		}


		await vote.save();
		await ProductService.updateVoting( vote, 0 );
		return vote;
	}
	throw {message: "Không có review"}
};

exports.delete = async ( id ) =>
{
	const vote = await Vote.findOne( { _id: id } );
	await Vote.deleteOne( { _id: id } );
	await ProductService.updateVoting( { product_id: vote.product_id, vote_number: vote.vote_number }, -1 );
	return [];
};
