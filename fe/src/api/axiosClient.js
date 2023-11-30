import axios from 'axios';
import * as process from 'process';

const axiosClient = axios.create({
	baseURL: process.env.REACT_APP_URL_API,
	headers: {
		'Content-Type': 'application/json',
	},
	body: JSON.stringify(),
})


if (localStorage.getItem('accessToken')) {
	axiosClient.defaults.headers.common['Authorization'] =  'Bearer ' + localStorage.getItem('accessToken');
}

export default axiosClient;
