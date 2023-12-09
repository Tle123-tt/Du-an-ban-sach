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

function ArticlePage(){
    let { slug } = useParams();

    const [productsSuggest, setProductsSuggest] = useState([]);
    const [loadingProductSuggest, setLoadingProductSuggest] = useState(true);
    const [productDetail, setProductDetail] = useState(null);
    const [loadingProductDetail, setLoadingProductDetail] = useState(true);
    let [qty, setQty] = useState(1);
    const [images, setImages] = useState([]);
    const dispatch = useDispatch();


    const findProductsDetailBySlug = async () => {
        const response = await productService.findBySlug(slug);
        console.log("--------------- response:findProductsDetailBySlug ", response);
        if (response?.status === 200) {
            setProductDetail(response?.data);
            let arrImages = [];
            response?.data?.product_images.map((item, index) => {
                console.log('----------- item: ', item);
                images.push({
                    original: buildImage(item.path),
                    thumbnail : buildImage(item.path)
                });
                // <img src={ buildImage(product.avatar) } alt={ product.name } onError={ onErrorImage } />
            })
            // let image = {
            //     original: response?.data.avatar,
            //     thumbnail : response?.data.avatar
            // }
            // images.push(image);
            console.log('------ images: ', images);
            setImages(images);
        }
        setLoadingProductDetail(false);
    }
    const ratingConfig = RatingConfig();


    const getListsProductsSuggest = async () => {
        const response = await productService.getListsProducts({
            page_size: 18
        });
        if (response?.status === 200) {
            setProductsSuggest(response?.data?.products);
            setLoadingProductSuggest(false);
        }
    }

    // tăng
    const increaseQty = async () => {
        qty = qty + 1;
        setQty(qty);
        // dispatch(addToCart(productDetail));
    }

    // giảm
    const reduceQty = async (e) => {
        qty = qty - 1;
        if (qty <= 1) qty = 1;
        setQty(qty);
        // dispatch(decrementQuantity(productDetail));
    }

    const addCart = async () => {
        if (productDetail.number <= qty) {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Số lượng sản phẩm không đủ?',
                showConfirmButton: false,
                timer: 1500
            })
            return;
        }

        productDetail.quantity = qty;
        dispatch(addToCart(productDetail));
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Thêm giỏ hàng thành công',
            showConfirmButton: false,
            timer: 1500
        })
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
                        <h1 className="fw-bolder">Danh sách blog tin tức</h1>
                        <p className="lead mb-0">Nơi chia sẻ kinh nghiệm đọc sách hiệu quả</p>
                    </div>
                </div>
            </header>
            <div className="container mt-5">
                <div className="row">
                    <div className="col-lg-8">
                        <article>
                            <header className="mb-4">
                                <h1 className="fw-bolder mb-1">Welcome to Blog Post!</h1>
                                <div className="text-muted fst-italic mb-2">Posted on January 1, 2023 by Start Bootstrap</div>
                                <a className="badge bg-secondary text-decoration-none link-light" href="">Web Design</a>
                                <a className="badge bg-secondary text-decoration-none link-light" href="">Freebies</a>
                            </header>
                            <figure className="mb-4"><img className="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="..." /></figure>
                            <section className="mb-5">
                                <p className="fs-5 mb-4">Science is an enterprise that should be cherished as an activity of the free human mind. Because it transforms who we are, how we live, and it gives us an understanding of our place in the universe.</p>
                                <p className="fs-5 mb-4">The universe is large and old, and the ingredients for life as we know it are everywhere, so there's no reason to think that Earth would be unique in that regard. Whether of not the life became intelligent is a different question, and we'll see if we find that.</p>
                                <p className="fs-5 mb-4">If you get asteroids about a kilometer in size, those are large enough and carry enough energy into our system to disrupt transportation, communication, the food chains, and that can be a really bad day on Earth.</p>
                                <h2 className="fw-bolder mb-4 mt-5">I have odd cosmic thoughts every day</h2>
                                <p className="fs-5 mb-4">For me, the most fascinating interface is Twitter. I have odd cosmic thoughts every day and I realized I could hold them to myself or share them with people who might be interested.</p>
                                <p className="fs-5 mb-4">Venus has a runaway greenhouse effect. I kind of want to know what happened there because we're twirling knobs here on Earth without knowing the consequences of it. Mars once had running water. It's bone dry today. Something bad happened there as well.</p>
                            </section>
                        </article>
                        <section className="mb-5">
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
                        </section>
                    </div>
                    <IncSidebar />
                </div>
            </div>
        </div>
    );
}

export default ArticlePage;
