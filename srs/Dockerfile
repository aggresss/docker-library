FROM aggresss/elementary:bionic

MAINTAINER yujia <aggresss@163.com>
LABEL IMAGE=srs VERSION=v2.0-r4

RUN git clone --depth=1 -b v2.0-r4 https://github.com/ossrs/srs.git && \
cd srs/trunk && \
./configure && \
make

EXPOSE 8080
EXPOSE 1935

WORKDIR /srs/trunk
ENTRYPOINT ["/srs/trunk/objs/srs"]
CMD ["-c", "conf/http.flv.live.conf"]
