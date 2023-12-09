var express = require('express');
var router = express.Router();

const dataController = require('../../app/controllers/cms/Author.controller');
const authMiddleware = require('../../app/middleware/adminAuthJwt');
const isAuth = authMiddleware.roleGuards;

router.get('/author',isAuth,dataController.index);
router.post('/author/store',isAuth,dataController.store);
router.get('/author/:id',isAuth,dataController.show);
router.put('/author/update/:id',isAuth,dataController.update);
router.delete('/author/:id',isAuth,dataController.delete);

module.exports = router;
