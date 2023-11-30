import React, {useEffect, useState} from "react";
import {Badge, Breadcrumb, Button, Col, Container, Dropdown, DropdownButton, Form, Row, Table} from "react-bootstrap";
import SidebarAdm from "../components/_inc_sidebar_adm";
import Skeleton from "react-loading-skeleton";
import {Link} from "react-router-dom";
import Moment from "react-moment";
import {FaTrash} from "react-icons/fa";
import CartApi from "../../../api/CartService";
import TransactionAdminService from "../../../api/admin/transactionAdminService";

const metaDefault = {
    page: 1,
    page_size: 10,
    total: 0,
    total_page: 0
}

function AdminTransactionPage() {
    const [loading, setLoading] = useState(true);
    const [currentPage, setCurrentPage] = useState(1);
    const [loadingOrder, setLoadingOrder] = useState(true);
    const [orders, setOrders] = useState([]);
    const [configStatus, setConfigStatus] = useState([]);

    const getOrderList = async () => {
        let page = 1;
        let page_size = 10;
        const response = await CartApi.getTransaction(page, page_size);
        console.log('------------ response: ', response);
        if (response.status === 200) {
            setLoadingOrder(false);
            setOrders(response.data);
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

    const configStatusTransaction = async () => {
        const response = await CartApi.showConfig();
        if (response.status === 200) {
            setConfigStatus(response.data.status);
        }
    }

    const handleApproved = async (item) => {
        const response = await TransactionAdminService.updateStatus(item.id, {
            status: 4
        });
        if (response.status === 200) {
            await getOrderList();
        }
    }

    const handleCancel = async (item) => {
        const response = await TransactionAdminService.updateStatus(item.id, {
            status: -1
        });
        if (response.status === 200) {
            await getOrderList();
        }
    }

    useEffect(() => {
        getOrderList().then(r => {});
        configStatusTransaction().then(r => {});
    }, []);

    return (
        <>
            <Container>
                <Row className={'mt-3'}>
                    <Col xl={2}><SidebarAdm/></Col>
                    <Col xl={10}>
                        <div className={'list-orders'}>
                            <div className='breabreadcrumb'>
                                <Breadcrumb>
                                    <Breadcrumb.Item to="/">Trang chủ</Breadcrumb.Item>
                                    <Breadcrumb.Item>
                                        Admin
                                    </Breadcrumb.Item>
                                    <Breadcrumb.Item active>Transaction</Breadcrumb.Item>
                                </Breadcrumb>
                            </div>
                            <h4>Danh sách đơn hàng</h4>
                            <Form className={''} method={'get'}>
                                <Row>
                                    <Col xl={2}>
                                        <Form.Group className="mb-3" controlId="formBasicName">
                                            <Form.Control name={'n'} type="text" placeholder="Enter name"/>
                                        </Form.Group>
                                    </Col>
                                    <Col xl={2}>
                                        <Button variant="primary" type="submit">
                                            Filter
                                        </Button>
                                    </Col>
                                </Row>
                            </Form>
                            {loadingOrder === true ? (
                                <>
                                    <Skeleton count={20}/>
                                </>
                            ) : (
                                <>
                                    {orders && orders.map((item, index) => (
                                        <div className="order-items" key={index}>
                                            <div className="item-header">
                                                <span>
                                                    <b style={{paddingRight: "4px"}}>Đơn hàng #{item.id}</b>
                                                    Ngày tạo <Moment date={item.created_at}  format="YYYY/MM/DD"/>
                                                </span>
                                                <div className={'d-flex'}>
                                                    <Badge style={{ marginRight: "5px", display:"flex",alignItems:"center", height: "22px"}} className={getStatus(item.t_status)?.text} bg={getStatus(item.t_status)?.class}>{getStatus(item.t_status)?.name}</Badge>
                                                    <DropdownButton
                                                        className={'dropdown-button-customer'} size={'sm'}
                                                        variant={'Secondary'}
                                                        key={item.id} title="...">
                                                        <span onClick={() => handleApproved(item)} className={'item-drop d-block'}>Duyệt</span>
                                                        <span onClick={() => handleCancel(item)} className={'item-drop d-block'}>Huỷ đơn</span>
                                                    </DropdownButton>
                                                </div>
                                            </div>
                                            {item.orders.length && (
                                                <>
                                                    <div className='list-carts'>
                                                        {item.orders.map((order, key) => (
                                                            <div className="items" key={key}>
                                                                <div className="image">
                                                                    <Link to={`/san-pham/${order.pro_slug}`}>
                                                                        <img src={order.product.pro_avatar} />
                                                                    </Link>
                                                                </div>
                                                                <div className="info">
                                                                    <Link to={`/san-pham/${order.product.pro_slug}`}>
                                                                        <h4>{order.product.pro_name}</h4>
                                                                    </Link>
                                                                    {/*<span className='item-delete' >*/}
                                                                    {/*    <FaTrash /> huỷ bỏ*/}
                                                                    {/*</span>*/}
                                                                </div>
                                                                <div className="price">
                                                                    <span>{order.od_qty} x {order.od_total_price.toLocaleString()} đ</span>
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
        </>
    )
}

export default AdminTransactionPage;
