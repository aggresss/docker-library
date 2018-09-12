from aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=ffmpeg VERSION=n3.4.4

# install ffmpeg
ENV FFMPEG_RELEASE_TAG n3.4.4
RUN git clone -b ${FFMPEG_RELEASE_TAG} https://github.com/ffmpeg/ffmpeg.git /var/local/git/ffmpeg && \
        echo "--- installing ffmpeg ---" && \
        cd /var/local/git/ffmpeg && \
        ./configure \
            --disable-doc \
            --enable-gpl \
            --enable-version3 \
            --enable-nonfree \
            --enable-shared \
            --enable-static \
            --enable-avresample && \
        make && make install && make clean && ldconfig
