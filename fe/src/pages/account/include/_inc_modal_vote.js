import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import React, {useEffect, useState} from "react";
import {Form} from "react-bootstrap";
import CartApi from "../../../api/CartService";

function ModalVote(props) {

    const [title, setTitle] = useState("")
    const [contentVote, setContentVote] = useState("")

    const handleClose = async () => {
        props.setShowModal(false);
    }

    const clickVote = async () => {
        let data = {
            v_content : contentVote,
            v_number: 5,
            v_product_id: parseInt(props.product.id),
            v_user_id: parseInt(props.userID),
            v_status: 4,
        }

        console.log('-------------data ', data);
        const response = await CartApi.vote(data);
        console.log('--------------- Response', response);
        if (response.status === 200) {
            props.setShowModal(false);
            setContentVote('');
        }
    }

    useEffect(() => {
        console.log('------------ props: ', props);
        setTitle(props.product?.name);
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
