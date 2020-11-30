#!/usr/bin/env bash
set - eu

mongo -- mqGate<<EOF
    var admin = db.getSiblingDB('admin');
    admin.auth('<mongo-admin-user>', '<mongo-admin-password>');
    db.createCollection("users");
    db.createCollection("sessions");
    db.createUser({user: '<mqtt-user>', pwd: '<mqtt-password>', roles: [{role: "read", db: "users"}]});
    db.createUser({user: '<web-app-user>', pwd: '<web-app-user>', roles: [{role: "dbOwner", db: "sessions"}]});
    db.createUser({user: '<web-app-user>', pwd: '<web-app-user>', roles: [{role: "readWrite", db: "users"}]});
EOF

#mongo mongodb://localhost/users --authenticationDatabase admin -u '<mongo-admin-user>' -p '<mongo-admin-password>' --eval '
#    db.createUser({
#        user: "<web-app-user>",
#        pwd: "<web-app-password>",
#        roles: [{
#            role: "readWrite",
#            db: "users"
#        }]
#    })'

#mongo mongodb://localhost/sessions --authenticationDatabase admin -u '<mongo-admin-user>' -p '<mongo-admin-password>' --eval '
#    db.createUser({
#        user: "<web-app-user>",
#        pwd: "<web-app-password>",
#        roles: [{
#           role: "dbOwner",
#            db: "sessions"
#        }]
#    })'
    
#mongo mongodb://localhost/admin --authenticationDatabase admin -u '<mongo-admin-user>' -p '<mongo-admin-password>' --eval '
#    db.createUser({
#        user: "<mqtt-user>",
#        pwd: "<mqtt-password>",
#        roles: [{
#            role: "read",
#            db: "users"
#        }]
#    })'
