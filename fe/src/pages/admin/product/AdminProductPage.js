import React, { useEffect, useState } from "react";
import { Badge, Breadcrumb, Button, Col, Container, Dropdown, DropdownButton, Form, Row, Table } from "react-bootstrap";
import SidebarAdm from "../components/_inc_sidebar_adm";
import Skeleton from "react-loading-skeleton";
import { Link, useSearchParams } from "react-router-dom";
import productAdminService from "../../../api/admin/productAdminService";
import ReactPaginate from "react-paginate";
import { PaginationControl } from "react-bootstrap-pagination-control";
import { Pagination } from "antd";
import { useDispatch } from "react-redux";
import { timeDelay } from "../../../api/common";
import { toggleShowLoading } from '../../../store/Loading';

const metaDefault = {
	page: 1,
	page_size: 10,
	total: 0,
	total_page: 0
}

function AdminProductPage ()
{
	const [ products, setProducts ] = useState( [] );
	const [ loading, setLoading ] = useState( true );
	const [ currentPage, setCurrentPage ] = useState( 1 );
	const [ nameSearch, setNameSearch ] = useState( '' );
	let [ searchParams, setSearchParams ] = useSearchParams( {} );
	const [paging, setPaging] = useState({
		page: 1,
		page_size: 10,
		total: 0
	});

	const dispatch = useDispatch();

	const getListsProducts = async (params) =>
	{
		dispatch(toggleShowLoading(true));
		setSearchParams( params );
		delete params.total;
		delete params.total_page;
		const response = await productAdminService.getListsProducts( params );
		await timeDelay(1000)
		if ( response.status === 200 )
		{
			setProducts( response.data );
			setPaging(response.meta);
		}
		setLoading( false );
		dispatch(toggleShowLoading(false));

	}

	const handleSubmitSearch = async ( e ) =>
	{
		e.preventDefault();
		let params = { ...searchParams, ...paging, page: 1 };
		params.name = nameSearch;
		setSearchParams( params );
		await getListsProducts(params);
	}

	const handleNameSearch = async ( e ) =>
	{
		setNameSearch( e.target.value );
	}

	useEffect( () =>
	{
		getListsProducts({page: 1, page_size: 10}).then( r => { } );
	}, [  ] );
	return (
		<>
			<Container>
				<Row className={ 'mt-2' }>
					<Col xl={ 2 }><SidebarAdm /></Col>
					<Col xl={ 10 }>
						<div className='breabreadcrumb'>
							<Breadcrumb>
								<Breadcrumb.Item to="/">Trang chủ</Breadcrumb.Item>
								<Breadcrumb.Item>
									Admin
								</Breadcrumb.Item>
								<Breadcrumb.Item active>Product</Breadcrumb.Item>
							</Breadcrumb>
						</div>
						<h4>Danh sách sản phẩm</h4>
						<Form className={ '' } method={ 'get' } onSubmit={ handleSubmitSearch }>
							<Row>
								<Col xl={ 2 }>
									<Form.Group className="mb-3" controlId="formBasicName">
										<Form.Control name={ 'n' } onChange={ handleNameSearch } type="text" placeholder="Enter name" />
									</Form.Group>
								</Col>
								<Col xl={ 2 }>
									<Button variant="primary" type="submit"> Lọc </Button>
								</Col>
							</Row>
						</Form>
						{ loading === true ? (
							<>
								<Skeleton count={ 20 } />
							</>
						) : (
							<>
								<Table responsive>
									<thead>
										<tr>
											<th style={ { width: "10px" } }>ID</th>
											<th style={ { width: "60px" } }>Avatar</th>
											<th style={ { width: "400px" } }>Name</th>
											<th>Category</th>
											<th>Status</th>
											<th>#</th>
										</tr>
									</thead>
									<tbody>
										{ products.map( ( item, index ) => (
											<tr key={ index }>
												<td>{ item.id }</td>
												<td>
													<Link to={ '/' } title={ item.name }>
														<img src={ item.avatar } style={ { width: '40px', height: '40px' } } />
													</Link>
												</td>
												<td><span style={ { fontSize: '14px' } }>{ item.name }</span></td>
												<td>
													<Link to={ `/` }>{ item?.category?.name }</Link>
												</td>
												<td>
													<Badge bg={ item.active === 1 ? 'success' : 'dark' }>
														{ item.active === 1 ? 'Hiển thị' : 'Ẩn' }
													</Badge>
												</td>
												<td>
													<DropdownButton
														className={ 'dropdown-button-customer' } size={ 'sm' }
														variant={ 'Secondary' }
														key={ item.id } title="...">
														<Link data-rr-ui-dropdown-item="" role="button" tabIndex="0" className="dropdown-item"
															to={ `/admin/product/edit/${ item.id }` }>Chỉnh sửa</Link>
														<Dropdown.Item>Xoá</Dropdown.Item>
													</DropdownButton>
												</td>
											</tr>
										) ) }
									</tbody>
								</Table>
							</>

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
								getListsProducts( { ...paramPage, ...searchParams } );
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

export default AdminProductPage;
