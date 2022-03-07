$TAG="1.1.0"
docker login -u systematicguy
docker build -t systematicguy/auto-rsync:latest .
docker tag systematicguy/auto-rsync:latest systematicguy/auto-rsync:$TAG
docker push systematicguy/auto-rsync:latest
docker push systematicguy/auto-rsync:$TAG
