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
import {useDispatch} from "react-redux";
import {addToCart} from "../../store/CartSlice";
import Swal from "sweetalert2";
import formatPrice, {buildImage, onErrorImage} from "../utils/util_price";
import IncSidebar from "./component/sidebar";
import BlogService from '../../api/BlogService';
import { customDate } from '../../api/common';

function ArticlePage(){
    let { slug } = useParams();

    const [productsSuggest, setProductsSuggest] = useState([]);
    const [tags, setTags] = useState([]);
    const [loadingProductSuggest, setLoadingProductSuggest] = useState(true);
    const [productDetail, setProductDetail] = useState(null);
    const [loadingProductDetail, setLoadingProductDetail] = useState(true);
    let [qty, setQty] = useState(1);
    const [images, setImages] = useState([]);
    const dispatch = useDispatch();


    const findProductsDetailBySlug = async () => {
        const response = await BlogService.findBySlug(slug);
        console.log("--------------- response:findProductsDetailBySlug ", response);
        if (response?.status === 200) {
            setProductDetail(response?.data);
			if(response?.data?.tags) {
				let tagData = response?.data?.tags.split(',');
				setTags(tagData);
			}
        }
        setLoadingProductDetail(false);
    }


    const getListsProductsSuggest = async () => {
        const response = await productService.getListsProducts({
            page_size: 18
        });
        if (response?.status === 200) {
            setProductsSuggest(response?.data?.products);
            setLoadingProductSuggest(false);
        }
    }



    useEffect(() => {
        findProductsDetailBySlug().then(r => {});
        getListsProductsSuggest().then(r => {});
    }, [slug]);

    return (
        <div style={ { background: 'rgb(245 245 250)' } }>
            <header className="py-3 bg-light border-bottom mb-4">
                <div className="container">
                    <div className="text-center my-3">
                        <h1 className="fw-bolder">Danh sách blog {productDetail?.menu?.name || ''}</h1>
                        <p className="lead mb-0">Nơi chia sẻ kinh nghiệm đọc sách hiệu quả</p>
                    </div>
                </div>
            </header>
            <div className="container mt-5">
                <div className="row">
                    <div className="col-lg-8">
                        <article>
                            <header className="mb-4">
                                <h1 className="fw-bolder mb-1">{productDetail?.title}</h1>
                                <div className="text-muted fst-italic mb-2">
									{customDate(productDetail?.created_at, 'DD/MM/yyyy') } {' Created by: ' + productDetail?.author_name} 
								</div>
                                {tags?.length > 0 && tags.map((item, key) => {
									return <a key={key} className="badge bg-secondary text-decoration-none mr-2 link-light" href="">{item}</a>
								})}
                            </header>
                            <figure className="mb-4"><img className="img-fluid rounded w-100"
							src={buildImage(productDetail?.avatar)} alt="..." /></figure>
                            <section className="mb-5">
                                <p className='fs-5 mb-4'>
									{productDetail?.description}
								</p>
								<p dangerouslySetInnerHTML={{ __html: productDetail?.content }}>

								</p>

                            </section>
                        </article>
                        {/* <section className="mb-5">
                            <div className="card bg-light">
                                <div className="card-body">
                                    <form className="mb-4"><textarea className="form-control" rows="3" placeholder="Join the discussion and leave a comment!" /></form>
                                    <div className="d-flex mb-4">
                                        <div className="flex-shrink-0"><img className="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                        <div className="ms-3">
                                            <div className="fw-bold">Commenter Name</div>
                                            If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                                            <div className="d-flex mt-4">
                                                <div className="flex-shrink-0"><img className="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                                <div className="ms-3">
                                                    <div className="fw-bold">Commenter Name</div>
                                                    And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
                                                </div>
                                            </div>
                                            <div className="d-flex mt-4">
                                                <div className="flex-shrink-0"><img className="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                                <div className="ms-3">
                                                    <div className="fw-bold">Commenter Name</div>
                                                    When you put money directly to a problem, it makes a good headline.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="d-flex">
                                        <div className="flex-shrink-0"><img className="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                        <div className="ms-3">
                                            <div className="fw-bold">Commenter Name</div>
                                            When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section> */}
                    </div>
                    <IncSidebar />
                </div>
            </div>
        </div>
    );
}

export default ArticlePage;
