FROM kino/conts:fed22

RUN (dnf update; \
     dnf install -y python3-pillow-devel)

EXPOSE 22
CMD ["/usr/local/startservice.sh"]
