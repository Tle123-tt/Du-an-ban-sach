import React, { Component } from 'react';
import { Carousel } from 'react-bootstrap';

class HomeSlideCpn extends Component {

    render() {
        return (
            <Carousel>
                <Carousel.Item>
                    <img
                    className="d-block w-100"
                    src="https://theme.hstatic.net/200000301138/1000730318/14/bannerhome.png?v=409"
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
                    src="https://theme.hstatic.net/200000301138/1000730318/14/bannerhome.png?v=409"
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