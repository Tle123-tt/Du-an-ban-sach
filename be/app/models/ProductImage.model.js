const mongoose = require('mongoose');

const { Schema } = mongoose;

const productImageSchema = new Schema(
    {
		name: {
            type: String,
        },
		path: {
            type: String,
        },
        product_id: {
            type: String,
        },
        
        created_at : { type: Date, default: Date.now }
    },
    { collection: 'products_images' }
);

module.exports = mongoose.model('ProductImage', productImageSchema);
