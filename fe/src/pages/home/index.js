import React, { useEffect, useState } from 'react';
import { Col, Container, Row } from 'react-bootstrap';

import productService from "./../../api/productService";
import categoryService from "./../../api/categoryService";


import HomeSlideCpn from './include/_inc_slide';
import ProductItem from '../../components/product/_inc_product_item';
import ProductItemLoadingCpn from '../../components/product/_inc_product_item_loading';
import { Link } from 'react-router-dom';
import LoadingCategory from './include/_inc_loading_category';
import FlashSaleCpn from './include/_inc_flash_sale';

import "./../../assets/pages/home.scss";
import {buildImage, onErrorImage} from "../utils/util_price";

function HomePage () {
    const [productsNew, setProductsNew] = useState([]);
    const [loadingProductNew, setLoadingProductNew] = useState(true);

    const [categories, setCategories] = useState([]);
    const [loadingCategory, setLoadingCategory] = useState(true);

    const getListsProductsNew = async () => {
        const response = await productService.getListsProducts({
            page_size: 18
        });
        console.log('-------- response:getListsProductsNew ', response);
        if (response.status === 200) {
            setProductsNew(response.data?.products);
            setLoadingProductNew(false);
        }
    }

    const getListsCategory = async () => {
        const response = await categoryService.getListsCategory({
            page_size: 8
        });
        console.log('-------- response:getListsCategory ', response);
        if (response.status === 200) {
            setCategories(response.data?.categories);
            setLoadingCategory(false);
        }
    }



    useEffect(() => {
        getListsProductsNew();
        getListsCategory();
    }, []);

    return (
        <div>
            <HomeSlideCpn />
            <Container className='mt-5 mb-5'>
                <Row className='mb-3'>
                    <Col><h1 className='heading-h1 mt-2 mb-2' >Danh mục nổi bật</h1></Col>
                </Row>
                <Row>
                    { loadingCategory === true ? (
                        <>
                            <LoadingCategory />
                        </>
                    ) : (
                        <>
                            <div className='lists-category-home'>
                                {categories && categories.map((category, index) => (
                                    <div className='lists-category-home-item' key={index}>
                                        <div className='lists-category-home-box'>
                                            <Link to={`/danh-muc/${category.slug}`}>
                                                <img src={ buildImage(category.avatar) } alt={ category.name } onError={ onErrorImage } />
                                            </Link>
                                            <Link className='pt-2 pb-2'  to={`/danh-muc/${category.slug}-${category.id}`} title={category.name}>{category.name}</Link>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </>
                    )}

                </Row>
            </Container>
            <FlashSaleCpn />
            <Container>
                <Row>
                    <Col><h1 className='heading-h1 mt-2 mb-2' >Sản phẩm mới nhất</h1></Col>
                </Row>
                <Row>
                    { loadingProductNew === true ? (
                        <>
                            <ProductItemLoadingCpn count={10}  />
                        </>
                    ) : (
                        <>
                            {productsNew && productsNew.map((product, index) => (
                                <Col xs={6} xl={2}  key={product._id}>
                                    <ProductItem  product={product} loading={loadingProductNew} />
                                </Col>
                            ))}
                        </>
                    )}

                </Row>
            </Container>
        </div>
    );
}

export default HomePage;
