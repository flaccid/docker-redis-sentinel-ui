#!/bin/sh -e

# re-configure
sed -i "s/mymaster/$REDIS_MASTER_NAME/g" config.js
sed -i "s/127.0.0.1/$SENTINEL_HOST/g" config.js
sed -i "s/26379/$SENTINEL_PORT/g" config.js
sed -i "s/debug: false/debug: $DEBUG/g" config.js

cat config.js

exec node god.js &

node app.js
