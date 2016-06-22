FROM kino/conts:fed24

ADD cmus-2.7.1.tar.gz /tmp/

RUN (dnf install -y pulseaudio-libs-devel ffmpeg-devel libcue-devel; \
     cd /tmp/cmus-2.7.1; \
     ./configure prefix=/usr/local/docker/cmus/; \
     make install)


EXPOSE 22
CMD ["/usr/local/startservice.sh"]
