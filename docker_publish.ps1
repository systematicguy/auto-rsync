docker login -u systematicguy
docker build -t systematicguy/auto-rsync:latest .
docker push systematicguy/auto-rsync:latest