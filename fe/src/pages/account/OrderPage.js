import {Badge, Breadcrumb, Col, Container, Row} from "react-bootstrap";
import React, {useEffect, useState} from "react";
import SidebarAccount from "./include/_inc_sidebar";
import "./../../assets/pages/account.scss";
import CartApi from "../../api/CartService";
import {Link} from "react-router-dom";
import {FaStar, FaTrash} from "react-icons/fa";
import Skeleton from "react-loading-skeleton";
import Moment from 'react-moment';
import AuthApi from "../../api/AuthApi";
import ModalVote from "./include/_inc_modal_vote";
import Button from "react-bootstrap/Button";
import {buildImage, onErrorImage} from "../utils/util_price";

function OrderPage()
{
    const [loadingOrder, setLoadingOrder] = useState(true);
    const [orders, setOrders] = useState([]);
    const [user_id, setUserId] = useState(0);
    const [configStatus, setConfigStatus] = useState([]);
    const [productVote, setProductVote] = useState(null);
    const [showModal, setShowModal] = useState(false);

    const getOrderList = async () => {
        let page = 1;
        let page_size = 10;
        const response = await CartApi.getTransaction(page, page_size);
        console.log('------------- response@getTransaction');
        if (response?.status === 200) {
            setLoadingOrder(false);
            setOrders(response?.data?.orders);
        }
    }

    const configStatusTransaction = async () => {
        const response = await CartApi.showConfig();
        console.log("===============response: configStatusTransaction ", response?.data.status);
        if (response?.status === 200) {
            console.log('=============== SET');
            setConfigStatus(response?.data.status);
        }
    }

    const getStatus = (status) => {

        for(let i = 0 ; i < configStatus.length;  i++) {
            if (configStatus[i].value === status){
                return configStatus[i];
            }
        }

        return "";
    }

    const getUser = async() => {
        try {
            let response = await AuthApi.getProfile();
            if(response?.status === 200)
            {
                setUserId(response?.data._id);
            }
        } catch (e) {
            console.log("-----Expired");
        }
    }

    const handleVote = (product) => {
        setShowModal(true);
        setProductVote(product);
        console.log('------------- product: ', product);
    }

    useEffect(() => {
        getOrderList().then(r => {});
        configStatusTransaction().then(r => {});
        getUser().then(r => {});
    }, []);

    return (
        <Container className="mt-3">
            <ModalVote showModal={showModal} product={productVote} setShowModal={setShowModal} userID={user_id}  />
            <Row>
                <Col xl={2}><SidebarAccount/></Col>
                <Col xl={8}>
                    <div className='breadcrumbs'>
                        <Breadcrumb>
                            <Breadcrumb.Item to="/">Trang chủ</Breadcrumb.Item>
                            <Breadcrumb.Item active>Đơn hàng của bạn</Breadcrumb.Item>
                        </Breadcrumb>
                    </div>
                    <div className={'list-orders'}>
                        { loadingOrder === true ? (
                            <div className="order-items">
                                <Skeleton count={5} />
                            </div>
                        ) : (
                            <>
                                {orders && orders.map((item, index) => (
                                    <div className="order-items" key={index}>
                                        <p className="item-header">
                                            <span><b style={{paddingRight: "4px"}}>Đơn hàng #{item._id}</b>
                                            Ngày tạo <Moment date={item.created_at}  format="YYYY/MM/DD"/></span>
                                            <div className={'d-flex'}>
                                                <Badge style={{ display: "flex", alignItems: "center"}} className={getStatus(item.status)?.text} bg={getStatus(item.status)?.class}>{getStatus(item.status)?.name}</Badge>
                                                <span className='item-delete text-danger' style={{ marginLeft: "10px"}}>
                                                    <FaTrash /> Huỷ đơn
                                                </span>
                                            </div>
                                        </p>
                                        {item.transactions.length && (
                                            <>
                                                <div className='list-carts'>
                                                    {item.transactions.map((transaction, key) => (
                                                        <div className="items" key={key}>
                                                            <div className="image">
                                                                <Link to={`/san-pham/${transaction.slug}`}>
                                                                    {/*<img src={transaction.avatar} />*/}
                                                                    <img src={ buildImage(transaction.avatar) } alt={ transaction.name } onError={ onErrorImage } />
                                                                </Link>
                                                            </div>
                                                            <div className="info">
                                                                <Link to={`/san-pham/${transaction.product.slug}`}>
                                                                    <h4>{transaction.name}</h4>
                                                                </Link>
                                                                <div className={'d-flex'}>
                                                                    <span className='item-delete m-lg-2' onClick={() => handleVote(transaction)} >
                                                                        <FaStar /> Viết đánh giá
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div className="price">
                                                                <span>{transaction.quantity} x {transaction.price.toLocaleString()} đ</span>
                                                                {/*<span><sub className='discount'>20.000.000 đ</sub></span>*/}
                                                            </div>
                                                        </div>
                                                    ))}
                                                </div>
                                            </>
                                        )}
                                    </div>
                                ))}
                            </>
                        )}
                        </div>
                </Col>
            </Row>
        </Container>
    )
}

export default OrderPage;
