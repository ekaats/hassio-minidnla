ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
ENV UPNP_SPEAKER_VERSION=0.1

RUN apk update && \
    apk upgrade && \
    apk add --no-cache libupnp-dev libgstreamer1.0-dev \
             gstreamer1.0-plugins-base gstreamer1.0-plugins-good \
             gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly \
             gstreamer1.0-libav gstreamer1.0-alsa&& \
             gmrender-resurrect
    rm -rf /var/cache/apk/*

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
