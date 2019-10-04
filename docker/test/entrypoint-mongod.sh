#!/bin/bash

cp /mongod.key /tmp/mongod.key
cp /mongod.pem /tmp/mongod.pem
cp /rootCA.crt /tmp/mongod-rootCA.crt
chmod 400 /tmp/mongod.key /tmp/mongod.pem /tmp/mongod-rootCA.crt

/usr/bin/mongod \
  --bind_ip=0.0.0.0 \
	--dbpath=/data/db \
	--oplogSize=50 \
	--profile=2 \
	--wiredTigerCacheSizeGB=0.1 \
  --sslMode=preferSSL \
  --sslCAFile=/tmp/mongod-rootCA.crt \
  --sslPEMKeyFile=/tmp/mongod.pem \
  --sslAllowInvalidHostnames \
  --sslAllowInvalidCertificates \
	$*
