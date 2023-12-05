var express = require('express');
var router = express.Router();

const controllerBuilder = require('../../app/controllers/cms/Contact.controller');
const authMiddleware = require('../../app/middleware/adminAuthJwt');
const isAuth = authMiddleware.roleGuards;

router.get('/contact/',isAuth,controllerBuilder.index);
router.get('/contact/:id',isAuth,controllerBuilder.show);
router.post('/contact/store',isAuth,controllerBuilder.store);
router.put('/contact/update/:id',isAuth,controllerBuilder.update);
router.delete('/contact/:id',isAuth,controllerBuilder.delete);

module.exports = router;
