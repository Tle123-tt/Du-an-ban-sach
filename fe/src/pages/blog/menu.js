import React, { useEffect, useState } from 'react';
import { Col, Container, Row } from 'react-bootstrap';
import { Link, useParams } from 'react-router-dom';
import ReactPaginate from 'react-paginate';

import ProductItem from '../../components/product/_inc_product_item';

import productService from "./../../api/productService";
import categoryService from "./../../api/categoryService";
import ProductItemLoadingCpn from '../../components/product/_inc_product_item_loading';
import SidebarSearch from "../../components/_inc_sidebar_search";
import { Pagination } from "antd";
import { useDispatch } from 'react-redux';
import { toggleShowLoading } from '../../store/Loading';
import { customDate, timeDelay } from '../../api/common';
import IncSidebar from "./component/sidebar";
import MenuService from '../../api/MenuService';
import BlogService from '../../api/BlogService';
import { buildImage } from '../utils/util_price';

function MenuPage ()
{
	const { slug } = useParams();

	const [ categoryID, setCategoryId ] = useState( null );
	const [ category, setCategory ] = useState( null );
	const [ products, setProducts ] = useState( [] );
	const [ loadingProduct, setLoadingProduct ] = useState( true );

	const [ currentPage, setCurrentPage ] = useState( 1 );
	const [ paging, setPaging ] = useState(
		{ page: 1, page_size: 4, total: 0 }
	);
	const [ params, setParams ] = useState( {
		category_id: null,
	} );

	const dispatch = useDispatch();

	const getListsProducts = async ( params ) =>
	{
		dispatch( toggleShowLoading( true ) );
		let newParams = { ...params };
		delete newParams.total;
		delete newParams.total_page;
		console.log( newParams );
		const response = await BlogService.getList( newParams );
		await timeDelay( 1000 )
		if ( response?.status === 200 )
		{
			setProducts( response?.data?.blogs );
			setPaging( { ...response?.data?.meta } );
		}
		setLoadingProduct( false );
		dispatch( toggleShowLoading( false ) );
	}

	const findOneCategoryBySlug = async () =>
	{
		const response = await MenuService.findBySlug( slug );
		if ( response?.status === 200 && response?.data )
		{
			setCategoryId( response?.data?._id );
			setLoadingProduct( true );
			setCategory( response?.data );
			await getListsProducts( { page: 1, page_size: 4, menu_id: response?.data?._id } ).then( r => { } );
		}
	}

	useEffect( () =>
	{
		if ( slug )
		{
			findOneCategoryBySlug().then( r => { } );

		} else
		{
			getListsProducts( { page: 1, page_size: 4 } ).then( r => { } );
		}

	}, [ slug ] );

	return (
		<div>
			<div style={ { background: 'rgb(245 245 250)' } }>
				<header className="py-3 bg-light border-bottom mb-4">
					<div className="container">
						<div className="text-center my-3">
							<h1 className="fw-bolder">Danh sách Blog { category?.name }</h1>
							<p className="lead mb-0">Nơi chia sẻ kinh nghiệm đọc sách hiệu quả</p>
						</div>
					</div>
				</header>
				<div className="container">
					<div className="row">
						<div className="col-lg-8">
							{ products?.length > 0 && <>
								<div className="card mb-4">
									<a href={ `/bai-viet/${ products[ 0 ].slug }` }>
										<img className="card-img-top"
											src={ buildImage( products[ 0 ].avatar ) } alt="..." />
									</a>
									<div className="card-body">
										<div className="small text-muted">{ customDate( products[ 0 ].created_at ) }</div>
										<h2 className="card-title">{ products[ 0 ].title }</h2>
										<p className="card-text">
											{ products[ 0 ].description }
										</p>
										<Link className="btn btn-primary" to={ `/bai-viet/${ products[ 0 ].slug }` }>Xem thêm</Link>
									</div>
								</div>
								<div className="row">
									{
										products.map( ( item, key ) =>
										{
											if ( key > 0 )
											{
												return (
													<div className="col-lg-6" key={ key }>
														<div className="card mb-4">
															<a href={ `/bai-viet/${ item.slug }` }>
																<img className="card-img-top"
																	src={ buildImage( item.avatar ) } alt="..." /></a>
															<div className="card-body">
																<div className="small text-muted">{ customDate( item.created_at ) }</div>
																<h2 className="card-title">{ item.title }</h2>
																<p className="card-text">
																	{ item.description }
																</p>
																<Link className="btn btn-primary" to={ `/bai-viet/${ item.slug }` }>Xem thêm</Link>
															</div>
														</div>
													</div>
												)
											}
											return '';

										} )
									}
								</div>
								<nav aria-label="Pagination">

								</nav>
							</> }

						</div>
						<IncSidebar />
					</div>
				</div>
			</div>
		</div>
	);
}

export default MenuPage;
