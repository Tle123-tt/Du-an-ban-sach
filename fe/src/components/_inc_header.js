import React, {useEffect, useState} from 'react';
import {Button, Container, Form, Nav, Navbar, NavDropdown} from 'react-bootstrap';
import {Link, useLocation, useNavigate} from 'react-router-dom';
import AuthApi from "../api/AuthApi";
import {FaShoppingCart} from "react-icons/fa";
import {useSelector} from "react-redux";
import MenuService from '../api/MenuService';
function HeaderCpn()
{
    const [user, setUser] = useState([]);
    const [menu, setMenu] = useState([]);
    const [keyword, setKeyword] = useState('');
    const navigate = useNavigate();
    const location = useLocation()

    const getUser = async() => {
        try {
            let response = await AuthApi.getProfile();
            if(response?.status === 200)
                setUser(response?.data);

        } catch (e) {
            console.log("-----Expired");
        }
    }

    const cart = useSelector((state) => state.cartReduce.listCart);

    const logout = (e) => {
        e.preventDefault();
        localStorage.removeItem("user");
        window.location.reload();
        navigate("/");
    }


    const clickSearch = (e) => {
        navigate(`/search?keyword=${keyword}`)
    }

    useEffect(() => {
        getUser().then(r => {});
        getMenu();
    }, []);

	const getMenu = async () => {
		const response = await MenuService.getList({page: 1, page_size: 1000, status: 1});
		if(response?.status === 200) {
			setMenu(response?.data?.menus)
		}
	}

    return (
        <>
            <div className="fhs-header-top-banner w-100" style={{ backgroundColor: "#34B282"}}>
                <p className={'mb-0 container'}>
                    <a href="https://www.fahasa.com/deli?fhs_campaign=topbanner">
                        <img className={'w-100'} src="https://cdn0.fahasa.com/media/wysiwyg/Thang-12-2023/Diamond_T1223_Ver2_DeliHeader_1263x60.jpg" alt="" /></a>
                </p>
            </div>
            <Navbar collapseOnSelect expand="lg"  className='header'>
                <Container>
                    <Navbar.Brand>
                        <Link to={"/"}>
                            <img src={'https://cdn0.fahasa.com/skin/frontend/ma_vanese/fahasa/images/logo/fahasa_logo.png'}  alt={"123code.net"}/>
                        </Link>
                    </Navbar.Brand>
                    <Navbar.Toggle aria-controls="responsive-navbar-nav" />
                    <Navbar.Collapse id="responsive-navbar-nav">
                        <Nav className="me-auto">
                            <Link to={`/san-pham`} className='nav-item'>Sản phẩm</Link>
                            {/*<Link to="/admin/category" className='nav-item'> [-> Admin]</Link>*/}
                            <NavDropdown title={"Tin tức"} id="collasible-nav-dropdown2">
								{
									menu?.length > 0 &&
									menu.map((item, key) => {
										return (
											<Link key={key} data-rr-ui-dropdown-item className={"dropdown-item"} role="button" to={`tin-tuc-chuyen-muc/${item?.slug}`}>{item?.name}</Link>
										)
									})
								}
                            </NavDropdown>
                        </Nav>
                        <Form className="d-flex">
                            <Form.Control
                                type="search"
                                name='keyword'
                                placeholder="Tìm kiếm"
                                className="me-2"
                                onChange={(event) => setKeyword(event.target.value)}
                                aria-label="Search"
                            />
                            <Button variant="outline-success" onClick={clickSearch}>Search</Button>
                        </Form>
                        <Nav className='header-account'>
                            <Nav.Link >
                                <img src="https://lh5.googleusercontent.com/-2xmuUdXe0so/AAAAAAAAAAI/AAAAAAAACgQ/OOJcACbRFYs/photo.jpg" alt='123code.net' />
                            </Nav.Link>
                            <Link to={'/cart'} className={'icon-cart nav-link'}>
                                <FaShoppingCart /> <span>({cart ? cart.length : 0})</span>
                            </Link>
                            <NavDropdown title={(user && user.name) ? user.name : 'Tài khoản'} id="collasible-nav-dropdown">
                                {user && user.name ? (
                                    <>
                                        <Link data-rr-ui-dropdown-item className={"dropdown-item"} role="button" to={`account/profile/`}>Cập nhật thông tin</Link>
                                        <Link data-rr-ui-dropdown-item className={"dropdown-item"} role="button" to={`account/order/`}>Lịch sử đơn hàng</Link>
                                        <NavDropdown.Divider />
                                        <NavDropdown.Item onClick={logout}>Đăng xuất</NavDropdown.Item>
                                    </>
                                ) : (
                                    <Link data-rr-ui-dropdown-item className={"dropdown-item"} role="button" to={`auth/login`}>Đăng nhập</Link>
                                )}
                            </NavDropdown>
                        </Nav>
                    </Navbar.Collapse>
                </Container>
            </Navbar>
        </>
    );
}

export default HeaderCpn;

