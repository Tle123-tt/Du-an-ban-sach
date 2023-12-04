const mongoose = require('mongoose');

const { Schema } = mongoose;

const orderSchema = new Schema(
    {
        total_discount: {
            type: Number,
        },
        total_price: {
            type: Number,
        },
        status: {
            type: Number,
            default: 1
        },
        note: {
            type: String,
        },
		receiver_name: {
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
		shipping_status: {
            type: Number,
        },
		payment_status: {
            type: Number,
        },
        payment_type: {
            type: Number,
            default: 0
        },
		transactions: [
            {
                type: mongoose.Schema.Types.ObjectId,
                ref: "Transaction"
            }
        ],
        created_at : { type: Date, default: Date.now }
    },
    { collection: 'orders' }
);

module.exports = mongoose.model('Order', orderSchema);
