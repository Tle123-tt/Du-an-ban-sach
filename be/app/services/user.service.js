const User = require( "../models/User.model" ) // new

exports.index = async ( filters) =>
{
	// destructure page and limit and set default values
	const page = filters?.page || 1; const page_size = filters?.page_size || 10;

	const condition = {};
	if ( filters?.name ) condition.name = { $regex: '.*' + filters.name + '.*' };
	if ( filters?.type ) condition.type = filters.type;
	if ( filters?.email ) condition.email = { $regex: '.*' + filters.email + '.*' };
	if ( filters?.status ) condition.status = filters.status;
	// execute query with page and limit values
	const users = await User.find()
		.where( condition )
		.limit( page_size )
		.skip( ( page - 1 ) * page_size )
		.exec();

	// get total documents in the Posts collection
	const count = await User.count();

	// return response with posts, total pages, and current page
	const meta = {
		total_page: Math.ceil( count / page_size ),
		total: count,
		page: parseInt( page ),
		page_size: parseInt( page_size )
	}
	const status = 200;
	const data = {
		users: users
	}
	return {
		...data,
		meta
	};
};

exports.show = async ( id ) =>
{
	console.log("object=====>? ", id);
	const user = await User.findOne( { _id: id } )
	return user;
};

exports.store = async ( data ) =>
{
	const checkUser = await User.findOne( { email: data.email } );
	if ( checkUser ) throw  { message: 'Email này đã được sử dụng', status: 400 } ;
	const user = new User( {
		name: data.name,
		avatar: data.avatar || null,
		email: data.email,
		phone: data.phone,
		password: data.password,
		birthday: data.birthday ? new Date(data.birthday) : null,
		gender: data.gender,
		status: data.status || 1,
		type: data.type || "USER"
	} )
	await user.save();
	return user;
};

exports.update = async ( id, data ) =>
{
	const user = await User.findOne( { _id: id } )
	if(!user) {
		throw {
			message: "Tài khoản không tồn tại"
		}
	}
	if ( data.name )
	{
		user.name = data.name;
	}
	if ( data.password )
	{
		user.password = data.password;
	}
	if ( data.phone )
	{
		user.phone = data.phone;
	}
	if ( data.avatar )
	{
		user.avatar = data.avatar;
	}
	if ( data.email )
	{
		user.email = data.email;
	}
	if ( data.gender )
	{
		user.gender = data.gender;
	}
	if ( data.birthday )
	{
		user.birthday = new Date(data.birthday);
	}

	await user.save();
	return user;
};

exports.delete = async ( id ) =>
{
	await User.deleteOne( { _id: id } )
	return [];
};
