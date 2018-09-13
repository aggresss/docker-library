from aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=grpc VERSION=1.14.1

# fork from https://github.com/grpc/grpc-docker-library/blob/master/1.12.0/cxx/Dockerfile

# install protobuf first, then grpc
ENV GRPC_RELEASE_TAG v1.14.1
RUN git clone -b ${GRPC_RELEASE_TAG} https://github.com/grpc/grpc /var/local/git/grpc && \
		cd /var/local/git/grpc && \
    git submodule update --init && \
    echo "--- installing protobuf ---" && \
    cd third_party/protobuf && \
    ./autogen.sh && ./configure --enable-shared && \
    make -j$(nproc) && make -j$(nproc) check && make install && make clean && ldconfig && \
    echo "--- installing grpc ---" && \
    cd /var/local/git/grpc && \
    make -j$(nproc) && make install && make clean && ldconfig && \
    strip -g /usr/local/lib/*.a
