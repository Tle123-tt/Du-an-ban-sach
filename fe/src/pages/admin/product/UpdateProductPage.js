import {Breadcrumb, Button, Col, Container, Form, Row} from "react-bootstrap";
import SidebarAdm from "../components/_inc_sidebar_adm";
import React, {useEffect, useState} from "react";
import {useNavigate, useParams} from "react-router-dom";
import productAdminService from "../../../api/admin/productAdminService";
import categoryAdminService from "../../../api/admin/categoryAdminService";
import productService from "../../../api/productService";

function UpdateProductPage() {
    const {id} = useParams();
    const [name, setName] = useState('');
    const [avatar, setAvatar] = useState('');
    const [desc, setDesc] = useState('');
    const [status, setStatus] = useState(1);
    let [product, setProduct] = useState(1);
    let [number, setNumber] = useState(0);
    let [price, setPrice] = useState(0);
    const [categoryId, setCategoryId] = useState(0);
    const [categories, setCategories] = useState([]);

    const navigate = useNavigate();

    const findOneProductById = async () => {
        const response = await productAdminService.findById(id);
        if (response.status === 200) {
            setProduct(response.data);
            setName(response.data.name);
            setAvatar(response.data.avatar);
            setDesc(response.data.description);
            setNumber(response.data.number);
            setCategoryId(response.data.category_id);
            setPrice(response.data.price);
            setStatus(response.data.active);
        }
    }

    const updateProduct = async (e) => {
        e.preventDefault();

        let newProduct = {...product};
        newProduct.name = name;
        newProduct.description = desc;
        newProduct.discount_value = '0';
        newProduct.price = price;
        newProduct.number = number;
        newProduct.category_id = parseInt(categoryId);
        newProduct.avatar = avatar;
        console.log('---------- new product: ', newProduct);

        const results = await productAdminService.updateProduct(newProduct, id);
        console.log('---------- UPDATE: ', results)
        if (results.status === 200) {
            navigate("/admin/product/");
        }
    }

    const getAllCategory = async (e) => {
        const results = await categoryAdminService.getListsCategory({
            page_size : 1000
        });
        if (results.status) {
            setCategories(results.data);
        }
    }

    const handleChangeCategory = async (e) => {
        setCategoryId(e.target.value);
    }

    const uploadImage = async (e) => {

        if ( e && e.target.files[0] )
        {
            let formData = new FormData();

            console.log('---------- e.target.files[0]', e.target.files[0]);
            let content = e.target.files[0];
            console.log('---------- e.target.files[0]', content);
            formData.append("file", content);
            const results = await productService.uploadFile(formData);
            if (results.status === 200) {
                setAvatar(results.data.destination);
            }
            console.log('---------- response upload: ', results)
        }
    }

    useEffect(() => {
        findOneProductById().then(r => {});
        getAllCategory().then(r => {});
    }, [id]);

    return (
        <>
            <Container>
                <Row className={'mt-2'}>
                    <Col xl={2}><SidebarAdm /></Col>
                    <Col xl={10}>
                        <div className='breabreadcrumb'>
                            <Breadcrumb>
                                <Breadcrumb.Item to="/">Trang chủ</Breadcrumb.Item>
                                <Breadcrumb.Item href="/admin">
                                    Admin
                                </Breadcrumb.Item>
                                <Breadcrumb.Item active>Product</Breadcrumb.Item>
                            </Breadcrumb>
                        </div>
                        <Form onSubmit={updateProduct} encType="multipart/form-data">
                            <Row>
                                <Col xl={8}>
                                    <Form.Group className="mb-3" controlId="formBasicEmail">
                                        <Form.Label>Tên sản phẩm</Form.Label>
                                        <Form.Control
                                            value={name}
                                            type="text" placeholder="Name"
                                            onChange={(event) => setName(event.target.value)}
                                        />
                                    </Form.Group>
                                    <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
                                        <Form.Label>Mô tả</Form.Label>
                                        <Form.Control
                                            as="textarea" rows={3}
                                            value={desc}
                                            onChange={(event) => setDesc(event.target.value)}
                                        />
                                    </Form.Group>
                                    <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
                                        <Form.Label>Avatar</Form.Label>
                                        <Form.Control
                                            name={'file'}
                                            type="file" rows={3}
                                            accept="image/"
                                            onChange={ ( e ) => { uploadImage( e ) } }
                                        />
                                    </Form.Group>
                                </Col>
                                <Col xl={3}>
                                    <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
                                        <Form.Label>Danh mục</Form.Label>
                                        <Form.Select value={categoryId} onChange={handleChangeCategory} aria-label="Default select example">
                                            <option>Mời bạn chọn danh mục</option>
                                            { categories && categories.length > 0 && categories.map((item, index) => (
                                                <option key={index} value={ item.id }>{item.name}</option>
                                            ))}
                                        </Form.Select>
                                    </Form.Group>
                                    <Form.Check
                                        type="switch"
                                        id="custom-switch"
                                        label="Hiển thị"
                                        defaultChecked={status === 1 ? true : false}
                                        onChange={(event) => setStatus(event.target.value)}
                                    />
                                    <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
                                        <Form.Label>Số lượng</Form.Label>
                                        <Form.Control
                                            type="number" rows={3}
                                            value={number}
                                            onChange={(event) => setNumber(event.target.value)}
                                        />
                                    </Form.Group>
                                    <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
                                        <Form.Label>Giá</Form.Label>
                                        <Form.Control
                                            type="number" rows={3}
                                            value={price}
                                            onChange={(event) => setPrice(event.target.value)}
                                        />
                                    </Form.Group>
                                    { avatar &&  (
                                        <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
                                            <Form.Label>Preview Avatar</Form.Label>
                                            <img src={avatar} alt="" style={{ maxWidth: "100%"}}/>
                                        </Form.Group>
                                    )}

                                </Col>
                            </Row>
                            <Button className={'mb-5'} variant="primary" type="submit">
                                Lưu
                            </Button>
                        </Form>
                    </Col>
                </Row>
            </Container>
        </>
    )
}

export default UpdateProductPage;
