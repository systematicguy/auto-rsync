# Introduction
I have created this small utility to be able to sync two folders locally.
I needed the ability to do this on a continuous basis, that's why I combine `inotifywait` and `rsync`.
I do this locally on a Synology NAS, that's why I don't compress the files by default.
I wanted to keep it as lightweight as it gets basing it onto the `apline` image.

# Usage
- ensure these 2 mounts:
  - `/mnt/source`
  - `/mnt/destination`
- optionally set the environment variable `rsync_options` to  override the default `-av` 
- optionally set the environment variable `inotifywait_events` to a `,`-separated list (default: `modify,create,delete,move`)

# Examples
```
docker run --rm -v ${PWD}/testfiles/source:/mnt/source -v ${PWD}/testfiles/destination:/mnt/destination systematicguy/auto-rsync:latest
docker run --rm -e rsync_options=-avz -v ${PWD}/testfiles/source:/mnt/source -v ${PWD}/testfiles/destination:/mnt/destination systematicguy/auto-rsync:latest
docker run --rm -e rsync_options="-av --chown=targetuser:targetgroup" -v ${PWD}/testfiles/source:/mnt/source -v ${PWD}/testfiles/destination:/mnt/destination systematicguy/auto-rsync:latest
docker run --rm -e rsync_options="-av" -e inotifywait_events="create,move" -v ${PWD}/testfiles/source:/mnt/source -v ${PWD}/testfiles/destination:/mnt/destination systematicguy/auto-rsync:latest
```

# Resources
- https://github.com/sergeyfast/alpine-rsync/blob/master/Dockerfile
- https://stackoverflow.com/a/40525217/429162
- https://linux.die.net/man/1/rsync
- https://linux.die.net/man/1/inotifywait
- https://www.baeldung.com/linux/inotify-upper-limit-reached

# Windows-limitation
 Even though you can mount directories from Windows (NTFS?), 
 it won't notice filesystem changes done to the files if you in Windows.

 It also did not work for me if I started the container from windows.

 You need to do run the container from a Unix system (WSL will do) and also do the filesystem changes from there.
 
 https://github.com/docker/for-win/issues/8479