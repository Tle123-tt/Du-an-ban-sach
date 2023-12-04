var express = require('express');
var router = express.Router();

const controllerBuilder = require('../../app/controllers/fe/Slide.Controller');


router.route('/slide').get(controllerBuilder.index);
router.route('/slide/:id').get(controllerBuilder.show);

module.exports = router;
