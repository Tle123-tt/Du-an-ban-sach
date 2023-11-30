import {Breadcrumb, Button, Col, Container, Form, Row} from "react-bootstrap";
import React, {useEffect, useState} from "react";
import SidebarAccount from "./include/_inc_sidebar";
import "./../../assets/pages/account.scss";
import AuthApi from "../../api/AuthApi";
import Swal from 'sweetalert2';
function ProfilePage()
{
    const [user, setUser] = useState([]);
    const [address, setAddress] = useState('');
    const [phone, setPhone] = useState('');
    const [name, setName] = useState('');

    const getUser = async() => {
        try {
            let response = await AuthApi.getProfile();
            if(response.status === 200)
            {
                setUser(response.data);
                setAddress(response.data.address);
                setPhone(response.data.phone);
                setName(response.data.name);
            }

            console.log('============ getProfile@response; ', response);
        } catch (e) {
            console.log("-----Expired");
        }
    }

    const updateProfile = async (event) => {
        event.preventDefault();
        let formData = {
            name: event.target.name.value,
            address: event.target.address.value,
            phone: event.target.phone.value,
        }

        const response = await AuthApi.updateInfo(formData);
        console.log('------------------ updateProfile@response', response);

        if(response.status === 200) {
            Swal.fire('Cập nhật thông tin thành công');
        }else {
            Swal.fire({
                title: 'Error!',
                text: 'Cập nhật thông tin thất bại',
                icon: 'error',
                // confirmButtonText: 'Cool'
            })
        }
    }

    useEffect(() => {
        getUser().then(r => {});
    }, []);


    return (
        <Container className="mt-3">
            <Row>
                <Col xl={2}><SidebarAccount/></Col>
                <Col xl={10}>
                    <div className='breadcrumbs'>
                        <Breadcrumb>
                            <Breadcrumb.Item to="/">Trang chủ</Breadcrumb.Item>
                            <Breadcrumb.Item>Tài khoản</Breadcrumb.Item>
                            <Breadcrumb.Item active>Cập nhật thông tin</Breadcrumb.Item>
                        </Breadcrumb>
                    </div>
                    <div style={{ margin:"20px 0"}}>
                        <Form onSubmit={updateProfile}>
                            <Row>
                                <Col xl={6}>
                                    <Form.Group className="mb-3" controlId="formBasicEmail">
                                        <Form.Label>Username</Form.Label>
                                        <Form.Control disabled type="text" value={user?.username || ''} placeholder="username" />
                                        <Form.Text className="text-muted">
                                            Username không được thay đổi
                                        </Form.Text>
                                    </Form.Group>
                                </Col>

                                <Col xl={6}>
                                    <Form.Group className="mb-3" controlId="formBasicPassword">
                                        <Form.Label>Họ tên</Form.Label>
                                        <Form.Control name="name"
                                                      onChange={(event) => setName(event.target.value)}
                                                      type="text" value={name} placeholder="Họ tên" />
                                    </Form.Group>
                                </Col>
                                <Col xl={6}>
                                    <Form.Group className="mb-3" controlId="formBasicPassword">
                                        <Form.Label>Số điện thoại</Form.Label>
                                        <Form.Control name="phone" type="text"
                                                      onChange={(event) => setPhone(event.target.value)}
                                                      value={phone} placeholder="09..." />
                                    </Form.Group>
                                </Col>
                                <Col xl={6}>
                                    <Form.Group className="mb-3" controlId="formBasicPassword">
                                        <Form.Label>Địa chỉ</Form.Label>
                                        <Form.Control name="address"
                                                      value={address}
                                                      onChange={(event) => setAddress(event.target.value)}  type="text"
                                                      placeholder="Quỳnh Lưu - Nghệ An" />
                                    </Form.Group>
                                </Col>
                            </Row>
                            <Button variant="primary" type="submit">
                                Lưu thông tin
                            </Button>
                        </Form>
                    </div>
                </Col>
            </Row>
        </Container>
    )
}

export default ProfilePage;
