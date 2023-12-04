
exports.buildParamPaging = ( queryParam ) =>
{
	return {
		page: queryParam.page || 1,
		page_size: queryParam.page_size || 10,
	}
}

exports.buildResponsePaging = ( page, page_size, total ) =>
{
	return {
		total_page: Math.ceil( Number(total) / Number(page_size) ),
		total: total,
		page: parseInt( page ),
		page_size: parseInt( page_size )
	}
}

exports.toSlug = ( str ) =>
{
	if ( str )
	{
		str = str.toLowerCase();

		// xóa dấu
		str = str
			.normalize( 'NFD' ) // chuyển chuỗi sang unicode tổ hợp
			.replace( /[\u0300-\u036f]/g, '' ); // xóa các ký tự dấu sau khi tách tổ hợp

		// Thay ký tự đĐ
		str = str.replace( /[đĐ]/g, 'd' );

		// Xóa ký tự đặc biệt
		str = str.replace( /([^0-9a-z-\s])/g, '' );

		// Xóa khoảng trắng thay bằng ký tự -
		str = str.replace( /(\s+)/g, '-' );

		// Xóa ký tự - liên tiếp
		str = str.replace( /-+/g, '-' );

		// xóa phần dư - ở đầu & cuối
		str = str.replace( /^-+|-+$/g, '' );
	}
	return str;
}

exports.buildException = ( code, message ) =>
{
	return {
		status: ''
	}
}

exports.buildResponseException = ( res,status, error ) =>
{
	return res.status(status || 400).json(error || {status: 400, message: "Error"})
}

exports.makeId = ( length = 5 ) =>
{
	let result = '';
	let characters =
		'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
	let charactersLength = characters.length;
	for ( let i = 0; i < length; i++ )
	{
		result += characters.charAt( Math.floor( Math.random() * charactersLength ) );
	}
	return result;
}