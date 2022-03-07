FROM alpine

# https://linux.die.net/man/1/rsync
#-a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
ARG rsync_options="-av"
ENV rsync_options ${rsync_options}

ARG inotifywait_events="modify,create,delete,move"
ENV inotifywait_events ${inotifywait_events}

COPY rsync_loop.sh /

RUN apk update
RUN apk add rsync inotify-tools

CMD ["sh", "/rsync_loop.sh"]