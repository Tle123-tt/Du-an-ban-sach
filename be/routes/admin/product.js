var express = require('express');
var router = express.Router();

const ProductController = require('../../app/controllers/cms/Product.controller');
const authMiddleware = require('../../app/middleware/adminAuthJwt');
const isAuth = authMiddleware.roleGuards;

router.get('/product/',isAuth,ProductController.index);
router.post('/product/store',isAuth,ProductController.store);
router.get('/product/:id',isAuth,ProductController.show);
router.put('/product/update/:id',isAuth,ProductController.update);
router.delete('/product/:id',isAuth,ProductController.delete);

module.exports = router;
