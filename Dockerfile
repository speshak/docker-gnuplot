FROM alpine:3.9
LABEL maintainer="Scott Peshak <scott@peshak.net>"

RUN apk update && \
  apk add --no-cache \
    coreutils \
    curl \
    gnuplot \
    make \
    python3


# Install aws-cli
RUN apk -Uuv add groff less python py-pip && \
  pip install awscli && \
  apk --purge -v del py-pip

# Install fonts
RUN apk --no-cache add msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f

RUN rm /var/cache/apk/*
