# Use the official Azure Functions .NET image as a parent image
FROM mcr.microsoft.com/azure-functions/dotnet:4 AS base

# Install ffmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Use the SDK image to build the application
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY ["FunctionApp2.AppHost/FunctionApp2.AppHost.csproj", "FunctionApp2.AppHost/"]
RUN dotnet restore "FunctionApp2.AppHost/FunctionApp2.AppHost.csproj"
COPY . .
WORKDIR /src/FunctionApp2.AppHost
RUN dotnet build "FunctionApp2.AppHost.csproj" -c Release -o /app/build
# TODO: add a proper dotnet publish equivalent here for aspire
# Use the base image to run the application
FROM base AS final
WORKDIR /home/site/wwwroot
COPY --from=build /app/build .
ENTRYPOINT ["dotnet", "FunctionApp2.AppHost.dll"]
