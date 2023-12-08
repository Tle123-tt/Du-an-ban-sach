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
                    src="https://bookbuy.vn/Res/Images/Album/b0559867-9eea-409e-86c9-7dd647521478.jpg?w=880&scale=both&h=320&mode=crop"
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
