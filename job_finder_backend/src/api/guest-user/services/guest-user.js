'use strict';

/**
 * guest-user service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::guest-user.guest-user');
