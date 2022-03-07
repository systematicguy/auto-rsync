echo "rsync options: ${rsync_options}"
echo "inotifywait_events: ${inotifywait_events}"
echo "initial rsync..."
rsync ${rsync_options} /mnt/source/ /mnt/destination/
while inotifywait -r -e ${inotifywait_events} /mnt/source/; do
    date -Iseconds
    echo "rsync..."
    rsync ${rsync_options} /mnt/source/ /mnt/destination/
    echo "-----"
done
