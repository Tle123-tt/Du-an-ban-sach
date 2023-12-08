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
		description: {
            type: String
        },
		avatar: {
            type: String
        },
		status: {
            type: Number
        },
		hot: {
            type: Number
        },
		
        created_at : { type: Date, default: Date.now }
    },
    { collection: 'category_blogs' }
);

module.exports = mongoose.model('CategoryBlog', modelSchema);
