#!/bin/bash

riak start

riak-admin bucket-type create sets '{"props":{"datatype":"set"}}'
riak-admin bucket-type activate sets

tail -f /var/log/riak/console.log
