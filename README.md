# apache-log-file

Task - 1
This script uses grep to search for lines in the specified file ($filename) that match the pattern of an HTTP error status code (4xx or 5xx). The wc command then counts the number of matching lines. If the number of errors is greater than 100, the script sends an email to the specified user with a message indicating the high number of error responses and the filename.
To run this script periodically, you can use a scheduling tool like cron. For example, to run the script every hour, you could add the following line to your crontab file (crontab -e):
0 * * * * /path/to/logfile.sh /path/to/apache_log_file
This would run the script at the beginning of every hour, passing the path to the Apache log file as the first argument.


Task - 2
One solution to manage the log files and free up disk space is to use a log rotation mechanism. This mechanism rotates the logs by compressing and archiving them based on age, size, or number of files. To meet the requirements, we can use a combination of time-based and size-based log rotation with a retention policy of 7 years for archived logs. The logs up to 3 months old that are required for troubleshooting can be kept uncompressed in a separate directory.

This configuration rotates the logs daily, keeps up to 180 compressed logs, compresses the log files when rotated, skips rotation if the log file is empty or missing, rotates the log file when it reaches 50MB in size, creates new log files with 640 permissions, and runs the shared scripts once for all rotated logs. The postrotate script gzips the rotated logs that are older than 210 days. The prerotate script copies the logs up to 3 months old to the /path/to/logs/recent directory with the same file modification times. The retention policy for the archived logs can be set to 7 years, after which they can be deleted or moved to a separate storage system.
