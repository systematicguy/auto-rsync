# Introduction
I have created this small utility to be able to sync two folders locally.
I needed the ability to do this on a continuous basis, that's why I combine `inotifywait` and `rsync`.
I do this locally on a Synology NAS, that's why I don't compress the files by default.
I wanted to keep it as lightweight as it gets basing it onto the `apline` image.

# Usage
- ensure these 2 mounts:
  - `/mnt/source`
  - `/mnt/destination`
- optionally set the environment variable `options` to  override the default `-av` 

# Resources
- https://github.com/sergeyfast/alpine-rsync/blob/master/Dockerfile
- https://stackoverflow.com/a/40525217/429162
- https://linux.die.net/man/1/rsync

# Windows-limitation
 Even though you can mount directories from Windows (NTFS?), 
 it won't notice filesystem changes done to the files if you in Windows.

 It also did not work for me if I started the container from windows.

 You need to do run the container from a Unix system (WSL will do) and also do the filesystem changes from there.
 
 https://github.com/docker/for-win/issues/8479