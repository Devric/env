#!/bin/bash

test -x /usr/sbin/nginx && service nginx start
test -x /usr/sbin/mysql && mysqld_safe &
