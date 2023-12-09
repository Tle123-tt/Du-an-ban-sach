const mongoose = require('mongoose');

const { Schema } = mongoose;

const modelSchema = new Schema(
    {
		user_id: {
            type: String,
        },
		blog_id: {
            type: String,
        },
		type: {
            type: Number,
        },
		blog: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "Blog"
        },
		user: {
            type: mongoose.Schema.Types.ObjectId,
            ref: "User"
        },
		
        created_at : { type: Date, default: Date.now }
    },
    { collection: 'blog_likes' }
);

module.exports = mongoose.model('BlogLike', modelSchema);
