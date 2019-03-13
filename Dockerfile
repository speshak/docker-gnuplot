FROM alpine:3.9
LABEL maintainer="Scott Peshak <scott@peshak.net>"

RUN apk update && \
  apk add --no-cache gnuplot python3 make curl


# Install aws-cli
RUN apk -Uuv add groff less python py-pip && \
  pip install awscli && \
  apk --purge -v del py-pip && \
  rm /var/cache/apk/*
