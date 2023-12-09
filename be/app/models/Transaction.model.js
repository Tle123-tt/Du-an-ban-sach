const mongoose = require('mongoose');

const { Schema } = mongoose;

const transactionSchema = new Schema(
    {
        order_id: {
            type: String,
        },
        product_id: {
            type: String,
        },
        user_id: {
            type: String,
        },
        name: {
            type: String,
			unique: false
        },
		avatar: {
            type: String,
        },

		price: {
            type: Number,
        },
		discount: {
            type: Number,
        },
        quantity: {
            type: Number,
            default: 0
        },
		total_price: {
            type: Number,
            default: 0
        },
		code: {
            type: String
        },
        product: [
            {
                type: mongoose.Schema.Types.ObjectId,
                ref: "Product"
            }
        ],
        created_at : { type: Date, default: Date.now }
    },
    { collection: 'transactions' }
);

module.exports = mongoose.model('Transaction', transactionSchema);
