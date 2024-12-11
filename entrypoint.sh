#!/bin/bash

# make supervisor.d directory
mkdir -p /etc/supervisor.d

# generate aws-ssm config
cat << EOS1 > /etc/supervisor.d/aws-ssm.conf
[program:aws-ssm]
command=/usr/local/bin/aws $@
autostart=true
autorestart=true
stdout_logfile=/dev/stdout
stderr_logfile=/dev/stderr
stdout_logfile_maxbytes=0
stderr_logfile_maxbytes=0
EOS1

if [ -n "$LISTEN_PORT" ] && [ -n "$CONTAINER_LOCAL_PORT" ]; then
# generate socat config
cat << EOS2 > /etc/supervisor.d/socat.conf
[program:socat]
command=socat TCP-LISTEN:${LISTEN_PORT},fork,reuseaddr TCP:127.0.0.1:${CONTAINER_LOCAL_PORT}
autostart=true
autorestart=true
stdout_logfile=/dev/stdout
stderr_logfile=/dev/stderr
stdout_logfile_maxbytes=0
stderr_logfile_maxbytes=0
EOS2
fi

# Start supervisor
exec /usr/local/bin/supervisord -n -c /etc/supervisor/supervisord.conf