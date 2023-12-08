import {Breadcrumb, Col, Container, Row} from "react-bootstrap";
import React, {useState} from "react";
import "./../../assets/pages/account.scss";
import {useDispatch} from "react-redux";
import AuthApi from "../../api/AuthApi";
import {setTokenLogin} from "../../store/AuthSlice";
import Swal from "sweetalert2";
import {Link} from "react-router-dom";
function RegisterPage()
{
    const [password, setPassword] = useState("");
    const [name, setName] = useState("");
    const [email, setEmail] = useState("");
    const [phone, setPhone] = useState("");
    const [username, setUsername] = useState("");
    const [passwordError, setPasswordError] = useState("");
    const [usernameError, setUsernameError] = useState("");
    const [nameError, setNameError] = useState("");
    const [emailError, setEmailError] = useState("");
    const [phoneError, setPhoneError] = useState("");

    const loginSubmit = (e) => {
        e.preventDefault();
        handleValidation().then(r => {});
    }


    const dispatch = useDispatch();

    const handleValidation = async (event)  => {
        console.log('=============== CHECK');
        let formIsValid = true;
        if (!username.match(/^[a-z0-9]{5,22}$/)) {
            formIsValid = false;
            setUsernameError(
                "Username phải có độ dài từ 5 đến 22 ký tự"
            );
            return false;
        } else {
            console.log('----------- username: ', username);
            setUsernameError("");
            formIsValid = true;
        }

        if (!password.match(/^[a-z0-9]{5,22}$/)) {
            formIsValid = false;
            setPasswordError(
                "Password phải từ 5 đến 22 ký tự"
            );
            return false;
        } else {
            console.log('----------- password: ', password);
            setPasswordError("");
            formIsValid = true;
        }

        if (!name) {
            formIsValid = false;
            setNameError(
                "Tên không được để trống"
            );
            return false;
        } else {
            setNameError("");
            formIsValid = true;
        }

        if (!email) {
            formIsValid = false;
            setEmailError(
                "Email không được để trống"
            );
            return false;
        } else {
            setEmailError("");
            formIsValid = true;
        }

        console.log('----------- PASS');

        if (formIsValid === true) {
            console.log('------------- LOGIN');
            let results = await AuthApi.register({
                username: username,
                password: password,
                name: name,
                phone: phone,
                email: email,
                address: 'Hà Nội'
            });

            console.log('---------- results: ', results);

            if (results.status === 200) {
                localStorage.setItem("user", JSON.stringify(results.data));
                const token = localStorage.getItem("user");
                const tokenString = JSON.parse(token);
                localStorage.setItem("accessToken", tokenString.accessToken);
                dispatch(setTokenLogin(results.data));
                window.location.href = '/';
            } else {
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: 'Có lỗi xẩy ra, xin vui lòng thử lại',
                    showConfirmButton: false,
                    timer: 1500
                })
            }
        }
    }

    return (
        <Container className={'auth'}>
            <Row>
                <Col xl={12}>
                    <div className='breadcrumbs'>
                        <Breadcrumb>
                            <Breadcrumb.Item to="/">Trang chủ</Breadcrumb.Item>
                            <Breadcrumb.Item>
                                Auth
                            </Breadcrumb.Item>
                            <Breadcrumb.Item active>Đăng nhập</Breadcrumb.Item>
                        </Breadcrumb>
                    </div>
                </Col>
                <Col xl={{span: 4, offset: 4}}>
                    <form  onSubmit={loginSubmit} className="mb-5">
                        <div className="form-group mb-3">
                            <label>Họ tên</label>
                            <input
                                type="text"
                                className="form-control"
                                name="name"
                                placeholder="Name"
                                onChange={(event) => setName(event.target.value)}
                            />
                            <small id="emailHelp" className="text-danger form-text">
                                {nameError}
                            </small>
                        </div>
                        <div className="form-group mb-3">
                            <label>Email</label>
                            <input
                                type="text"
                                className="form-control"
                                name="email"
                                placeholder="email"
                                onChange={(event) => setEmail(event.target.value)}
                            />
                            <small id="emailHelp" className="text-danger form-text">
                                {emailError}
                            </small>
                        </div>
                        <div className="form-group mb-3">
                            <label>Phone</label>
                            <input
                                type="number"
                                className="form-control"
                                name="phone"
                                placeholder="09..."
                                onChange={(event) => setPhone(event.target.value)}
                            />
                            <small id="emailHelp" className="text-danger form-text">
                                {phoneError}
                            </small>
                        </div>
                        <div className="form-group mb-3">
                            <label>Tài khoản đăng nhập</label>
                            <input
                                type="text"
                                className="form-control"
                                name="username"
                                placeholder="Username"
                                onChange={(event) => setUsername(event.target.value)}
                            />
                            <small id="emailHelp" className="text-danger form-text">
                                {usernameError}
                            </small>
                        </div>
                        <div className="form-group mb-3">
                            <label>Password</label>
                            <input
                                type="password"
                                className="form-control"
                                placeholder="Password"
                                onChange={(event) => setPassword(event.target.value)}
                            />
                            <small className="text-danger form-text">
                                {passwordError}
                            </small>
                        </div>
                        <div className={'d-flex justify-content-between align-items-center'}>
                            <button type="submit" className="btn btn-primary">
                                Đăng ký
                            </button>
                            <Link to={'/auth/register'} >Đăng nhập</Link>
                        </div>
                    </form>
                </Col>
            </Row>
        </Container>
    )
}

export default RegisterPage;
