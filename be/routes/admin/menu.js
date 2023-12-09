var express = require('express');
var router = express.Router();

const DataController = require('../../app/controllers/cms/Menu.controller');
const authMiddleware = require('../../app/middleware/adminAuthJwt');
const isAuth = authMiddleware.roleGuards;

router.get('/menu',isAuth,DataController.index);
router.post('/menu/store',isAuth,DataController.store);
router.get('/menu/:id',isAuth,DataController.show);
router.put('/menu/update/:id',isAuth,DataController.update);
router.delete('/menu/:id',isAuth,DataController.delete);

module.exports = router;
