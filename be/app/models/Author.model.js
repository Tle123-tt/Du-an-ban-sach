const mongoose = require('mongoose');

const { Schema } = mongoose;

const authorSchema = new Schema(
    {
        name: {
            type: String,
            required: 'name cannot be blank'
        },
        avatar: {
            type: String,
        },
		blogs: [{
            type: mongoose.Schema.Types.ObjectId,
            ref: "Blog"
        }],
        products: [{
            type: mongoose.Schema.Types.ObjectId,
            ref: "Product"
        }],
        created_at : { type: Date, default: Date.now }
    },
    { collection: 'authors' }
);

module.exports = mongoose.models.Author || mongoose.model('Author', authorSchema);
