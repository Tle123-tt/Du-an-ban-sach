import React, { useEffect, useState } from 'react';
import { Col, Container, Row } from 'react-bootstrap';
import { useParams } from 'react-router-dom';
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
import IncSidebar from "./component/sidebar";

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
        dispatch(toggleShowLoading(true));
        let newParams = { ...params };
        if ( categoryID )
        {
            newParams.category_id = categoryID;
        }
        delete newParams.total;
        delete newParams.total_page;
        const response = await productService.getListsProducts( newParams );
        await timeDelay(1000)
        console.log('--------------- response:getListsProducts ', response);
        if ( response.status === 200 )
        {
            setProducts( response.data?.products );
            setPaging( { ...response.meta } );
        }
        setLoadingProduct( false );
        dispatch(toggleShowLoading(false));
    }

    const findOneCategoryBySlug = async () =>
    {
        const response = await categoryService.findBySlug( slug );
        if ( response.status === 200 && response.data )
        {
            setCategoryId( response.data?.id );
            setLoadingProduct( true );
            setCategory( response.data );
            getListsProducts( { page: 1, page_size: 4 } ).then( r => { } );
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
                            <h1 className="fw-bolder">Danh sách blog tin tức</h1>
                            <p className="lead mb-0">Nơi chia sẻ kinh nghiệm đọc sách hiệu quả</p>
                        </div>
                    </div>
                </header>
                <div className="container">
                    <div className="row">
                        <div className="col-lg-8">
                            <div className="card mb-4">
                                <a href="/bai-viet/cach-doc-sach-nhu-the-nao"><img className="card-img-top" src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." /></a>
                                <div className="card-body">
                                    <div className="small text-muted">January 1, 2023</div>
                                    <h2 className="card-title">Featured Post Title</h2>
                                    <p className="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
                                    <a className="btn btn-primary" href="">Read more →</a>
                                </div>
                            </div>
                            <div className="row">
                                <div className="col-lg-6">
                                    <div className="card mb-4">
                                        <a href=""><img className="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
                                        <div className="card-body">
                                            <div className="small text-muted">January 1, 2023</div>
                                            <h2 className="card-title h4">Post Title</h2>
                                            <p className="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
                                            <a className="btn btn-primary" href="">Read more →</a>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-lg-6">
                                    <div className="card mb-4">
                                        <a href=""><img className="card-img-top" src="https://dummyimage.com/700x350/dee2e6/6c757d.jpg" alt="..." /></a>
                                        <div className="card-body">
                                            <div className="small text-muted">January 1, 2023</div>
                                            <h2 className="card-title h4">Post Title</h2>
                                            <p className="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla.</p>
                                            <a className="btn btn-primary" href="">Read more →</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <nav aria-label="Pagination">

                            </nav>
                        </div>
                        <IncSidebar />
                    </div>
                </div>
            </div>
        </div>
    );
}

export default MenuPage;
