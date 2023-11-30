import React from 'react';
import { Link } from 'react-router-dom';
import { FaStar } from 'react-icons/fa';
import { LazyLoadImage } from "react-lazy-load-image-component";
import ImageDefailt from "../../assets/image/default-image.png";
import formatPrice from "../../pages/utils/util_price";

function ProductItem({product, loading}) {
    const renderAge = () => {
        if (loading === false && product.pro_review_total > 0) {
            return Math.round(product.pro_review_star / product.pro_review_total, 1);
        }
        return 0;
    }
    return (
        (loading === true ? (
            <div>
                Loading
            </div>
        ) : (
            <div className='product-item mb-3'>
                <Link to={`/san-pham/${product.pro_slug}`} className='product-item-image'>
                    <LazyLoadImage src={product.pro_avatar}
                                   alt={product.pro_name}
                                   placeholderSrc={ImageDefailt}
                    />
                </Link>
                <h3 className='product-item-title'>
                    <Link to={`/san-pham/${product.pro_slug}`}>{product.pro_name}</Link>
                </h3>
                <p className='product-item-start'>
                    <span><span>{renderAge()} </span> <FaStar className='start' /> </span> <span>|</span>  <span>Đã bán {product.pro_pay}</span>
                </p>
                {/*{ product.sale > 0 ? (*/}
                {/*    <p className='product-item-price'>*/}
                {/*        <span className='sale'>120.000 <sup>đ</sup> <sub>-5</sub></span>*/}
                {/*    </p>*/}
                {/*) : (*/}
                {/*    <p className='product-item-price'>*/}
                {/*        <span className='price'>120.000 <sup>đ</sup></span>*/}
                {/*    </p>*/}
                {/*)}*/}
                <p className='product-item-price'>
                    <span className='price'>{formatPrice(product?.pro_price)} <sup>đ</sup></span>
                </p>
            </div>
        ))
    );
}

export default ProductItem;
