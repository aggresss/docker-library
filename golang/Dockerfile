FROM aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=golang VERSION=1.10.3

# Golang configuration
RUN curl -OL http://pdi3zh561.bkt.clouddn.com/go/go1.10.3.linux-amd64.tar.gz && \
tar -C /usr/local -xzf go1.10.3.linux-amd64.tar.gz && \
rm -rf go1.10.3.linux-amd64.tar.gz
ENV GOPATH /go
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
WORKDIR $GOPATH
