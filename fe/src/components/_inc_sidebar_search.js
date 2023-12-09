import Skeleton from "react-loading-skeleton";
import { Link, useSearchParams } from "react-router-dom";
import { FaStar } from "react-icons/fa";
import React, { useEffect, useState } from "react";
import categoryService from "../api/categoryService";
import { prices } from "../api/common";



const startConfig = [ 5, 4, 3, 2, 1 ];

function SidebarSearch ( props )
{
	const [ categories, setCategories ] = useState( [] );
	const [ loadingCategory, setLoadingCategory ] = useState( true );
	const [ search, setSearch ] = useSearchParams();

	const handleClickVote = ( e ) =>
	{
		e.preventDefault();
		let vote = e.target.getAttribute( 'data-vote' );
		if ( e.target.classList.contains( 'active' ) )
		{
			e.target.classList.remove( 'active' );
			delete search.vote;
			setSearch( search );
		} else
		{
			let newParams = {
				...search,
				vote: vote
			}
			setSearch( newParams );
		}
	}

	const handleClickPrice = ( e ) =>
	{
		e.preventDefault();

		let price = e.target.getAttribute( 'data-price' );
		if ( e.target.classList.contains( 'active' ) )
		{
			props.setParams({
				...props.params,
				price_from: null,
				price_to: null,
				price_id: null
			});
			
			let newSearch = {...search}
			delete newSearch.price_from;
			delete newSearch.price_to;
			delete newSearch.price_id;
			setSearch(newSearch );
		} else
		{

			let priceData = prices.find( item => item?.id == price );
			let newParams = {
				...search,
				price_from: priceData?.from,
				price_to: priceData?.to,
			}
			props.setParams( {
				...props.params,
				price_from: priceData?.from,
				price_to: priceData?.to,
				price_id: Number( price )
			} )
			setSearch( newParams );

		}

	}

	const getListsCategory = async () =>
	{
		const response = await categoryService.getListsCategory( { page: 1, page_size: 100, status: 1 } );
		if ( response?.status === 200 )
		{
			setCategories( response?.data?.categories );
			setLoadingCategory( false );
		}
	}

	useEffect( () =>
	{
		getListsCategory().then( r => { } );
	}, [] );


	return (
		<div className='box-right'>
			<div className='box-right-item item-category'>
				<h4 className='heading-h4 mt-2'>Danh mục sản phẩm</h4>
				<ul>
					{ loadingCategory === true ? (
						<>
							<Skeleton count={ 4 } />
						</>
					) : (
						<>
							{ categories.length > 0 && categories.map( ( item, index ) => (
								<li key={ index } className={ item.slug === ( props.category?.slug ?? "" ) ? 'active' : '' }>
									<Link to={ `/danh-muc/${ item.slug }` }>{ item.name }</Link>
								</li>
							) ) }
						</>
					) }

				</ul>
			</div>
			<div className='box-right-item'>
				<h4 className='heading-h4 mt-2'>Đánh giá</h4>
				{ startConfig.map( ( item ) => (
					<Link key={ item } className='item-start' onClick={ handleClickVote } data-vote={ item }>
						{ startConfig.map( ( index ) => (
							<FaStar key={ index } className={ item >= index ? 'active' : '' } />
						) ) }
						Từ { item } sao
					</Link>
				) ) }
			</div>
			<div className='box-right-item'>
				<h4 className='heading-h4 mt-2'>Giá</h4>
				<div className='item-price'>
					{ prices.map( ( item ) => (
						<Link key={ item.id } onClick={ handleClickPrice }
							className={ props?.params?.price_id == item.id ? 'active' : '' }
							data-price={ item.id }>{ item.value }</Link>
					) ) }
				</div>
			</div>
		</div>
	)
}

export default SidebarSearch;
