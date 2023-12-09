import React, { useEffect, useState } from 'react';
import { Breadcrumb, Col, Container, Row, Table } from 'react-bootstrap';
import { Link, useParams } from 'react-router-dom';
import ImageGallery from 'react-image-gallery';
import "react-image-gallery/styles/scss/image-gallery.scss";

import productService from "./../../api/productService";

import "./../../assets/pages/product_detail.scss";
import { RatingConfig } from '../../data/data';
import { FaStar } from 'react-icons/fa';
import ProductItem from '../../components/product/_inc_product_item';
import Skeleton from "react-loading-skeleton";
import { useDispatch } from "react-redux";
import { addToCart } from "../../store/CartSlice";
import Swal from "sweetalert2";
import formatPrice, { buildImage, onErrorImage } from "../utils/util_price";

function ProductPage ()
{
	let { slug } = useParams();

	const [ productsSuggest, setProductsSuggest ] = useState( [] );
	const [ loadingProductSuggest, setLoadingProductSuggest ] = useState( true );
	const [ productDetail, setProductDetail ] = useState( null );
	const [ loadingProductDetail, setLoadingProductDetail ] = useState( true );
	let [ qty, setQty ] = useState( 1 );
	const [ageVote, setAgeVote]  = useState(0);
	const [ images, setImages ] = useState( [] );
	const dispatch = useDispatch();


	const findProductsDetailBySlug = async () =>
	{
		const response = await productService.findBySlug( slug );
		console.log( "--------------- response:findProductsDetailBySlug ", response );
		if ( response?.status === 200 )
		{
			setProductDetail( response?.data );
			let arrImages = [];
			response?.data?.product_images.map( ( item, index ) =>
			{
				console.log( '----------- item: ', item );
				images.push( {
					original: buildImage( item.path ),
					thumbnail: buildImage( item.path )
				} );
			} )
			setImages( images );

			let prod = response?.data;
			if (prod?.total_reviews > 0)
			{
				let age = prod.total_stars / prod.total_reviews;
				console.log('---------- age ', age);
				setAgeVote(age);
			}
		}
		setLoadingProductDetail( false );
	}
	const ratingConfig = RatingConfig();


	const getListsProductsSuggest = async () =>
	{
		const response = await productService.getListsProducts( {
			page_size: 18
		} );
		if ( response?.status === 200 )
		{
			setProductsSuggest( response?.data?.products );
			setLoadingProductSuggest( false );
		}
	}

	// tăng
	const increaseQty = async () =>
	{
		qty = qty + 1;
		setQty( qty );
		// dispatch(addToCart(productDetail));
	}

	// giảm
	const reduceQty = async ( e ) =>
	{
		qty = qty - 1;
		if ( qty <= 1 ) qty = 1;
		setQty( qty );
		// dispatch(decrementQuantity(productDetail));
	}

	const addCart = async () =>
	{
		if ( productDetail.number <= qty )
		{
			Swal.fire( {
				position: 'top-end',
				icon: 'error',
				title: 'Số lượng sản phẩm không đủ?',
				showConfirmButton: false,
				timer: 1500
			} )
			return;
		}

		productDetail.quantity = qty;
		dispatch( addToCart( productDetail ) );
		Swal.fire( {
			position: 'top-end',
			icon: 'success',
			title: 'Thêm giỏ hàng thành công',
			showConfirmButton: false,
			timer: 1500
		} )
	}



	useEffect( () =>
	{
		findProductsDetailBySlug().then( r => { } );
		getListsProductsSuggest().then( r => { } );
	}, [ slug ] );

	return (
		<>
			<Container className='product-detail'>
				<div className='breabreadcrumb'>
					<Breadcrumb>
						<Breadcrumb.Item to="/"><Link to="/">Trang chủ</Link></Breadcrumb.Item>
						<Breadcrumb.Item to="/">
							<Link to="/san-pham">Danh mục</Link>
						</Breadcrumb.Item>
						<Breadcrumb.Item active>Chi tiết sản phẩm</Breadcrumb.Item>
					</Breadcrumb>
				</div>
				<div>
					<Row>
						<Col xl={ 6 }>
							<div className='product-detail-image'>
								<ImageGallery items={ images } />
							</div>
						</Col>
						<Col xl={ 4 }>
							<div className='product-detail-header'>
								<h4 className='cate'><span>Danh mục</span> <Link>{ productDetail?.category?.name }</Link></h4>
								{ loadingProductDetail === false ? (
									<>
										<h1>{ productDetail.name }</h1>
										<p><i>{'Tác giả: ' + (productDetail?.author?.name || '')}</i></p>
									</>
								) : (
									<Skeleton count={ 2 } />
								) }
								<div>
									{ loadingProductDetail === false ? (
										<p className='vote'>
											{ ratingConfig.map( ( index ) => (
												<FaStar key={ index } className={  index <= ageVote  ? 'active' : '' } />
											) ) }
											<Link>Xem ({ productDetail.review_total | 0 }) đánh giá</Link>
										</p>
									) : (
										<Skeleton count={ 1 } />
									) }
									<div className='box-price'>
										{/* <p className='price'>
                                        <span>120.000 đ</span>
                                    </p> */}
										<p className='price'>
											<span>{ formatPrice( productDetail?.price ) } đ</span> <span><sub className='discount'>0 đ</sub></span>
										</p>
									</div>
									<div className="box-qty-add-cart">
										<span>Số lượng</span>
										<div className="box">
											<button onClick={ reduceQty } disabled={ qty <= 1 }>-</button>
											<input type="number" readOnly value={ qty } />
											<button onClick={ increaseQty }>+</button>
										</div>
									</div>
									<div className="box-button-cart d-flex">
										<button type="submit" onClick={ addCart } className={ 'btn btn-success' }>Thêm giỏ hàng</button>
									</div>
									<p style={ { marginTop: "10px" } }>{ productDetail?.content }</p>
								</div>
							</div>
						</Col>
						<Col xl={ 2 }>
							<div className="seller-info">
								<div className="overview" href="https://tiki.vn/cua-hang/tiki-trading?source_screen=product_detail&amp;source_engine=organic">
									<img src={ 'https://vcdn.tikicdn.com/ts/seller/ee/fa/a0/98f3f134f85cff2c6972c31777629aa0.png' } className='logo' />
									<p className="overview-right ">
										<span className="seller-name">
											<span>Tiki Trading</span>
											<img src={ 'https://salt.tikicdn.com/cache/w100/ts/upload/5d/4c/f7/0261315e75127c2ff73efd7a1f1ffdf2.png' } />
										</span>
									</p>
								</div>
							</div>
						</Col>
					</Row>
				</div>
			</Container>
			{/*<Container>*/ }
			{/*    <Row>*/ }
			{/*        <Col><h2 className='heading-h2 mt-2 mb-2' >Thông tin chi tiết</h2></Col>*/ }
			{/*    </Row>*/ }
			{/*    <Row>*/ }
			{/*        <Col xs={8}>*/ }
			{/*            <Table className='table-default'>*/ }
			{/*                <tbody>*/ }
			{/*                    <tr>*/ }
			{/*                        <td>Nhã Nam</td>*/ }
			{/*                        <td>Mark</td>*/ }
			{/*                    </tr>*/ }
			{/*                    <tr>*/ }
			{/*                        <td>Công ty phát hành</td>*/ }
			{/*                        <td>Jacob</td>*/ }
			{/*                    </tr>*/ }
			{/*                </tbody>*/ }
			{/*            </Table>*/ }
			{/*        </Col>*/ }
			{/*        <Col xs={4}>*/ }
			{/*            <p>Banner</p>*/ }
			{/*        </Col>*/ }

			{/*    </Row>*/ }
			{/*</Container>*/ }
			{/*<Container>*/ }
			{/*    <Row>*/ }
			{/*        <Col><h2 className='heading-h2 mt-2 mb-2' >Mô tả</h2></Col>*/ }
			{/*    </Row>*/ }
			{/*    <Row>*/ }

			{/*    </Row>*/ }
			{/*</Container>*/ }
			<Container>
				<Row>
					<Col><h1 className='heading-h1 mt-2 mb-2' >Sản phẩm tương tự</h1></Col>
				</Row>
				<Row>
					{ loadingProductSuggest === true ? (
						<>
							{/*<ProductItemLoadingCpn count={10}  /> */ }
						</>
					) : (
						<>
							{ productsSuggest && productsSuggest.map( ( product, index ) => (
								<Col xs={ 6 } xl={ 2 } key={ product.id }>
									<ProductItem product={ product } />
								</Col>
							) ) }
						</>
					) }

				</Row>
			</Container>

		</>
	);
}

export default ProductPage;
