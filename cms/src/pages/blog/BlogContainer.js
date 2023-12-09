// @ts-nocheck
import React, { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { toggleShowLoading } from "../../redux/actions/common";
import { INIT_PAGING } from "../../helpers/constant/value";
import { Blog } from "../../components/Blog/Blog";
import { BlogService } from "../../services/blogService";

export const BlogContainer =() =>
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

			dispatch( toggleShowLoading( true ) )
			const response = await BlogService.getList( params );

			if ( response?.status === 200 )
			{
				setDataList(response?.data?.menus || []) ;
				setPaging(response?.data?.meta || INIT_PAGING);
			} 
			dispatch(toggleShowLoading(false));
		} catch ( error )
		{
			dispatch(toggleShowLoading(false));
		}
	}


	return <Blog
		dataList={ dataList }
		paging={ paging }
		params={ params }
		getDatasByFilter={ getDatasByFilter }
		setParams={ setParams }
		setPaging={ setPaging }
		setDataList={ setDataList }
	/>
};
