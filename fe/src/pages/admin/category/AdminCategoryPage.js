import { Badge, Breadcrumb, Button, Col, Container, Dropdown, DropdownButton, Form, Row, Table } from "react-bootstrap";
import React, { useEffect, useState } from "react";
import SidebarAdm from "../components/_inc_sidebar_adm";
import categoryAdminService from "./../../../api/admin/categoryAdminService";
import Skeleton from "react-loading-skeleton";
import { Link, useSearchParams } from "react-router-dom";
import { PaginationControl } from 'react-bootstrap-pagination-control';
import { Pagination } from "antd";
import { useDispatch } from "react-redux";
import { timeDelay } from "../../../api/common";
import { toggleShowLoading } from '../../../store/Loading';

function AdminCategoryPage ()
{
	const [ categories, setCategories ] = useState( [] );
	const [ loading, setLoading ] = useState( true );
	let [ searchParams, setSearchParams ] = useSearchParams( {} );
	const [paging, setPaging] = useState({
		page: 1,
		page_size: 10,
		total: 0
	});

	const dispatch = useDispatch();

	const getListsCategories = async (params) =>
	{
		dispatch(toggleShowLoading(true));
		setSearchParams( params );
		delete params.total;
		delete params.total_page;
		const response = await categoryAdminService.getListsCategory( params );
		await timeDelay(1000)
		if ( response.status === 200 )
		{
			setCategories( response.data );
			setPaging(response.meta);
			setLoading( false );
		}
		dispatch(toggleShowLoading(false));
	}

	const deleteCategory = async ( id ) =>
	{
		const response = await categoryAdminService.deleteById( id );
		if ( response.status === 200 )
		{
			await getListsCategories({page: 1, page_size: 10});
		}
	}

	useEffect( () =>
	{
		getListsCategories({page: 1, page_size: 10}).then( r => { } );
	}, [] );
	return (
		<>
			<Container>
				<Row className={ 'mt-2' }>
					<Col xl={ 2 }><SidebarAdm /></Col>
					<Col xl={ 10 }>
						<div className='breabreadcrumb'>
							<Breadcrumb>
								<Breadcrumb.Item to="/">Trang chủ</Breadcrumb.Item>
								<Breadcrumb.Item href="/admin">
									Admin
								</Breadcrumb.Item>
								<Breadcrumb.Item active>Category</Breadcrumb.Item>
							</Breadcrumb>
						</div>
						<h4>Danh sách danh mục</h4>
						<Form className={ '' } method={ 'get' }>
							<Row>
								{/*<Col xl={2}>*/ }
								{/*    <Form.Group className="mb-3" controlId="formBasicName">*/ }
								{/*        <Form.Control name={'n'} type="text" placeholder="Enter name" />*/ }
								{/*    </Form.Group>*/ }
								{/*</Col>*/ }
								<Col xl={ 3 }>
									{/*<Button variant="primary" type="submit">*/ }
									{/*    Filter*/ }
									{/*</Button>*/ }
									<Link variant="danger" className={ 'btn btn-danger' } style={ { marginLeft: "5px" } } to={ '/admin/category/create' }>Thêm mới</Link>
								</Col>
							</Row>
						</Form>
						{ loading === true ? (
							<>
								<Skeleton count={ 20 } />
							</>
						) : (
							<Table responsive>
								<thead>
									<tr>
										<th>ID</th>
										<th>Avatar</th>
										<th>Name</th>
										<th>Desc</th>
										<th>Status</th>
										<th>Hot</th>
										<th>#</th>
									</tr>
								</thead>
								<tbody>
									{ categories.map( ( item, index ) => (
										<tr key={ index }>
											<td>{ item.id }</td>
											<td>
												<Link to={ '/' } title={ item.name }>
													<img src={ item.avatar } style={ { width: '40px', height: '40px' } } />
												</Link>
											</td>
											<td>{ item.name }</td>
											<td>{ item.description }</td>
											<td>
												<Badge bg={ item.status === 1 ? 'success' : 'dark' }>
													{ item.status === 1 ? 'Hiển thị' : 'Ẩn' }
												</Badge>
											</td>
											<td>
												<Badge bg={ item.hot === 1 ? 'success' : 'dark' }>
													{ item.hot === 1 ? 'Nổi bật' : 'Mặc định' }
												</Badge>
											</td>
											<td>
												<DropdownButton
													className={ 'dropdown-button-customer' } size={ 'sm' }
													variant={ 'Secondary' }
													key={ item.id } title="...">
													<Link data-rr-ui-dropdown-item="" role="button" tabIndex="0" className="dropdown-item"
														to={ `/admin/category/edit/${ item._id }` }>Chỉnh sửa</Link>

													<Dropdown.Item onClick={ () => deleteCategory( item.id ) }>Xoá</Dropdown.Item>
												</DropdownButton>
											</td>
										</tr>
									) ) }
								</tbody>
							</Table>
						) }
					</Col>
				</Row>
				{
					paging.total > 0 &&
					<div className='mx-auto d-flex justify-content-center align-content-end mt-4'>
						<Pagination
							onChange={ ( page, pageSize ) =>
							{
								let paramPage = { page: page, page_size: pageSize };
								if ( paramPage.page_size !== paging.page_size )
								{
									paramPage.page = 1;
									setPaging( { ...paging, page: 1, page_size: pageSize } )
								}
								getListsCategories( { ...paramPage, ...searchParams } );
							}
							}
							current={ paging.page }
							pageSize={ paging.page_size }
							defaultCurrent={ paging.page }
							total={ paging.total }
						/>
					</div>
				}
			</Container>
		</>
	)
}

export default AdminCategoryPage;
