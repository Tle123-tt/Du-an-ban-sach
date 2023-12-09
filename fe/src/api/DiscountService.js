import axiosClient from './axiosClient';

const DiscountService = {

    async getList(params) {
		try {
			const newParams = { ...params }
			const url = `discount`;
			const response = await axiosClient.get(url, {
				params: {...newParams},
			})

			if (response?.status === 200) {
				return response?.data;
			}
		} catch (e) {
			console.log('--------------- E ', e);
		}
	},

	async findById(id) {
		try {
			const url = `discount/show/${id}`;
			const response = await axiosClient.get(url)

			if (response?.status === 200) {
				return response?.data;
			}
		} catch (e) {
			console.log('--------------- findById@Error ', e);
			return {};
		}
	},

    async findBySlug(slug, params) {
		try {
			const url = `discount/show/${slug}`;
			const response = await axiosClient.get(url, {params: params})

			if (response?.status === 200) {
				return response?.data;
			}
		} catch (e) {
			console.log('--------------- findById@Error ', e);
			return {};
		}
	},
}

export default DiscountService;
