FROM amazon/aws-cli

RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_arm64/session-manager-plugin.rpm" \
  -o session-manager-plugin.rpm \
  && yum install -y ./session-manager-plugin.rpm openssh-clients