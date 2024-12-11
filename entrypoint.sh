#!/bin/bash

# aws-ssm用 設定ファイルを動的に生成
cat << EOS1 > /etc/supervisor.d/aws-ssm.conf
[program:aws-ssm]
command=/usr/local/bin/aws $@
autostart=true
autorestart=true
stdout_logfile=/dev/stdout
stderr_logfile=/dev/stderr
EOS1

# socat用 設定ファイルを動的に生成
cat << EOS2 > /etc/supervisor.d/aws-ssm.conf
[program:socat]
command=socat TCP-LISTEN:${PORT},fork,reuseaddr TCP:127.0.0.1:${PORT}
autostart=true
autorestart=true
stdout_logfile=/dev/stdout
stderr_logfile=/dev/stderr
EOS2

# Supervisor を起動
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf