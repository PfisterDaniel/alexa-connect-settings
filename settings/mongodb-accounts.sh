mongo mongodb://localhost/users --authenticationDatabase admin -u '<mongo-admin-user>' -p '<mongo-admin-password>' --eval '
    db.createUser({
        user: "<web-app-user>",
        pwd: "<web-app-password>",
        roles: [{
            role: "readWrite",
            db: "users"
        }]
    })'

mongo mongodb://localhost/sessions --authenticationDatabase admin -u '<mongo-admin-user>' -p '<mongo-admin-password>' --eval '
    db.createUser({
        user: "<web-app-user>",
        pwd: "<web-app-password>",
        roles: [{
            role: "dbOwner",
            db: "sessions"
        }]
    })'
    
mongo mongodb://localhost/admin --authenticationDatabase admin -u '<mongo-admin-user>' -p '<mongo-admin-password>' --eval '
    db.createUser({
        user: "<mqtt-user>",
        pwd: "<mqtt-password>",
        roles: [{
            role: "read",
            db: "admin"
        }]
    })'
