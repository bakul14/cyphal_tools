FROM alpine
COPY _opt /opt/pycharm
VOLUME /opt/pycharm
CMD ["/bin/sh", "-c", "trap 'exit 147' TERM; tail -f /dev/null & wait ${!}"]
