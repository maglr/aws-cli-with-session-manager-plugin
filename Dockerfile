FROM amazon/aws-cli

RUN \
  if [[ "$(uname -m)" = "aarch64" ]] ; then curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_arm64/session-manager-plugin.rpm" -o "session-manager-plugin.rpm"; \
  elif [[ "$(uname -m)" = "x86_64" ]] ; then curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm"; \
  else curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_32bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm"; fi;

RUN yum install -y ./session-manager-plugin.rpm
