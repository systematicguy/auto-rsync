docker stop autorsync
docker run --rm --name autorsync \
  -e rsync_options=-av \
  -v ${PWD}/testfiles/source:/mnt/source \
  -v ${PWD}/testfiles/destination:/mnt/destination \
  auto-rsync
