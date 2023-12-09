import { message } from "antd";
import { toggleShowLoading } from "../redux/actions/common";
import { deleteMethod, getMethod, postMethod, putMethod } from "./apiService";
import { buildFilter, timeDelay } from "./common";
import uploadApi from "./upload";

export const AuthorService = {
	async create ( data )
	{
		return await postMethod( `/admin/author/store`, data );
	},

	async getList ( params )
	{
		let filter = buildFilter( params );
		return await getMethod( '/admin/author', filter );
	},
	async show ( id, params )
	{
		let filter = buildFilter( params );
		return await getMethod( '/admin/author/' + id, filter );
	},

	async update ( id, data )
	{
		return await putMethod( `/admin/author/update/${ id }`, data );
	},

	async delete ( id )
	{
		return await deleteMethod( `/admin/author/${ id }` );
	}
}
export const submitFormAuthor = async ( id = null, files, e, dispatch, history ) =>
{
	try
	{
		dispatch( toggleShowLoading( true ) );
		let avatar = await uploadApi.uploadFile(files)
		await timeDelay( 500 );
		let formValue = { ...e };
		delete formValue.image;
		formValue.avatar = avatar;
		formValue.hot = formValue.hot ? 1 : -1;
		let response;
		if ( id )
		{
			response = await AuthorService.update( id, formValue );
		} else
		{
			response = await AuthorService.create( formValue );
		}
		if ( response?.status === 200 )
		{
			message.success( `${id && 'Update' || 'Create'} successfully!` );
			await timeDelay( 500 );
			history.push( '/menu/list' );
		} else if ( response?.status === 'fail' && response?.data )
		{
			let error = Object.entries( response?.data ) || [];
			if ( error.length > 0 )
			{
				let messageError = error.reduce( ( newMessage, item ) =>
				{
					newMessage[ `${ item[ 0 ] }` ] = item[ 1 ][ 0 ];
					return newMessage
				}, {} );
				message.error( messageError )
			}
		} else
		{
			message.error( response.message || 'Error! Please try again' );
		}
		dispatch( toggleShowLoading( false ) );
	} catch ( error )
	{
		message.error( error.message );
		dispatch( toggleShowLoading( false ) );
	}
}