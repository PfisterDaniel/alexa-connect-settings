#!/usr/bin/env bash
set - eu

mongo -- users<<EOF
    var admin = db.getSiblingDB('admin');
    admin.auth('<mongo-admin-user>', '<mongo-admin-password>');

    var mqDB = 'users'
    var user = '<mqtt-user>';
    var passwd = '<mqtt-password>';
    db.createUser({user: user, pwd: passwd, roles: [{role: "read", db: mqDB}]});
    db.createCollection("users");
EOF
#mongo mongodb://localhost/users --authenticationDatabase admin -u '<mongo-admin-user>' -p '<mongo-admin-password>' --eval '
#    db.createUser({
#        user: "<web-app-user>",
#        pwd: "<web-app-password>",
#        roles: [{
#            role: "readWrite",
#            db: "users"
#        }]
#   })'

#mongo mongodb://localhost/sessions --authenticationDatabase admin -u '<mongo-admin-user>' -p '<mongo-admin-password>' --eval '
#    db.createUser({
#       user: "<web-app-user>",
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
