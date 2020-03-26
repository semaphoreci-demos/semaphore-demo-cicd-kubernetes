var db = require('./database.js');

db.sequelize.authenticate()
    .then(() => {
        db.sequelize.sync()
            // .then(console.log('Migration complete'))
            .catch(console.error);
    })
    .catch(console.error);


