var express = require('express');
var router = express.Router();

const ProductController = require('../../app/controllers/fe/Product.controller');


router.route('/product/').get(ProductController.index);
router.route('/product:id').get(ProductController.show);
router.route('/product/show/:slug').get(ProductController.showBySlug);

module.exports = router;
