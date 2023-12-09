// @ts-nocheck
import React, { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { getCategoriesByFilter } from "../../services/categoryService";
import { Categories } from "../../components/Category/Category";
import { timeDelay } from "../../services/common";
import { toggleShowLoading } from "../../redux/actions/common";
import { Author } from "../../components/Author/Author";
import { INIT_PAGING } from "../../helpers/constant/value";
import { AuthorService } from "../../services/AuthorService";
import { message } from "antd";

export const AuthorContainer = () =>
{

	const [ dataList, setDataList ] = useState( [] );
	const [ paging, setPaging ] = useState( {
		page: 1,
		page_size: 20
	} );
	const [ params, setParams ] = useState( {} );
	const dispatch = useDispatch();

	useEffect( () =>
	{
		getDatasByFilter( paging );
	}, [] );

	const getDatasByFilter = async ( filter ) =>
	{
		try
		{

			dispatch( toggleShowLoading( true ) );
			const response = await AuthorService.getList( filter );

			if ( response?.status === 200 )
			{
				setDataList(response?.data?.authors || []) ;
				setPaging(response?.data?.meta || INIT_PAGING);
			} 
			dispatch(toggleShowLoading(false));
		} catch ( error )
		{
			dispatch(toggleShowLoading(false));
		}
	}

	const deleteById = async (id) => {
		try {
			const response = await AuthorService.delete(id);
			if(response?.status === 200) {
				message.success('Delete successfully');
				await getDatasByFilter({...paging, ...params});
			} else {
				message.error(response?.message);
			}

		} catch (error) {
			message.error(error?.message);
		}
	}


	return <Author
		dataList={ dataList }
		paging={ paging }
		params={ params }
		deleteById={deleteById}
		getDatasByFilter={ getDatasByFilter }
		setParams={ setParams }
		setPaging={ setPaging }
		setDataList={ setDataList }
	/>
};
