var express = require('express');
var router = express.Router();

const staticBuilder = require('../../app/controllers/cms/Static.controller');
const authMiddleware = require('./../../app/middleware/adminAuthJwt');
const isAuth = authMiddleware.roleGuards;

router.route('/statistical').get(staticBuilder.monthlyStatistics);


module.exports = router;
