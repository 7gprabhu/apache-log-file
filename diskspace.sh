/path/to/logs/*.log {
    daily
    rotate 180
    compress
    delaycompress
    notifempty
    missingok
    size 50M
    create 640 root adm
    sharedscripts
    postrotate
        /usr/bin/find /path/to/logs/ -type f -name '*.log.2023-05-15' -mtime +210 -exec gzip {} \;
    endscript
    prerotate
        if [ -d /path/to/logs/recent ]; then
            /usr/bin/find /path/to/logs/ -type f -name '*.log' -mtime -90 -exec cp --preserve=timestamps {} /path/to/logs/recent \;
        fi
    endscript
}
