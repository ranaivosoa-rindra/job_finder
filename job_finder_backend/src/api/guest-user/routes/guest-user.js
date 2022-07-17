'use strict';

/**
 * guest-user router.
 */

const { createCoreRouter } = require('@strapi/strapi').factories;

module.exports = createCoreRouter('api::guest-user.guest-user');
