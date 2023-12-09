const mongoose = require('mongoose');

const { Schema } = mongoose;

const authorSchema = new Schema(
    {
        name: {
            type: String,
            required: 'name cannot be blank'
        },
		email: {
            type: String,
            required: 'email cannot be blank'
        },
		phone: {
            type: String,
            required: 'phone cannot be blank'
        },
        avatar: {
            type: String,
        },
		status: {
            type: String,
        },
        products: [{
            type: mongoose.Schema.Types.ObjectId,
            ref: "Product"
        }],
        created_at : { type: Date, default: Date.now }
    },
    { collection: 'producers' }
);

module.exports = mongoose.models.Author || mongoose.model('Author', authorSchema);
