import React, { Component } from 'react';
import { Carousel } from 'react-bootstrap';

class HomeSlideCpn extends Component {

    render() {
        return (
            <Carousel>
                <Carousel.Item>
                    <img
                    className="d-block w-100"
                    src="https://bookbuy.vn/Res/Images/Album/dfd4af60-b376-4530-bc6e-f611ff6e3859.jpg?w=880&scale=both&h=320&mode=crop"
                    alt="First slide"
                    />
                    <Carousel.Caption>
                    <h3>Giá rẻ</h3>
                    <p>Nhanh tay đăng ký để được ưu đãi mới nhất</p>
                    </Carousel.Caption>
                </Carousel.Item>
                <Carousel.Item>
                    <img
                    className="d-block w-100"
                    src="https://lh3.googleusercontent.com/syjMI_DfSr8cQBR5hR7y4w9HqDeysh1mMG9l0Vo2ZoD5_xmS4Qo1HJniMkABUstaGm2i3K0FdntvbO-o6IG-G0AvG3sk_f-B_YYsgTJWMaxDJmTf1FzTAO5wiY_OGUccaosJK8rAlVodiYyKV5_hUAsYMpw4GG8JSck6NWJbxtbcZZJke7MSkI_H9pF6DQ"
                    alt="Second slide"
                    />

                    <Carousel.Caption>
                    <h3>Sale 50%</h3>
                    <p>Nhận liền tay, khởi sắc </p>
                    </Carousel.Caption>
                </Carousel.Item>
            </Carousel>
        );
    }
}

export default HomeSlideCpn;
