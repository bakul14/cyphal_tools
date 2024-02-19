FROM alpine
COPY _opt /opt/vscode
VOLUME /opt/vscode
CMD ["/bin/sh", "-c", "trap 'exit 147' TERM; tail -f /dev/null & wait ${!}"]
