// @ts-nocheck
import React, { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { Product, getProductsByFilter } from "../../services/productService.js";
import { Products } from "../../components/Products/Products.js";
import { message } from "antd";

export const ProductContainer = () =>
{

	const [ products, setProducts ] = useState([]);
	const [paging, setPaging] = useState({
		page: 1,
		page_size: 20
	});
	const [params, setParams] = useState({});
	const dispatch = useDispatch();

	useEffect(() => {
		getProductsByFilters(paging, setProducts, setPaging);
	}, []);

	const getProductsByFilters = (filter, setProduct, setPage) => {
		getProductsByFilter(filter, setProducts, setPaging, dispatch);
	}

	const deleteById = async (id) => {
		try {
			const response = await Product.delete(id);
			if(response?.status === 200) {
				message.success('Delete successfully');
				await getProductsByFilters({...paging, ...params});
			} else {
				message.error(response?.message);
			}

		} catch (error) {
			message.error(error?.message);
		}
	}

	return <Products 
	products={products} 
	deleteById={deleteById}
	paging={paging} 
	params={params} 
	getProductsByFilters={getProductsByFilters}
	setParams={setParams}
	setPaging={setPaging}
	setProducts={setProducts} 
	/>
};
