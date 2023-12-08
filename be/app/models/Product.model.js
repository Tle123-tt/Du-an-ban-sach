const mongoose = require('mongoose');

const { Schema } = mongoose;

const productSchema = new Schema(
    {
		name: {
            type: String,
        },
		slug: {
            type: String,
        },
		avatar: {
            type: String,
        },
        quantity: {
            type: Number,
        },
        price: {
            type: Number,
        },
		category_id: {
            type: String,
        },
		total_reviews: {
            type: Number,
        },
        status: {
            type: Number,
            default: 1
        },
        
		description: {
            type: String,
        },
		content: {
            type: String,
        },
		hot: {
            type: Number,
        },
		total_stars: {
            type: Number,
        },
		category: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Category"
        },
		product_images: {
            type: Array
        },
		author_id: {
			type: String
		},
		author: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Author"
        },
        created_at : { type: Date, default: Date.now }
    },
    { collection: 'products' }
);

module.exports = mongoose.model('Product', productSchema);
