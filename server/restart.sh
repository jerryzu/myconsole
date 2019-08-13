netstat -anp | grep 3000 | grep LISTEN | awk '{print $7}' | awk -F/ '{print $1}' | xargs kill -9
node index.js
