FROM debian:buster-slim

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y wget openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "armv7l" ] ; then DEB=aprx_2.9.0_raspi.deb ; else DEB=aprx_2.9.0_amd64.deb ; fi && \
    wget --inet4-only -O /tmp/aprx.deb https://thelifeofkenneth.com/aprx/debs/$DEB && \
    dpkg -i /tmp/aprx.deb

CMD ["aprx", "-f", "/etc/aprx.conf", "-v", "-dd", "-L"]
