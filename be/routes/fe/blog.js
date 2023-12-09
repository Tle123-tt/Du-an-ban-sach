var express = require('express');
var router = express.Router();

const BlogController = require('../../app/controllers/fe/Blog.controller');

router.get('/blog',BlogController.index);
router.get('/blog/show/:slug',BlogController.showBySlug);
router.get('/blog/:id',BlogController.show);

module.exports = router;
