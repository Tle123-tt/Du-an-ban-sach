var express = require('express');
var router = express.Router();

const controllerBuilder = require('../../app/controllers/cms/Slide.Controller');
const authMiddleware = require('../../app/middleware/adminAuthJwt');
const isAuth = authMiddleware.roleGuards;

router.get('/slide/',isAuth,controllerBuilder.index);
router.get('/slide/:id',isAuth,controllerBuilder.show);
router.post('/slide/store',isAuth,controllerBuilder.store);
router.put('/slide/update/:id',isAuth,controllerBuilder.update);
router.delete('/slide/:id',isAuth,controllerBuilder.delete);

module.exports = router;
