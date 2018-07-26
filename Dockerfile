FROM alpine:3.5
MAINTAINER James Hunt <concourse@jameshunt.us>

ADD bin/ /opt/resource/

RUN apk add --no-cache curl bash jq gettext-dev ca-certificates \
 && chmod +x /opt/resource/out /opt/resource/in /opt/resource/check \
 && rm -rf /tmp/*
