FROM amazon/aws-cli:latest

RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_arm64/session-manager-plugin.rpm" \
  -o session-manager-plugin.rpm \
  && yum install -y ./session-manager-plugin.rpm openssh-clients socat python3-pip \
  && pip3 install supervisor \
  && yum clean all

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && \
    mkdir -p /var/log/supervisor && \
    mkdir -p /etc/supervisor.d

ENTRYPOINT ["/entrypoint.sh"]