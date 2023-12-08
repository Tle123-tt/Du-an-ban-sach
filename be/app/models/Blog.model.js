const mongoose = require('mongoose');

const { Schema } = mongoose;

const modelSchema = new Schema(
    {
        name: {
            type: String,
            required: 'Name cannot be blank'
        },
		slug: {
            type: String,
            required: 'Slug cannot be blank'
        },
		author_id: {
			type: String
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
		status: {
            type: Number
        },
		category_id: {
			type: String
		},

		author: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Author"
        }, 

		category_blog: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "CategoryBlog"
        },
		
        created_at : { type: Date, default: Date.now }
    },
    { collection: 'blogs' }
);

module.exports = mongoose.model('Blog', modelSchema);
