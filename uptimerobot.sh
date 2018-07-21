#!/bin/bash
UP_API_KEY=u564956-800632ea2da1895613b82919
SERVER_NAME=HAV-01
SERVER_STATUS=`curl -s -X POST https://api.uptimerobot.com/v2/getMonitors -H "Content-Type: application/x-www-form-urlencoded" -H "Cache-Control: no-cache" -d "api_key=$UP_API_KEY&format=json&response_times=1&response_times_limit=1&search=$SERVER_NAME" | jq '.monitors[] | {api_key: "'$GB_API_KEY'", "data":{status: (if .status == 2 then "Up" elif .status >= 8 then "Down" else "Unreported" end), responseTime: (.response_times[].value | tostring)}}'`
echo "$SERVER_STATUS"
