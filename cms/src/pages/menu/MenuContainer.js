// @ts-nocheck
import React, { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { toggleShowLoading } from "../../redux/actions/common";
import { INIT_PAGING } from "../../helpers/constant/value";
import { MenuService } from "../../services/menuService";
import { MenuCpn } from "../../components/Menu/Menu";
import { message } from "antd";

export const MenuContainer = () =>
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
			const response = await MenuService.getList( params );

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
	const deleteById = async (id) => {
		try {
			const response = await MenuService.delete(id);
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

	return <MenuCpn
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
