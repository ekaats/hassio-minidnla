ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
ENV MINIDNLA_VERSION=0.1

RUN apk add --no-cache minidlna

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
