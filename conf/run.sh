#!/bin/bash

test -x /usr/sbin/nginx && nginx start
test -x /usr/sbin/mysql && mysqld_safe &
