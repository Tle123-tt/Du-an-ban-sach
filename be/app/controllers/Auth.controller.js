const User = require( "./../models/User.model" ) // new
const bcrypt = require( 'bcryptjs' );

const jwt = require( 'jsonwebtoken' );
const promisify = require( 'util' ).promisify;

const sign = promisify( jwt.sign ).bind( jwt );
const verify = promisify( jwt.verify ).bind( jwt );

const authMiddleware = require( './../../app/middleware/userAuthjwt' );
const Article = require( "../models/Article.model" );
const { makeId, buildResponseException, buildResponse } = require( "../helpers/buildData.helper" );
const nodemailer = require( 'nodemailer' );
const isAuth = authMiddleware.isAuth;
const UserService = require("../services/user.service")

exports.register = async ( req, res ) =>
{
	try
	{
		console.log( '----------- req: ', req.body );
		const email = req.body.email.toLowerCase();
		const checkUser = await User.findOne( { email: email } );
		if ( checkUser ) throw { message: 'Email này đã được sử dụng', status: 400 };

		const hashPassword = bcrypt.hashSync( req.body.password, 12 );
		const data = req.body;
		data.email = email;
		data.password = hashPassword;
		data.type = req.body?.type || "USER";
		const user = await UserService.store(data);

		console.log( '--------- user: ', user );

		return res.status( 200 ).json( { data: user, status: 200 } );
	} catch ( e )
	{
		await buildResponseException(res, 400, {
			status: 400,
			message:  e?.message || "Không có dữ liệu"
		});
	}
};

exports.login = async ( req, res ) =>
{
	try
	{
		const email = req.body.email.toLowerCase();
		const user = await User.findOne( { email: email } );
		console.log(user);
		if ( !user ) return res.status( 200 ).json( { message: 'Tài khoản không tồn tại', status: 400 } );

		const isPasswordValid = bcrypt.compareSync( req.body.password, user.password );
		if ( !isPasswordValid )
		{
			throw  { message: 'Mật khẩu không chính xác.' };
		}

		const accessTokenLife = process.env.ACCESS_TOKEN_LIFE;
		const accessTokenSecret = process.env.ACCESS_TOKEN_SECRET;

		const dataForAccessToken = {
			email: user.email,
		};
		const accessToken = await this.generateToken(
			dataForAccessToken,
			accessTokenSecret,
			accessTokenLife,
		);
		if ( !accessToken )
		{
			throw { message: 'Đăng nhập không thành công, vui lòng thử lại.' };
		}
		const response = {
			token_info: {
				access_token: accessToken
			},
			user: user
		}
		return res.status( 200 ).json( { data: response, status: 200 } );
	} catch ( e )
	{
		console.log('error login------> ', e);
		await buildResponseException(res, 400, {
			status: 400,
			message:  e?.message || "Không có dữ liệu"
		});
	}
};
exports.getProfile = async ( req, res ) =>
{
	try
	{
		const user = req.user;
		return res.status( 200 ).json( { data: user, status: 200 } );
	} catch (e) {
		await buildResponseException(res, 400, {
			status: 400,
			message:  e?.message || "Không có dữ liệu"
		});
	}
};

exports.updateInfo = async ( req, res ) =>
{
	try
	{
		const user = req.user;
		if(!user) {
			throw {message: "Tài khoản không tồn tại"}
		}
		const response =  await UserService.update(user._id, req.body);
		await buildResponse(res, response);
	} catch ( e )
	{
		buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu "
		} );
	}
};

exports.changePassword = async ( req, res ) =>
{
	try
	{
		const passwordData = req.body;
		if ( !passwordData || !passwordData.old_password || !passwordData?.new_password )
		{
			throw { message: "Password not empty!" };
		}
		const user = req.user;
		if ( !user && !passwordData.email )
		{
			throw { status: 400, message: "Vui lòng nhập email của bạn!" };
		}
		let condition = {};
		if ( passwordData.email )
		{
			condition.email = passwordData.email.trim();
		} else
		{
			condition._id = user?._id;
		}


		const userUpdate = await User.findOne( condition )
		console.log( '------------------ USER UPDATE', userUpdate );
		if ( userUpdate )
		{
			const isPasswordValid = bcrypt.compareSync( passwordData.old_password, userUpdate?.password );
			if ( !isPasswordValid )
			{
				return {message: 'Mật khẩu không chính xác'};
			}
			userUpdate.password = bcrypt.hashSync( passwordData.new_password.trim(), 12 );
			await userUpdate.save();
		}
		await buildResponse(res, userUpdate);
	} catch ( e )
	{
		buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu "
		} );
	}
};


exports.generateToken = async ( payload, secretSignature, tokenLife ) =>
{
	try
	{
		return await sign(
			{
				payload,
			},
			secretSignature,
			{
				algorithm: 'HS256',
				expiresIn: tokenLife,
			},
		);
	} catch ( error )
	{
		console.log( `Error in generate access token:  + ${ error }` );
		return null;
	}
};

exports.sendMailPassword = async ( req, res ) =>
{
	try
	{
		const passwordData = req.body;

		const userUpdate = await User.findOne( { email: passwordData?.email } )
		console.log( '------------------ USER UPDATE', userUpdate );
		if ( userUpdate )
		{
			const newPass = makeId( 6 );
			userUpdate.password = bcrypt.hashSync( newPass, 12 );

			await userUpdate.save();
			this.sendMailPassword({...userUpdate, new_password : newPass})
		} else
		{
			throw {message: "Không tìm thấy tài khoản!"}
		}

		await buildResponse(res, userUpdate);
	} catch ( e )
	{
		buildResponseException( res, 400, {
			status: 400,
			message: e?.message || "Không có dữ liệu "
		} );
	}
};


