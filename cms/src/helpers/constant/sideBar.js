export const SIDE_BARS = [
	{
		path: '/dashboard',
		icon: 'eva eva-home-outline',
		title: 'Dashboard',
		key: -1 
	},
	{
		path: '/author',
		icon: 'eva eva-person',
		title: 'Author',
		children: [
			{
				path: '/author/list',
				title: 'list ',
				icon: '',
			},
			{
				path: '/author/create',
				icon: '',
				title: 'Add new',
			},
		]
	},
	{
		path: '/user',
		icon: 'eva eva-people',
		title: 'User',
		children: [
			{
				path: '/user/list',
				title: 'list ',
				icon: '',
			},
			{
				path: '/user/create',
				icon: '',
				title: 'Add new',
			},
		]
	},
	{
		path: '/product',
		icon: 'eva eva-list',
		title: 'Product',
		children: [
			{
				path: '/product/list',
				title: 'List',
				icon: '',
			},
			{
				path: '/product/create',
				icon: '',
				title: 'Add new',
			},
		]
	},

	{
		path: '/discount',
		icon: 'eva eva-flash',
		title: 'Discount',
		children: [
			{
				path: '/discount/list',
				title: 'list ',
				icon: '',
			},
			{
				path: '/discount/create',
				icon: '',
				title: 'Add new',
			},
		]
	},
	{
		path: '/category',
		icon: 'eva eva-sun',
		title: 'Category',
		children: [
			{
				path: '/category/list',
				title: 'List ',
				icon: '',
			},
			{
				path: '/category/create',
				icon: '',
				title: 'Add new',
			},
		]
	},
	{
		path: '/slide',
		icon: 'eva eva-bulb',
		title: 'Slide',
		children: [
			{
				path: '/slide/list',
				title: 'List ',
				icon: '',
			},
			{
				path: '/slide/create',
				icon: '',
				title: 'Add new',
			},
		]
	},
	{
		path: '/order',
		icon: 'eva eva-grid',
		title: 'Order',
		children: [
			{
				path: '/order/list',
				title: 'List',
				icon: '',
			}
		]
	},
	{
		path: '/setting',
		icon: 'eva eva-settings',
		title: 'Setting',
		children: [
			{
				path: '/setting/role/list',
				title: 'Roles',
				icon: '',
			},
			{
				path: '/setting/permission/list',
				icon: '',
				title: 'Permissions',
			},
		]
	},
	
	{
		path: '/menu',
		icon: 'eva eva-menu',
		title: 'Menu',
		children: [
			{
				path: '/menu/list',
				title: 'List',
				icon: '',
			},
			{
				path: '/menu/create',
				icon: '',
				title: 'Add new',
			},
		]
	},

	{
		path: '/blog',
		icon: 'eva eva-flag',
		title: 'Blog',
		children: [
			{
				path: '/blog/list',
				title: 'List ',
				icon: '',
			},
			{
				path: '/blog/create',
				icon: '',
				title: 'Add new',
			},
		]
	},
	

	{
		path: '/reviews',
		icon: 'eva eva-star',
		title: 'Reviews',
		key: -2
	},

	{
		path: '/contact',
		icon: 'eva eva-inbox',
		title: 'Contacts',
		key: -3
	},
]