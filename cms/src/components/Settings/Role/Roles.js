// @ts-nocheck
import React, { useEffect, useState } from "react";
import
{
	Table
} from "reactstrap";
import Widget from "../../Widget/Widget.js";

import s from "../../../pages/tables/Tables.js";
import { customDate } from "../../../helpers/common/common.js";
import { Pagination, message } from "antd";
import { Link } from "react-router-dom/cjs/react-router-dom.min.js";
import { EMPTY_IMG } from "../../../helpers/constant/image.js";
import { useDispatch } from "react-redux";
import { ROLE_SERVICE } from "../../../services/rolePermissionService.js";
import { toggleShowLoading } from "../../../redux/actions/common.js";
import { DeleteOutlined } from "@ant-design/icons";
export const Roles = ( props ) =>
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
		getListData( { ...paging, ...params } );
	}, [] );

	const getListData = async ( filter ) =>
	{
		dispatch( toggleShowLoading( true ) );
		const response = await ROLE_SERVICE.getDataList( filter );
		if ( response )
		{
			setListData( response.roles );
			setPaging( response.meta );
		} else
		{
			setListData( [] )
		}
		dispatch( toggleShowLoading( false ) );
	}

	const deleteData = async ( id ) =>
	{
		try
		{
			const rs = await ROLE_SERVICE.delete( id );
			if ( rs && rs.status === 200 )
			{
				message.success( 'Delete successfully!' );
				await getListData( { page: 1, page_size: 20 } );

			} else
			{
				message.error( rs.message );
			}
		} catch ( error )
		{
			message.error( error.message );
		}
	}
	return (
		<>
			<Widget>
				<div className="px-5 pt-5">
					<Link to="/setting/role/create" className="btn btn-info">
						<span className="d-flex align-items-center"><i className="eva eva-plus mr-2"></i> Create</span>
					</Link>
				</div>
				<div className="widget-table-overflow p-5 mt-4">
					<Table className={ `table-striped table-bordered table-hover ${ s.statesTable }` } responsive>
						<thead>
							<tr>
								<th>ID</th>
								<th className="text-nowrap">Name</th>
								<th className="text-nowrap">Guard name</th>
								<th className="text-nowrap">Description</th>
								<th className="text-nowrap">Permission</th>
								<th className="text-nowrap">Time</th>
								<th className="text-nowrap">Action</th>
							</tr>
						</thead>
						<tbody>
							{
								listData?.length > 0 && listData.map( ( item, key ) =>
								{
									return (
										< tr key={ key } className="table-product">
											<td className="text-gray-900 text-center">{ ( paging.page - 1 ) * paging.page_size + ( key + 1 ) }</td>

											<td className="text-gray-900">
												{ item.name }
											</td>
											<td className="text-gray-900">{ item.guard_name }</td>
											<td className="text-gray-900">
												<span className="text-break" style={ { maxWidth: '200px' } }>{ item.description }</span>
											</td>
											<td className="text-gray-900 text-break" style={ { minWidth: "200px" } }>
												{ item.permissions && item.permissions.map( ( per, key ) =>
												{
													return (
														<span key={ key }>{ per.guard_name } { key < item.permissions.length - 1 ? ', ' : '' }</span>
													)
												} )
												}
											</td>

											<td className="text-gray-900 text-nowrap">
												{ customDate( item.created_at, 'DD/MM/yyyy' ) }
											</td>
											<td>

												<div className="d-flex">
													<Link to={ `/setting/role/edit/${ item._id }` } className="d-flex justify-content-center">
														<i className="eva eva-edit" style={ { fontSize: "16px", border: "1px solid" } }></i>
													</Link>
													{/* <DeleteOutlined onClick={ () => deleteData( item.id ) } 
													className="mx-2" style={ { fontSize: "16px" } } /> */}
												</div>
											</td>

										</tr>
									)
								}
								) }

							{
								( !listData || listData?.length <= 0 ) &&
								<tr>
									<td colSpan={ 9 } style={ { textAlign: "center", backgroundColor: '#ffff' } }>
										<img className="text-center" src={ EMPTY_IMG } style={ { width: "300px", height: "300px" } } />
										<div style={ { color: "#9A9A9A" } }>Data empty</div>
									</td>
								</tr>
							}


						</tbody>
					</Table>
					{
						paging.total > 0 &&
						<div className="mx-auto d-flex justify-content-center my-4">
							<Pagination
								onChange={ e =>
									getListData( { ...paging, page: e, ...params } )
								}
								pageSize={ paging.page_size }
								defaultCurrent={ paging.page }
								total={ paging.total }
							/>
						</div>
					}
				</div>

			</Widget >
		</>

	)
}