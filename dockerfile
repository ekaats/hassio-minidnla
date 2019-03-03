ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
ENV UPNP_SPEAKER_VERSION=0.1

RUN apk update && \
    apk upgrade && \
    apk add --no-cache gmrender-resurrect &&
    rm -rf /var/cache/apk/*

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
