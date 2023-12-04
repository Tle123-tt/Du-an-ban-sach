const mongoose = require('mongoose');

const { Schema } = mongoose;

const modelSchema = new Schema(
    {
        name: {
            type: String,
            required: 'Name cannot be blank'
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
    { collection: 'slides' }
);

module.exports = mongoose.model('Slide', modelSchema);
