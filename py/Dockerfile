FROM kino/conts:fed24

RUN (dnf update; \
     dnf install -y python3-pillow-devel)

EXPOSE 22
CMD ["/usr/local/startservice.sh"]
