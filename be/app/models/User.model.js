const mongoose = require('mongoose');

const { Schema } = mongoose;

const userSchema = new Schema(
    {
        name: {
            type: String,
            required: 'name cannot be blank'
        },
        email: {
            type: String,
        },
		phone: {
            type: String,
        },
        password: {
            type: String,
        },
        avatar: {
            type: String,
        },
        gender: {
            type: String,
            default: "Khac"
        },
        birthday: {
            type: Date,
        },
		address: {
            type: String,
        },
		
        status: { type: Number, default: 1},
        type: {
            type: String,
            default: "USER"
        },
        created_at : { type: Date, default: Date.now },
        // roles: [
        //     {
        //         type: mongoose.Schema.Types.ObjectId,
        //         ref: "Role"
        //     }
        // ]
    },
    { collection: 'users' }
);

module.exports = mongoose.model('User', userSchema);
