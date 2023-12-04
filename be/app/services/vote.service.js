const { buildResponsePaging } = require( "../helpers/buildData.helper" );
const Vote = require( "../models/Vote.model" );
const ProductService = require( "./product.service" );


exports.index = async ( req, res ) =>
{
	// destructure page and limit and set default values
	const page = req.query.page || 1; const page_size = req.query.page_size || 10;
	const condition = {};
	if ( req.query.user_id ) condition.user_id = req.query.user_id;
	if ( req.query.room_id ) condition.room_id = req.query.room_id;
	if ( req.query.vote_number ) condition.vote_number = req.query.vote_number;
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
				product_id: req.query.product_id || 0
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
	res.json( {
		data,
		meta,
		status
	} );
};

exports.show = async ( req, res ) =>
{
	const vote = await Vote.findOne( { _id: req.params.id } )
	return res.status( 200 ).json( { data: vote, status: 200 } );
};

exports.store = async ( req, res ) =>
{
	let data = req.body;
	const vote = new Vote( data );
	await vote.save();
	await ProductService.updateVoting( data, 1 );
	return res.status( 200 ).json( { data: vote, status: 200 } );
};

exports.update = async ( req, res ) =>
{
	const vote = await Vote.findOne( { _id: req.params.id } );

	if ( vote )
	{
		if ( req.body.vote_content )
		{
			vote.vote_content = req.body.vote_content;
		}
		if ( req.body.vote_number )
		{
			vote.vote_number = req.body.vote_number;
		}


		await vote.save();
		await ProductService.updateVoting( vote, 0 );
		return res.status( 200 ).json( { data: vote, status: 200 } );
	}
};

exports.delete = async ( req, res ) =>
{
	const vote = await Vote.findOne( { _id: req.params.id } );
	await Vote.deleteOne( { _id: req.params.id } );
	await ProductService.updateVoting( { room_id: vote.room_id, vote_number: vote.vote_number }, -1 );
	return res.status( 200 ).json( { data: [], status: 200 } );
};
