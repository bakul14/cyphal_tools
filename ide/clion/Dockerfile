FROM alpine
COPY _opt /opt/clion
VOLUME /opt/clion
CMD ["/bin/sh", "-c", "trap 'exit 147' TERM; tail -f /dev/null & wait ${!}"]
