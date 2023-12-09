import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import React, {useEffect, useState} from "react";
import {Form} from "react-bootstrap";
import CartApi from "../../../api/CartService";

function ModalVote(props) {

    const [title, setTitle] = useState("")
    const [userID, setUser] = useState("")
    const [contentVote, setContentVote] = useState("")
    const [number, setNumber] = useState(5)

    const handleClose = async () => {
        props.setShowModal(false);
    }

    const clickVote = async () => {
        let data = {
            vote_content : contentVote,
            vote_number: parseInt(number),
            product_id: props.product.product_id,
            user_id: userID,
        }

        console.log('-------------data ', data);
        const response = await CartApi.vote(data);
        console.log('--------------- Response', response);
        if (response?.status === 200) {
            props.setShowModal(false);
            setContentVote('');
        }
    }

    useEffect(() => {
        console.log('------------ props: ', props);
        setTitle(props.product?.name);
        setUser(props.userID);
    }, [props]);

    return (
        <>
            <Modal
                show={props.showModal}
                onHide={handleClose}
                backdrop="static"
                keyboard={false}
                size="lg"
            >
                <Modal.Header closeButton>
                    {/*<Modal.Title>{title}</Modal.Title>*/}
                </Modal.Header>
                <Modal.Body>
                    <p>Sản phẩm : <b>{title}</b></p>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
                        <Form.Control as="textarea"
                                      onChange={(event) => setContentVote(event.target.value)}
                                      rows={3} placeholder={'Nội dung đánh giá ...'}/>
                    </Form.Group>
                    <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
                        <Form.Select aria-label="Default select example" onChange={e => {
                            console.log("e.target.value", e.target.value);
                            setNumber(e.target.value);
                        }}>
                            <option value={5}>Sản phẩm tuyệt vời</option>
                            <option value="4">Sản phẩm tốt</option>
                            <option value="3">Sản phẩm bình thường</option>
                            <option value="2">Sản phẩm kém</option>
                            <option value="1">Quá tệ</option>
                        </Form.Select>
                    </Form.Group>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={handleClose}>
                        Huỷ bỏ
                    </Button>
                    <Button variant="primary" onClick={clickVote}>Xác nhận</Button>
                </Modal.Footer>
            </Modal>
        </>
    );
}

export default ModalVote;
