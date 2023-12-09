import axiosClient from './axiosClient';

const BlogService = {

    async getList(params) {
		try {
			const newParams = { ...params }
			const url = `blog`;
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
			const url = `blog/show/${id}`;
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
			const url = `blog/show/${slug}`;
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

export default BlogService;
