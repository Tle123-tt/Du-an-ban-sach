const mongoose = require('mongoose');

const { Schema } = mongoose;

const modelSchema = new Schema(
    {
        title: {
            type: String,
            required: 'Name cannot be blank'
        },
		slug: {
            type: String,
            required: 'Slug cannot be blank'
        },
		tags: {
			type: String
		},
		description: {
            type: String
        },
		content: {
            type: String
        },
		avatar: {
            type: String
        },
		status: {
            type: Number
        },
		menu_id: {
			type: String
		},
		author_name: {
			type: String
		},
		author_email: {
			type: String
		},
		user_like: {
			type: Number,
			default: 0
		},
		author_avatar: {
			type: String
		},
		total_like: {
            type: Number,
			default: 0
        },
		total_dislike: {
            type: Number,
			default: 0
        },
		menu: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Menu"
        },
		
        created_at : { type: Date, default: Date.now }
    },
    { collection: 'blogs' }
);

module.exports = mongoose.model('Blog', modelSchema);
