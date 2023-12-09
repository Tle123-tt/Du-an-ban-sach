var express = require('express');
var router = express.Router();

const MenuController = require('../../app/controllers/fe/Menu.controller');
router.get('/menu',MenuController.index);
router.get('/menu/show/:slug',MenuController.showBySlug);
router.get('/menu/:id',MenuController.show);

module.exports = router;
