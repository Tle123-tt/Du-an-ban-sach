// @ts-nocheck
import React, { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { toggleShowLoading } from "../../redux/actions/common";
import { INIT_PAGING } from "../../helpers/constant/value";
import { Discount } from "../../components/Discount/Discount";
import { BlogService } from "../../services/blogService";
import { message } from "antd";
import { DiscountService } from "../../services/discountService";

export const DiscountContainer =() =>
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
			const response = await DiscountService.getList( params );

			if ( response?.status === 200 )
			{
				setDataList(response?.data?.discounts || []) ;
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
			const response = await DiscountService.delete(id);
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


	return <Discount
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
