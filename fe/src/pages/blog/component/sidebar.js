import React, { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import MenuService from '../../../api/MenuService';

function IncSidebar ()
{
	const { slug } = useParams();
	const [ menu, setMenu ] = useState( [] );


	useEffect( () =>
	{
		getMenu();
	}, [] );
	const getMenu = async () =>
	{
		const response = await MenuService.getList( { page: 1, page_size: 1000, status: 1 } );
		if ( response?.status === 200 )
		{
			setMenu( response?.data?.menus )
		}
	}

	return (
		<div className="col-lg-4">
			{/* <div className="card mb-4">
                <div className="card-header">Search</div>
                <div className="card-body">
                    <div className="input-group">
                        <input className="form-control" type="text" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="button-search" />
                        <button className="btn btn-primary" id="button-search" type="button">Go!</button>
                    </div>
                </div>
            </div> */}
			<div className="card mb-4">
				<div className="card-header">Chuyên mục bài viết</div>
				<div className="card-body">
					<div className="row">
						<div className="col-sm-12">
							<ul className="list-unstyled mb-0">
								{ menu?.length > 0 && menu.map( ( item, key ) =>
								{
									return <li>
										<Link to={ `/tin-tuc-chuyen-muc/${item.slug}` }>{item.name}</Link>
									</li>
								} ) }
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
