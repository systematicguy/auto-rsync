echo "rsync options: ${options}"
echo "initial rsync"
rsync ${options} /mnt/source/ /mnt/destination/
while inotifywait -r -e modify,create,delete,move /mnt/source/; do
    rsync ${options} /mnt/source/ /mnt/destination/
done