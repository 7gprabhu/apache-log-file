#!/bin/bash
# Set the filename as the first parameter to the script
filename=$1
# Count the number of HTTP 4xx and 5xx response statuses
errors=$(grep -E 'HTTP/1.[01]" (4|5)[0-9][0-9] ' $filename | wc -l)
# If the cumulative number of errors exceeds 100, send an email alert
if [ $errors -gt 100 ]; then
    echo "There were $errors HTTP error responses in $filename." | \
        mail -s "High number of error responses in Apache log file" 7gprabhu@gmail.com.com
fi
