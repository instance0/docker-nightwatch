FROM node:12.14
LABEL maintainer="Atsushi Nagase<ngs@ins0.jp>"

ADD setup.sh setup.sh
RUN /bin/sh setup.sh
