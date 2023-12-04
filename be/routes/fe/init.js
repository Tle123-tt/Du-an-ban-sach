var express = require('express');
var router = express.Router();


const authRouter = require("./auth");
const contractRouter = require("./contact");
const discountRouter = require("./discount");
const voteRouter = require("./vote");
const CategoryRouter = require("./category");
const productRouter = require("./product");
const orderRouter = require("./order");

router.use(authRouter);
router.use(contractRouter);
router.use(discountRouter);
router.use(voteRouter);
router.use(CategoryRouter);
router.use(productRouter);
router.use(orderRouter);

module.exports = router;
