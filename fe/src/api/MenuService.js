import axiosClient from './axiosClient';

const MenuService = {

    async getList(params) {
		try {
			const newParams = { ...params }
			const url = `menu`;
			const response = await axiosClient.get(url, {
				params: {...newParams},
			});
			

			if (response?.status === 200) {
				return response?.data;
			}
		} catch (e) {
			return null
			console.log('--------------- E ', e);
		}
	},

	async findById(id) {
		try {
			const url = `menu/show/${id}`;
			const response = await axiosClient.get(url)

			if (response?.status === 200) {
				return response?.data;
			}
		} catch (e) {
			console.log('--------------- findById@Error ', e);
			return {};
		}
	},

    async findBySlug(slug) {
		try {
			const url = `menu/show/${slug}`;
			const response = await axiosClient.get(url)

			if (response?.status === 200) {
				return response?.data;
			}
		} catch (e) {
			console.log('--------------- findById@Error ', e);
			return {};
		}
	},
}

export default MenuService;
