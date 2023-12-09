import {DEFAULT_USER, DEFAUT_IMG} from "./image";

export default function formatPrice(num) {
    if (!num) return  0;
    return num.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
}


export const buildImage = ( img, is_user ) =>
{
    if ( img )
    {
        return process.env.REACT_APP_URL_UPLOAD + "/upload/" + img;

    }
    else return is_user ? DEFAULT_USER: DEFAUT_IMG
}

export const onErrorImage = (e)=> {
    e.currentTarget.src = DEFAUT_IMG;
}

export const string_to_slug =  (str) => {
    // Chuyển hết sang chữ thường
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

    // return
    return str;
}
