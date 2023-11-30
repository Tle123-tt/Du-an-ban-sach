import {Breadcrumb, Col, Container, Form, Row, Table} from "react-bootstrap";
import React, {useEffect, useState} from "react";
import {useDispatch, useSelector} from "react-redux";
import {Link, useNavigate} from "react-router-dom";
import {FaTrash} from "react-icons/fa";
import {
    addToCart,
    decrementQuantity,
    incrementQuantity,
    removeAll,
    removeCartAll,
    removeItem
} from "../../store/CartSlice";
import Swal from "sweetalert2";
import CartApi from "../../api/CartService";
import AuthApi from "../../api/AuthApi";

function CartPage() {
    const dispatch = useDispatch();
    const [name, setName] = useState('');
    const [phone, setPhone] = useState('');
    const navigate = useNavigate();
    const [user_id, setUserId] = useState(0);
    const carts = useSelector((state) => state.cartReduce.listCart);
    let price_total = 0;

    const deleteCart = async (product) => {
        Swal.fire({
            title: 'Bạn có chắc chắn xoá sản phẩm trong giỏ hàng ko?',
            showDenyButton: true,
            showCancelButton: false,
            confirmButtonText: 'Xoá',
            denyButtonText: `Huỷ bỏ`,
        }).then((result) => {
            if (result.isConfirmed) {
                dispatch(removeItem(product));
            }
        })
    }

    const addOrder = async () => {
        console.log('--------------- Mua hàng ');
        let total = 0;
        let order = {};
        let transactions = [];

        carts.forEach((item, index) => {
            transactions.push({
                id: item.id,
                name: item.pro_name,
                quantity: item.quantity,
                discount_type: "money",
                discount_value: 0,
                price: item.pro_price,
                total_price: item.pro_price,
            });

            total += item.pro_price * item.quantity;
        });

        order.name = name;
        order.phone = phone;

        order.products = transactions;
        order.note = "abc";
        order.total_price = total;
        order.t_user_id = user_id;

        console.log('------------ order: ', order);
        const createCart = await CartApi.createTransaction(order);
        if (createCart.status === 200) {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Đơn hàng được lưu thành công',
                showConfirmButton: false,
                timer: 1500
            })
            dispatch(removeCartAll());
            navigate('/', { replace: true });
        } else {

        }

        if (createCart.status === 500 && createCart.message === "error") {
            console.log("Error create!!!");
        }
    }

    // tăng
    const increaseQty = async (product) => {
        if (product.pro_number <= product.quantity) {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Số lượng sản phẩm không đủ?',
                showConfirmButton: false,
                timer: 1500
            })
            return false;
        }

        const objProduct = {...product};
        objProduct.quantity +=  1;
        dispatch(incrementQuantity(objProduct))
    }

    // giảm
    const reduceQty = async (product) => {
        if (product.quantity === 1) {
            Swal.fire({
                position: 'top-end',
                icon: 'error',
                title: 'Số lượng qty >= 1?',
                showConfirmButton: false,
                timer: 1500
            })
            return false;
        }
        const objProduct = {...product};
        objProduct.quantity -=  1;
        dispatch(decrementQuantity(objProduct));
    }


    function getTotal() {
        carts.map((item) => {
            price_total += item.quantity * item.pro_price;
        });
        return price_total.toLocaleString();
    }

    const getUser = async() => {
        try {
            let response = await AuthApi.getProfile();
            if(response.status === 200)
            {
                setUserId(response.data.id);
                setName(response.data.name);
                setPhone(response.data.phone);
                console.log('------------ response.data.name: ', response.data.name);
            }

            console.log('============ getProfile@response; ', response);
        } catch (e) {
            console.log("-----Expired");
        }
    }

    useEffect(() => {
        getUser().then(r => {});
    }, []);

    return(
        <>
            <Container>
                <Row>
                    <Col xl={{span: 6, offset: 3}} md={{span: 6, offset: 3}}>
                        <div className='' style={{ marginTop:"15px"}}>
                            <Breadcrumb>
                                <Breadcrumb.Item to="/">Trang chủ</Breadcrumb.Item>
                                <Breadcrumb.Item active>Giỏ hàng</Breadcrumb.Item>
                            </Breadcrumb>
                        </div>
                        <div>
                            <div className='list-carts'>
                                {carts && carts.map((item, index) => (
                                    <div className="items" key={index}>
                                        <div className="image">
                                            <Link to={`/san-pham/${item.pro_slug}`}>
                                                <img src={item.pro_avatar} />
                                            </Link>
                                            <span className='item-delete' onClick={() => deleteCart(item)}>
                                                <FaTrash /> Xoá
                                            </span>
                                        </div>
                                        <div className="info">
                                            <Link to={`/san-pham/${item.pro_slug}`}>
                                                <h4>{item.pro_name}</h4>
                                            </Link>
                                        </div>
                                        <div className="price">
                                            <span>120.000 đ</span> <span><sub className='discount'>20.000.000 đ</sub></span>
                                            <div className="box-qty-add-cart">
                                                <div className="box">
                                                    <button onClick={() => reduceQty(item)}>-</button>
                                                    <input type="number" readOnly value={item.quantity}  />
                                                    <button onClick={() => increaseQty(item)}>+</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                ))}
                                <div className='total-cart'>
                                    <span>Tạm tính ({(carts && carts.length) ? carts.length : 0} sản phẩm)</span>
                                    <span>{getTotal()} vnđ</span>
                                </div>
                            </div>
                            <div className="info-guest">
                                <h5>Thông tin khách hàng</h5>
                                <Row>
                                    <Col xs={6}>
                                        <Form.Group className="mb-3" controlId="formBasicEmail">
                                            <Form.Control type="text"  placeholder="Họ tên" value={name} onChange={(event) => setName(event.target.value)} />
                                        </Form.Group>
                                    </Col>
                                    <Col xs={6}>
                                        <Form.Group className="mb-3" controlId="formBasicEmail">
                                            <Form.Control type="phone" value={phone} placeholder="Số điện thoại" onChange={(event) => setPhone(event.target.value)} />
                                        </Form.Group>
                                    </Col>
                                </Row>
                            </div>
                            <button type="submit" onClick={addOrder} className="btn btn-danger w-100 mb-5">Đặt hàng</button>
                        </div>
                    </Col>
                </Row>
            </Container>
        </>
    )
}

export default CartPage;
