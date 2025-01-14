var express = require('express');
var router = express.Router();

const controllerBuilder = require('../../app/controllers/fe/Category.controller');


router.route('/category').get(controllerBuilder.index);
router.route('/category/:id').get(controllerBuilder.show);
router.route('/category/show/:slug').get(controllerBuilder.showBySlug);

module.exports = router;
