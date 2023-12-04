var express = require('express');
var router = express.Router();

const OrderController = require('../../app/controllers/cms/Order.controller');
const authMiddleware = require('../../app/middleware/adminAuthJwt');
const isAuth = authMiddleware.roleGuards;

router.get('/order/',isAuth,OrderController.index);
router.get('/order/:id',isAuth,OrderController.show);
router.put('/order/update/:id',isAuth,OrderController.update);
router.delete('/order/:id',isAuth,OrderController.delete);

module.exports = router;
