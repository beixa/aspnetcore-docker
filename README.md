#Docker Hub images
docker pull mcr.microsoft.com/dotnet/aspnet:3.1
docker pull mcr.microsoft.com/dotnet/sdk:3.1

#Build command
docker build -t aspnetcore-docker-image:v1.0 .

#Run command
docker run -ti -p 5080:80 aspnetcore-docker-image:v1.0

#Tags(like versions) for images YOUR_DOCKERHUB_NAME/docker-whalename:vx.x
docker tag aspnetcore-docker-image:v1.0 beixa/dockerdemo:v1.0


#Login to docker hub
docker login

#push the image to docker hub, in order to push You need to rename the image to YOUR_DOCKERHUB_NAME/docker-whalename:vx.x
docker push beixa/dockerdemo:v1.0

#pull image from docker hub
docker pull beixa/dockerdemo:v1.0