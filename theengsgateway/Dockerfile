ARG BUILD_FROM
FROM $BUILD_FROM
LABEL io.hass.version="1.12.0" io.hass.type="addon" io.hass.arch="armv7|armhf|aarch64|i386|amd64"
RUN apt-get update && apt-get upgrade -y && \
    apt-get install --no-install-recommends -y build-essential bluez python3-pip python3-dev && \
    pip3 install --break-system-packages --extra-index-url=https://www.piwheels.org/simple TheengsGateway==1.7.5 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
ENV current=/root
ENV HOME=$current
WORKDIR $current
COPY run.sh /root
COPY entrypoint.sh /root
RUN chmod a+x /root/run.sh
RUN chmod a+x /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]
CMD [ "/root/run.sh" ]
