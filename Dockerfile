FROM qxip/baresip-docker:latest
RUN apt-get update && \
    apt-get -y install --reinstall libgstreamer1.0-0 gstreamer1.0-plugins-ugly libx11-6
RUN ldconfig
CMD ["/usr/local/bin/baresip", "-v", "-f", "/etc/baresip"]
