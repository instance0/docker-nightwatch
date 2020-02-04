FROM node:12.14
LABEL maintainer="Atsushi Nagase<ngs@ins0.jp>"

RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
RUN echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN \
      apt-get -y update && \
      apt-get -y \
        install \
        libnss3-dev \
        unzip \
        xvfb \
        libxi6 \
        libgconf-2-4\
        default-jdk \
        google-chrome-stable \
        firefox-esr

RUN npm config set scripts-prepend-node-path true
