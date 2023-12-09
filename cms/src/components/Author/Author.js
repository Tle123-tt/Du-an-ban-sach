// @ts-nocheck
import React from "react";
import
{
	Table
} from "reactstrap";
import Widget from "../Widget/Widget.js";

import s from "../../pages/tables/Tables.js";
import { customDate } from "../../helpers/common/common.js";
import { Pagination } from "antd";
import { Link } from "react-router-dom/cjs/react-router-dom.min.js";
import { DEFAUT_IMG, EMPTY_IMG } from "../../helpers/constant/image.js";
import { buildImage, onErrorImage } from "../../services/common.js";
import { AuthorSearch } from "./AuthorSearch.js";
export const Author = ( props ) =>
{

	const genStatus = ( status ) =>
	{
		switch ( status )
		{
			case 1: {
				return <div className="text-success">Active</div>
			}
			default: return <div className="text-warning">Inactive</div>
		}
	}
	return (
		<>
			<Widget>
				<div className="p-5">
					<div className="mb-3">
						<Link to="/author/create" className="btn btn-info">
							<span className="d-flex align-items-center"><i className="eva eva-plus mr-2"></i> Create</span>
						</Link>
					</div>
					<AuthorSearch { ...props } />
				</div>
			</Widget >
			<Widget>
				<div className="widget-table-overflow p-5 mt-4">
					<Table className={ `table-striped table-bordered table-hover ${ s.statesTable }` } responsive>
						<thead>
							<tr>
								<th>#</th>
								<th className="text-nowrap">Avatar</th>
								<th className="text-nowrap">Name</th>
								<th className="text-nowrap">Email</th>
								<th className="text-nowrap">Phone</th>
								<th className="text-nowrap">Status</th>
								<th className="text-nowrap">Time</th>
								<th className="text-nowrap text-center">Action</th>
							</tr>
						</thead>
						<tbody>
							{
								props.dataList?.length > 0 && props.dataList.map( ( item, key ) =>
								{
									return (
										< tr key={ key } className="table-product">
											<td className="text-gray-900 text-center">{ ( props.paging.page - 1 ) * props.paging.page_size + ( key + 1 ) }</td>
											<td className="d-flex align-items-center">
												<img width="70" height="70"
													id={ key }
													style={ { border: "0.5px solid gray", borderRadius: '5px' } }
													src={ buildImage(item.avatar) } alt={ item.name } onError={ onErrorImage } />
											</td>
											<td className="text-gray-900">
												<span className="text-break" style={ { minWidth: '100px' } }>{ item.name }</span>
											</td>
											<td className="text-gray-900">
												<span className="text-break" style={ { minWidth: '100px' } }>{ item.email }</span>
											</td>
											<td className="text-gray-900">
												<span className="text-break" style={ { minWidth: '80px' } }>{ item.phone }</span>
											</td>
											<td className="text-gray-900">{ genStatus( item.status ) }</td>
											<td className="text-gray-900 text-nowrap">
												{ customDate( item.created_at, 'DD/MM/yyyy' ) }
											</td>
											<td>
												<Link to={ `/author/edit/${ item._id }` } className="d-flex justify-content-center">
													<i className="eva eva-edit" style={ { fontSize: "16px", border: "1px solid" } }></i>
												</Link>
											</td>
										</tr>
									)
								}
								) }

							{
								( !props.dataList || props.dataList?.length <= 0 ) &&
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
						props.paging.total > 0 &&
						<div className="mx-auto d-flex justify-content-center my-4">
							<Pagination
								onChange={ e =>
									props.getList( {page: e, page_size: props.paging?.page_size, ...props.params } )
								}
								pageSize={ props.paging.page_size }
								defaultCurrent={ props.paging.page }
								total={ props.paging.total }
							/>
						</div>
					}
				</div>
			</Widget >
		</>

	)
}