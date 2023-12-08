import React, { useEffect, useState } from 'react';
import {Link, useParams} from 'react-router-dom';

function IncSidebar ()
{
    const { slug } = useParams();



    useEffect( () =>
    {

    }, [  ] );

    return (
        <div className="col-lg-4">
            <div className="card mb-4">
                <div className="card-header">Search</div>
                <div className="card-body">
                    <div className="input-group">
                        <input className="form-control" type="text" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="button-search" />
                        <button className="btn btn-primary" id="button-search" type="button">Go!</button>
                    </div>
                </div>
            </div>
            <div className="card mb-4">
                <div className="card-header">Chuyên mục bài viết</div>
                <div className="card-body">
                    <div className="row">
                        <div className="col-sm-12">
                            <ul className="list-unstyled mb-0">
                                <li>
                                    <Link to={`/tin-tuc-chuyen-muc/noi-bat`}>Hướng dẫn</Link>
                                </li>
                                <li>
                                    <Link to={`/tin-tuc-chuyen-muc/gian-gia`}>Giảm giá</Link>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div className="card mb-4">
                <div className="card-header">Side Widget</div>
                <div className="card-body">You can put anything you want inside of these side widgets. They are easy to use, and feature the Bootstrap 5 card component!</div>
            </div>
        </div>
    );
}
export default IncSidebar;
