const Role = require( "./../models/Role.model" ) // new
const Permission = require( "./../models/Permission.model" )
const Room = require( "../models/Room.model" ); // new

exports.index = async ( filters ) =>
{
	// destructure page and limit and set default values
	const page = filters?.page || 1; const page_size = filters?.page_size || 10;

	try
	{
		// execute query with page and limit values
		const roles = await Role.find()
			.limit( page_size )
			.skip( ( page - 1 ) * page_size )
			.exec();

		// get total documents in the Posts collection
		const count = await Role.count();

		// return response with posts, total pages, and current page
		const meta = {
			total_page: Math.ceil( count / page_size ),
			total: count,
			page: parseInt( page ),
			page_size: parseInt( page_size )
		}
		const status = 200;
		const data = {
			roles: roles
		}
		return { ...data, meta };
	} catch ( err )
	{
		console.error( err.message );
	}
};

exports.show = async ( id ) =>
{
	const role = await Role.findOne( { _id: id } );
	console.log( '------------- role: ', role );
	return role;
};

exports.store = async ( req, res ) =>
{

	const role = await Role.create( {
		name: req.body.name,
		description: req.body.description,
		permissions: req.body.permissions,
	} )

	await Permission.updateMany( { '_id': role.permissions }, { $push: { roles: role._id } } );
	return role;
};

exports.update = async ( _id, role ) =>
{
	const newPermissions = role.permissions || [];

	const oldRole = await Role.findOne( { _id } );
	const oldPermissions = oldRole.permissions;

	// const role = await Role.findOne({ _id: req.params.id })

	Object.assign( oldRole, role );
	const newRole = await oldRole.save();

	const added = difference( newPermissions, oldPermissions );
	const removed = difference( oldPermissions, newPermissions );

	await Permission.updateMany( { '_id': added }, { $addToSet: { roles: _id } } );
	await Permission.updateMany( { '_id': removed }, { $pull: { roles: _id } } );

	return newRole;
};

exports.delete = async ( req, res ) =>
{
	const _id = req.params.id;
	console.log( '------ DELETE ID: => ', _id );
	const role = await Role.findOne( { _id } );
	if ( role )
	{
		console.log( '--------- ROLE DELETE: ', role );
		await Role.deleteOne( { _id: _id } )
		await Permission.updateMany( { '_id': role.permissions }, { $pull: { roles: _id } } );
	}
	return []
};


function difference ( A, B )
{
	const arrA = Array.isArray( A ) ? A.map( x => x.toString() ) : [ A.toString() ];
	const arrB = Array.isArray( B ) ? B.map( x => x.toString() ) : [ B.toString() ];

	const result = [];
	for ( const p of arrA )
	{
		if ( arrB.indexOf( p ) === -1 )
		{
			result.push( p );
		}
	}

	return result;
}

