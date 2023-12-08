var express = require('express');
var router = express.Router();

const OrderController = require('../../app/controllers/fe/Order.controller');
const authMiddleware = require('../../app/middleware/userAuthjwt');
// const isAuth = authMiddleware.isAuth;

router.get('/order',OrderController.index);
router.post('/order/store',OrderController.store);
router.get('/order/webhook',OrderController.webhook);
router.get('/order/:id',OrderController.show);
router.put('/order/update/:id',OrderController.update);
router.delete('/order/:id',OrderController.delete);

module.exports = router;
