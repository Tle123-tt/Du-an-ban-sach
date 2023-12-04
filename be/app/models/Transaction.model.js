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
        status: {
            type: Number,
            default: 1
        },
        name: {
            type: String,
        },
		avatar: {
            type: String,
        },
		receiver_email: {
            type: String,
        },
		receiver_phone: {
            type: String,
        },
		receiver_address: {
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
        created_at : { type: Date, default: Date.now }
    },
    { collection: 'transactions' }
);

module.exports = mongoose.model('Transaction', transactionSchema);
