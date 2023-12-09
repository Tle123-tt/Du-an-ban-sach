import React, {Component, useEffect, useState} from 'react';
import {Col, Container, Row} from "react-bootstrap";
import ProductItemLoadingCpn from "../../components/product/_inc_product_item_loading";
import ProductItem from "../../components/product/_inc_product_item";
import ReactPaginate from "react-paginate";
import productService from "../../api/productService";
import SidebarSearch from "../../components/_inc_sidebar_search";


function SearchPage()
{
    const [keyword, setKeyword] = useState("");
    const [products, setProducts] = useState([]);
    const [loadingProduct, setLoadingProduct] = useState(true);
    const [params, setParams] = useState({});

    const queryParameters = new URLSearchParams(window.location.search);

    const getListsProducts = async () => {
        const keywordSearch = queryParameters.get('keyword');
        setKeyword(keywordSearch);

        let filters = {
            page_size: 8,
            page: 1,
            name: keywordSearch,
			...params
        };
		console.log(filters);

        const response = await productService.getListsProducts(filters);

        if (response?.status === 200) {
            setProducts(response?.data?.products);
            setLoadingProduct(false);
        }
    }

    useEffect(() => {
        getListsProducts().then(r => {});
    },[keyword, params]);


    return (
        <div>
            <div style={{ background: 'rgb(245 245 250)' }}>
                <Container>
                    <Row>
                        <Col xs={3} className="mt-3">
                            <SidebarSearch params={params} setParams={setParams}
                                queryParameters={queryParameters}
                            />
                        </Col>
                        <Col xs={9} className="mt-3">
                            <Row>
                                <Col xl={12}><h1 className='heading-h1 mt-2 mb-2' >Tìm kiếm sản phẩm với từ khoá <b>{keyword}</b></h1></Col>
                                {/*<Col xl={12}>*/}
                                {/*    <p className="tags-search">*/}
                                {/*        <span>Phú phan</span>*/}
                                {/*        <span>Danh mục</span>*/}
                                {/*        <span>3 Sao</span>*/}
                                {/*    </p>*/}
                                {/*</Col>*/}
                            </Row>
                            <Row>
                                { loadingProduct === true ? (
                                    <>
                                        <ProductItemLoadingCpn count={10}  />
                                    </>
                                ) : (
                                    <>
                                        {products?.length > 0 && products.map((product, index) => (
                                            <Col xs={3}  key={product.id}>
                                                <ProductItem  product={product} loading={loadingProduct} />
                                            </Col>
                                        ))}
                                        <div className='customer-paginate'>
                                            <ReactPaginate
                                                previousLabel="Trang trước"
                                                nextLabel="Trang sau"
                                                pageCount={1}
                                                marginPagesDisplayed={2}
                                                containerClassName={'container'}
                                                previousLinkClassName={'page'}
                                                breakClassName={'page'}
                                                nextLinkClassName={'page'}
                                                pageClassName={'page'}
                                                disabledClassNae={'disabled'}
                                                activeClassName={'active'}
                                            />
                                        </div>
                                    </>
                                )}
                            </Row>
                        </Col>
                    </Row>
                </Container>
            </div>
        </div>
    );
}

export default SearchPage;
