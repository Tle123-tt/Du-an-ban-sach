const nodemailer = require( 'nodemailer' );
const _ = require( "lodash" )
exports.init = async () =>
{
	return nodemailer.createTransport( { // config mail server
		host: process.env.MAIL_HOST,
		port: 465,
		secure: true,
		auth: {
			user: process.env.MAIL_USER,
			pass: process.env.MAIL_PASSWORD //Mật khẩu tài khoản gmail vừa tạo huuz zrbt jfcs yuaq
		},
		tls: {
			// do not fail on invalid certs
			rejectUnauthorized: false
		}
	} );
}

exports.genTemplateWSOrder = async ( products ) =>
{
	let text = '';
	if ( !_.isEmpty( products ) )
	{
		products.forEach( ( item ) =>
		{
			let type = '';
			if ( item.type == 2 ) type = '[Sample] ';
			text +=
				item.quantity + ' x ' + type + item.name + ' ' + item.price + '<br>';
		} );
	}
	return text;
}
exports.sendMailOrder = async ( data ) =>
{
	const transporter = await this.init();
	let content = '';
	content += `
		<div style="background-color: #003375; margin: 0 auto; max-width: 600px; ">
			<div style="padding: 10px; background-color: white;">
				<h4 style="color: #0d6efd">Xin chào!${ data.name }</h4>
				<p style="color: black">Bạn đã đặt hàng thành công!<br>Thông tin đơn hàng:</p>
				<span style="color: black">Tên khách hàng: <b>${ data.receiver_name }</b></span> <br>
				<span style="color: black">Email: <b>${ data.receiver_email }</b></span> <br>
				<span style="color: black">Số điện thoại: <b>${ data.receiver_phone }</b></span> <br>
				<span style="color: black">Địa chỉ: <b>${ data.receiver_address }</b></span> <br>
				<br>
                    <div style='font-weight: 700; color:#000;'>Sản phẩm</div>
                    <div style=' color:#000;'>${ this.genTemplateWSOrder(
		data.transactions
	) }</div>
                    <br>
                <div style='color:#000;'>Total: ${ data.total_price }</div>
				
				<p>Nếu bạn có bất kỳ câu hỏi hoặc yêu cầu bổ sung nào, xin hãy liên hệ với chúng tôi bằng cách gọi số điện thoại <b>000000000</b> hoặc gửi email về địa chỉ bookstore@gmail.com. Chúng tôi luôn sẵn lòng giúp đỡ bạn.</p>

			
				<p>Trân trọng,</p>
				<p><b>BookStore</b></p>
			</div>
		</div>
	`;
	const mainOptions = {
		from: '[BookStore] bookstore@gmail.com',
		to: [ data.email ],
		bcc: process.env.MAIL_TO,
		subject: `[Đơn hàng #${ data._id }] Đặt hàng thành công`,
		html: content
	}
	transporter.sendMail( mainOptions, function ( err, info )
	{
		if ( err )
		{
			console.log( err );
		} else
		{
			console.log( ' SUCCESS ' + info.response );
		}
	} );
}

exports.sendMailPassword = async ( data ) =>
{
	const transporter = await this.init();
	let content = '';
	content += `
				<div style="background-color: #003375; margin: 0 auto; max-width: 600px; ">
					<div style="padding: 10px; background-color: white;">
						<h4 style="color: #0d6efd">Xin chào, ${ data.email }</h4>
						<p style="color: black">Mật khẩu của bạn đã được khởi tạo thành công. Vui lòng thay đổi lại mật khẩu</p>
						
						
						<span style="color: black">Mật khẩu: <b>${ data.new_password }</b></span><br>

						<p>Nếu bạn có bất kỳ câu hỏi hoặc yêu cầu bổ sung nào, xin hãy liên hệ với chúng tôi qua số Hotline <b>0939.460.399</b> hoặc gửi email về địa chỉ haan.resort@gmail.com. Chúng tôi luôn sẵn lòng giúp đỡ bạn.</p>
						
						<p>Trân trọng,</p>
						<p><b>Haan Resort & Golf</b></p>
					</div>
				</div>
			`;
	let mainOptions = {
		from: '[BookStore] bookstore@gmail.com',
		to: [ data.email ],
		bcc: process.env.MAIL_TO,
		subject: '[Password] Khởi tạo mật khẩu',
		html: content
	}
	transporter.sendMail( mainOptions, function ( err, info )
	{
		if ( err )
		{
			console.log( err );
		} else
		{
			console.log( ' SUCCESS ' + info.response );
		}
	} );
}