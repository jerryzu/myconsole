 netstat -anp | grep 8080 | grep LISTEN | awk '{print $7}' | awk -F/ '{print $1}' | xargs kill -9
 npm run dev
