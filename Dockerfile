FROM alpine

# https://linux.die.net/man/1/rsync
#-a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
ARG options="-av"

COPY rsync_loop.sh /

ENV options ${options}

RUN apk update
RUN apk add rsync inotify-tools

CMD ["sh", "/rsync_loop.sh"]