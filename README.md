# apache-log-file

Task - 1
This script uses grep to search for lines in the specified file ($filename) that match the pattern of an HTTP error status code (4xx or 5xx). The wc command then counts the number of matching lines. If the number of errors is greater than 100, the script sends an email to the specified user with a message indicating the high number of error responses and the filename.
To run this script periodically, you can use a scheduling tool like cron. For example, to run the script every hour, you could add the following line to your crontab file (crontab -e):
0 * * * * /path/to/logfile.sh /path/to/apache_log_file
This would run the script at the beginning of every hour, passing the path to the Apache log file as the first argument.

