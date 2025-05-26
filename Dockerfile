# syntax=docker/dockerfile:1

# Set build argument for architecture, default to amd64
ARG TARGETARCH=amd64

# Use the official Azure Functions .NET image as a parent image, with platform support
FROM --platform=linux/${TARGETARCH} mcr.microsoft.com/azure-functions/dotnet:4 AS base

# Install ffmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Use the SDK image to build the application, with platform support
FROM --platform=linux/${TARGETARCH} mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY ["apphost/apphost.csproj", "apphost/"]
RUN dotnet restore "apphost/apphost.csproj"
COPY . .
WORKDIR /src/apphost
RUN dotnet build "apphost.csproj" -c Release -o /app/build
# TODO: add a proper dotnet publish equivalent here for aspire

# Example: Run different commands based on architecture
RUN if [ "${TARGETARCH}" = "arm64" ]; then \
      echo "Building for ARM64"; \
      # Place ARM64-specific commands here \
    else \
      echo "Building for AMD64"; \
      # Place AMD64-specific commands here \
    fi

# Use the base image to run the application
FROM base AS final
WORKDIR /home/site/wwwroot
COPY --from=build /app/build .
ENTRYPOINT ["dotnet", "apphost.dll"]
