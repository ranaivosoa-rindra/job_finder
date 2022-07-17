'use strict';

/**
 *  guest-user controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::guest-user.guest-user');
