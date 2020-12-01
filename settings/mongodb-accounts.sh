#!/usr/bin/env bash
set -eu
mongo -- admin<<EOF
    var admin = db.getSiblingDB('admin');
    admin.auth('<mongo-admin-user>', '<mongo-admin-password>');
    db.createUser({user: "<mqtt-user>", pwd: "<mqtt-password>", roles: [{role: "read", db: "admin"}]});
EOF
