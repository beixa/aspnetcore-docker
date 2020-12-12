FROM  mcr.microsoft.com/dotnet/sdk:3.1 AS build 
#The Working directory wich lives inside the Docker image
WORKDIR /code
#Copies the source files from our project to the Docker working directory
COPY . . 
#runs restore in order to restore Nuget packages and dependencies
RUN dotnet restore
#will generate the executable files, the output to the output folder on the image and use the Release confifuration
RUN dotnet publish --output /output --configuration Release

#To run the application
FROM mcr.microsoft.com/dotnet/aspnet:3.1
#Copies the result from the build image on output and copy it to app folder
COPY --from=build /output /app
WORKDIR /app
#to run the app we need to especify the entrypoint
ENTRYPOINT ["dotnet", "AspNetCoreOnDocker.dll"]
