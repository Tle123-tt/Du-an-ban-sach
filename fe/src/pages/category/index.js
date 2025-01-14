import React, { useEffect, useState } from 'react';
import { Col, Container, Row } from 'react-bootstrap';
import { useParams, useSearchParams } from 'react-router-dom';
import ReactPaginate from 'react-paginate';

import ProductItem from '../../components/product/_inc_product_item';

import productService from "./../../api/productService";
import categoryService from "./../../api/categoryService";
import ProductItemLoadingCpn from '../../components/product/_inc_product_item_loading';
import SidebarSearch from "../../components/_inc_sidebar_search";
import { Pagination } from "antd";
import { useDispatch } from 'react-redux';
import { toggleShowLoading } from '../../store/Loading';
import {timeDelay} from '../../api/common';

function CategoryPage ()
{
	const { slug } = useParams();
	const datas = useParams();

	const [ categoryID, setCategoryId ] = useState( null );
	const [ category, setCategory ] = useState( null );
	const [ products, setProducts ] = useState( [] );
	const [ loadingProduct, setLoadingProduct ] = useState( true );
	const [search, setSearch] = useSearchParams();

	const [ currentPage, setCurrentPage ] = useState( 1 );
	const [ paging, setPaging ] = useState(
		{ page: 1, page_size: 4, total: 0 }
	);
	const [ params, setParams ] = useState( {
		price_from: null,
		price_to: null
	} );


	const dispatch = useDispatch();

	const getListsProducts = async ( filters ) =>
	{
		dispatch(toggleShowLoading(true));
		let newParams = { ...filters };
		delete newParams.total;
		delete newParams.total_page;
		console.log(newParams);
		const response = await productService.getListsProducts( {...params, ...newParams } );
		await timeDelay(1000)
		if ( response?.status === 200 )
		{
			setProducts( response?.data?.products );
			setPaging( { ...response?.data?.meta } );
		}
		setLoadingProduct( false );
		dispatch(toggleShowLoading(false));
	}

	const findOneCategoryBySlug = async () =>
	{
		const response = await categoryService.findBySlug( slug );
		if ( response?.status === 200 && response?.data )
		{
			setCategoryId( response?.data?._id );
			setLoadingProduct( true );
			setCategory( response?.data );
			await getListsProducts( { page: 1, page_size: 10, category_id: response?.data?._id } ).then( r => { } );
		}
	}

	useEffect( () =>
	{
		if ( slug )
		{
			findOneCategoryBySlug().then( r => { } );

		} else
		{
			getListsProducts( { page: 1, page_size: 10,  } ).then( r => { } );
		}

	}, [ slug, params ] );

	return (
		<div>
			<div style={ { background: 'rgb(245 245 250)' } }>
				<Container>
					<Row>
						<Col xs={ 3 } className="mt-3">
							<SidebarSearch category={ category } setParams={setParams} params={params} />
						</Col>
						<Col xs={ 9 } className="mt-3">
							<Row>
								<Col><h1 className='heading-h1 mt-2 mb-2' >Sản phẩm mới nhât</h1></Col>
							</Row>
							<Row>
								{ loadingProduct === true ? (
									<>
										<ProductItemLoadingCpn count={ 10 } />
									</>
								) : (
									<>
										{ products && products.map( ( product, index ) => (
											<Col xs={ 3 } key={ product.id }>
												<ProductItem product={ product } loading={ loadingProduct } />
											</Col>
										) ) }

									</>
								) }
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
												setPaging({...paging, page: 1, page_size: pageSize})
											}
											getListsProducts( { ...paramPage, ...params } );
										}
										}
										current={paging.page}
										pageSize={ paging.page_size }
										defaultCurrent={ paging.page }
										total={ paging.total }
									/>
								</div>
							}
						</Col>
					</Row>
				</Container>
			</div>
		</div>
	);
}

export default CategoryPage;
