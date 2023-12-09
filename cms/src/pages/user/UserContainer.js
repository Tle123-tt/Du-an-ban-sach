// @ts-nocheck
import React, { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { UserCpn } from "../../components/User/User";
import { USER_SERVICE } from "../../services/userService";
import { message } from "antd";

export const UserContainer = () =>
{

	const [ listData, setListData ] = useState( [] );
	const [ paging, setPaging ] = useState( {
		page: 1,
		page_size: 20
	} );
	const [ params, setParams ] = useState( {} );
	const dispatch = useDispatch();

	useEffect( () =>
	{
		getListData(paging);
	}, [] );

	const getListData = async ( filter ) =>
	{
		const response = await USER_SERVICE.getListData( filter, dispatch );
		console.log(response);
		if(response) {
			setListData(response.users);
			setPaging(response.meta);
		} else {
			setListData([]);
		}
	}

	const deleteUser = async (id) => {
		try {
			const response = await USER_SERVICE.delete(id);
			if(response?.status === 200) {
				message.success('Delete user successfully');
				await getListData({...paging, ...params});
			} else {
				message.error(response?.message);
			}

		} catch (error) {
			message.error(error?.message);
		}
	}


	return <UserCpn
		listData={ listData }
		paging={ paging }
		params={ params }
		deleteUser={deleteUser}
		getListData={ getListData }
		setParams={ setParams }
		setPaging={ setPaging }
		setListData={ setListData }
	/>
};
