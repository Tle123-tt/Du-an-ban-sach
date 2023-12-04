const mongoose = require('mongoose');

const { Schema } = mongoose;
mongoose.Promise = global.Promise;

const voteSchema = new Schema(
    {
        vote_content: {
            type: String,
            required: 'vote_content cannot be blank'
        },
        vote_number : {type: Number},
        user_id : {type: String},
        product_id : {type: String},
        user: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "User"
        },
        product: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Product"
        },
        created_at : { type: Date, default: Date.now },
    },
    { collection: 'votes' }
);
//
module.exports = mongoose.model('Vote', voteSchema);
