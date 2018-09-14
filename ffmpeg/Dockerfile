from aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=ffmpeg VERSION=n3.4.4

# install ffmpeg
ENV FFMPEG_RELEASE_TAG n3.4.4
RUN git clone -b ${FFMPEG_RELEASE_TAG} https://github.com/ffmpeg/ffmpeg.git /var/local/git/ffmpeg && \
    echo "--- installing ffmpeg ---" && \
    cd /var/local/git/ffmpeg && \
    ./configure \
        --enable-gpl \
        --enable-version3 \
        --enable-nonfree \
        --enable-shared \
        --enable-static \
        --enable-small \
        --enable-doc \
        --disable-debug \
        \
        --disable-avdevice \
        --enable-avcodec \
        --enable-avformat \
        --enable-swresample \
        --enable-swscale \
        --enable-postproc \
        --enable-avfilter \
        --enable-avresample \
        \
        --enable-encoders \
        --enable-decoders \
        --enable-hwaccels \
        --enable-muxers \
        --enable-demuxers \
        --enable-parsers \
        --enable-bsfs \
        --enable-protocols \
        --disable-devices \
        --enable-filters \
        \
        --disable-cuda \
        --disable-cuvid \
        --disable-nvenc \
        --disable-v4l2_m2m \
        && \
    make && make install && make clean && ldconfig
    
