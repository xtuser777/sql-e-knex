const { resolve } = require('path');

module.exports = {
  client: 'mysql2',
  connection: {
    database: 'mysql_knex',
    user: 'mysqlknex',
    password: 'knex'
  },
  pool: {
    min: 2,
    max: 10
  },
  migrations: {
    tableName: 'knex_migrations',
    directory: resolve(__dirname, 'migrations'),
  },
  seeds: {
    directory: resolve(__dirname, 'seeds'),
  }
};