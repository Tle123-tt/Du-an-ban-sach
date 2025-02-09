import React, {useEffect, useState} from "react";
import {Breadcrumb, Button, Col, Container, Dropdown, DropdownButton, Form, Row, Table} from "react-bootstrap";
import SidebarAdm from "../components/_inc_sidebar_adm";
import Skeleton from "react-loading-skeleton";
import {Link} from "react-router-dom";
import ReactPaginate from "react-paginate";
import userAdminService from "../../../api/admin/userAdminService";

const metaDefault = {
    page: 1,
    page_size: 10,
    total: 0,
    total_page: 0
}

function AdminUserPage() {
    const [users, setUser] = useState([]);
    const [loading, setLoading] = useState(true);
    const [meta, setMeta] = useState(metaDefault);
    const [currentPage, setCurrentPage] = useState(1);

    const getListsUser = async () => {
        let params = {
            page_size: 8,
            page: currentPage
        };

        const response = await userAdminService.getListsUser(params);
        console.log('-------------- response get user: ', response);
        if (response?.status === 200) {
            setUser(response?.data);
            setMeta(response.meta);
            setLoading(false);
        }
    }

    const handlePageClick = (event) => {
        let page = event.selected;
        setCurrentPage(event.selected);
        // getListsUser();
    }

    useEffect(() => {
        getListsUser().then(r => {});
    }, []);
    return (
        <>
            <Container>
                <Row>
                    <Col xl={2}><SidebarAdm/></Col>
                    <Col xl={10}>
                        <div className='breabreadcrumb'>
                            <Breadcrumb>
                                <Breadcrumb.Item to="/">Trang chủ</Breadcrumb.Item>
                                <Breadcrumb.Item>
                                    Admin
                                </Breadcrumb.Item>
                                <Breadcrumb.Item active>User</Breadcrumb.Item>
                            </Breadcrumb>
                        </div>
                        <h4>Danh sách thành viên</h4>
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
                        {loading === true ? (
                            <>
                                <Skeleton count={20}/>
                            </>
                        ) : (
                            <>
                                <Table responsive>
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Avatar</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>#</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    {users.map((item, index) => (
                                        <tr key={index}>
                                            <td>{item.id}</td>
                                            <td>
                                                <Link to={'/'} title={item.name}>
                                                    <img src={item.avatar} style={{width: '40px', height: '40px'}}/>
                                                </Link>
                                            </td>
                                            <td>{item.name}</td>
                                            <td>{item.email}</td>

                                            <td>
                                                <DropdownButton
                                                    className={'dropdown-button-customer'} size={'sm'}
                                                    variant={'Secondary'}
                                                    key={item.id} title="...">
                                                    <Dropdown.Item>Chỉnh sửa</Dropdown.Item>
                                                    <Dropdown.Item>Xoá</Dropdown.Item>
                                                </DropdownButton>
                                            </td>
                                        </tr>
                                    ))}
                                    </tbody>
                                </Table>
                                <div className='customer-paginate'>
                                    <ReactPaginate
                                        previousLabel="Trang trước"
                                        nextLabel="Trang sau"
                                        pageCount={meta.total_page}
                                        onPageChange={handlePageClick}
                                        containerClassName={'pagination'}
                                        activeClassName={'active'}
                                    />
                                </div>
                            </>
                        )}

                    </Col>
                </Row>
            </Container>
        </>
    )
}

export default AdminUserPage;
