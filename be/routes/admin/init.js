var express = require('express');
var router = express.Router();
const productRouter = require("./product");
const discountRouter = require("./discount");
const roleRouter = require("./role");
const userRouter = require("./user");
const staticRouter = require("./static");
const permissionRouter = require("./permission");
const cateRouter = require("./category");
const voteRouter = require("./vote");
const orderRouter = require("./order");

router.use(productRouter);
router.use(discountRouter);
router.use(userRouter);
router.use(roleRouter);
router.use(staticRouter);
router.use(permissionRouter);
router.use(cateRouter);
router.use(voteRouter);
router.use(orderRouter);

module.exports = router;
