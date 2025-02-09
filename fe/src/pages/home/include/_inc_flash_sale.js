import { Col, Container, Row } from "react-bootstrap";


import { Swiper, SwiperSlide } from 'swiper/react';
import { Navigation } from "swiper";
import 'swiper/css';


import productService from "./../../../api/productService";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import formatPrice, {buildImage, onErrorImage} from "../../utils/util_price";
import ImageDefailt from "../../../assets/image/default-image.png";
import {LazyLoadImage} from "react-lazy-load-image-component";

function FlashSaleCpn()
{
    const [productsFlash, setProductsFlash] = useState([]);
    const [loadingProduct, setLoadingProduc] = useState(true);

    const getListsProductsFlash = async () => {
        const response = await productService.getListsProducts({
            page_size: 18,
            sort: 'pay,desc'
        });
        if (response?.status === 200) {
            setProductsFlash(response?.data?.products);
            setLoadingProduc(false);
        }
    }

    useEffect(() => {
        getListsProductsFlash().then(r => {});
    }, []);

    return (
        <>
            <Container className='mt-5 mb-5'>
                <Row className='mb-3'>
                    <Col>
                        <div className="d-flex justify-content-between align-items-center">
                            <h1 className='heading-h1 mt-2 mb-2' >Flash Sale</h1>
                            <Link to='/' >Xem tất cả</Link>
                        </div>
                    </Col>
                </Row>
                <Row>
                    <Swiper
                    spaceBetween={20}
                    // slidesPerView={6}
                    onSlideChange={() => console.log('slide change')}
                    onSwiper={(swiper) => console.log(swiper)}
                    modules={[Navigation]}
                    navigation={true}
                    breakpoints={{
                        425: {
                          slidesPerView: 2,
                          spaceBetween: 5,
                        },
                        768: {
                          slidesPerView: 3,
                        },
                        1024: {
                          slidesPerView: 6,
                        },
                      }}
                    >
                            { loadingProduct === true ? (
                            <>
                                <h2>Loading</h2>
                            </>
                        ) : (
                            <>
                                {productsFlash && productsFlash.map((product, index) => (
                                    <SwiperSlide key={index}>
                                        <div className='product-item mb-3'>
                                            <div className="product-item-sale">
                                                <div className="box">
                                                    <span>20%</span>
                                                    <span>Giảm</span>
                                                </div>
                                            </div>
                                            <Link to={`/san-pham/${product.slug}`} className='product-item-image'>
                                                {/*<img src={product.avatar}  alt={product.name}/>*/}
                                                {/*<LazyLoadImage src={product.avatar}*/}
                                                {/*               alt={product.name}*/}
                                                {/*               height={165}*/}
                                                {/*               placeholderSrc={ImageDefailt}*/}
                                                {/*/>*/}
                                                <img src={ buildImage(product.avatar) } alt={ product.name } onError={ onErrorImage } />
                                            </Link>
                                            {/* <h3 className='product-item-title'>
                                                <Link to='/san-pham'>{product.name}</Link>
                                            </h3> */}

                                            <p className='product-item-price-flash'>
                                                <span className='price'>{formatPrice(product?.price)} <sup>đ</sup></span>
                                            </p>
                                            <div className="deals_qty">
                                                <div className="deals_progress" style={{ width: "80%" }}></div>
                                                <span>Đã bán {product.pay}</span>
                                                <img className="icon" src="https://frontend.tikicdn.com/_desktop-next/static/img/fire_icon.svg" />
                                            </div>

                                        </div>
                                    </SwiperSlide>
                                ))}
                            </>
                        )}
                    </Swiper>
                </Row>
            </Container>
        </>
    )
}

export default FlashSaleCpn;
