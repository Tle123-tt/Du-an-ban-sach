var express = require('express');
var router = express.Router();

const ProductController = require('../../app/controllers/fe/Product.controller');


router.route('/product/').get(ProductController.index);
router.route('/product:id').get(ProductController.show);

module.exports = router;
