var express = require('express');
var router = express.Router();

const BlogController = require('../../app/controllers/cms/Order.controller');
const authMiddleware = require('../../app/middleware/adminAuthJwt');
const isAuth = authMiddleware.roleGuards;

router.get('/blog/',isAuth,BlogController.index);
router.get('/blog/:id',isAuth,BlogController.show);
router.put('/blog/update/:id',isAuth,BlogController.update);
router.delete('/blog/:id',isAuth,BlogController.delete);

module.exports = router;
