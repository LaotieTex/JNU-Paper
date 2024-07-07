FROM ubuntu:24.04
ENV PATH /usr/local/bin/texlive/:$PATH

RUN apt-get update \
  && apt-get install -y \
  apt-get install language-pack-zh* \
  libfontconfig \
  fonts-arphic-bkai00mp \
  fonts-arphic-bsmi00lp \
  fonts-arphic-gbsn00lp \
  fonts-arphic-gkai00mp \
  fonts-arphic-ukai \
  fonts-arphic-uming \
  fonts-noto-cjk

ENV LANG=zh_CN.UTF-8 \
    LC_ALL=zh_CN.UTF-8
