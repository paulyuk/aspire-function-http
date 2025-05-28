# Starter Template for Functions in Aspire 9

## https://aka.ms/aspire-function

![image](https://github.com/user-attachments/assets/ca6b7694-5dc4-440c-a1a7-11c946404be8)


## Overview

**Azure Functions with .NET Aspire** integrates serverless computing with cloud-native application development. This template demonstrates how to build, test, and deploy Azure Functions in an Aspire application architecture.

### Key Use Cases

1. **Microservices Integration** - Use Azure Functions for event-driven processing within a broader microservices architecture, managed by Aspire.
2. **API Development** - Create scalable HTTP endpoints that can be independently deployed and scaled, while maintaining development consistency with other Aspire components.

## Pre-requisites

1. **.NET 9 SDK** - Make sure you have the latest .NET 9 SDK installed. Download from [dot.net](https://dotnet.microsoft.com/download/dotnet/9.0).
   ```shell
   # Verify installation
   dotnet --version
   # Should output 9.0.300 or higher
   ```

2. **Aspire Templates** - Install the Aspire project templates:
   ```shell
   dotnet new install Aspire.ProjectTemplates
   ```

3. **Azure Development Tools** (optional for deployment):
    - [Azure Functions Core Tools](https://learn.microsoft.com/azure/azure-functions/functions-run-local#install-the-azure-functions-core-tools)
    - [Azurite Storage Emulator](https://learn.microsoft.com/azure/storage/common/storage-use-azurite)
    - [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)

## Running

In Visual Studio or Visual Studio Code you can simply F5.

From the command line, just do a `dotnet run` inside the AppHost folder:
```shell
cd apphost
dotnet run
```

## Deploying

```shell
azd up
```

## Code

This project contains several key files that demonstrate Azure Functions with .NET Aspire:

### Function Code
* [`function/httpGetFunction.cs`](function/httpGetFunction.cs) - HTTP GET trigger example
* [`function/httpPostBodyFunction.cs`](function/httpPostBodyFunction.cs) - HTTP POST with JSON body example

### Aspire Integration
* [`apphost/Program.cs`](apphost/Program.cs) - Where the Function project is wired up with Aspire

### Testing
* [`function/test/test.http`](function/test/test.http) - HTTP request tests for local and deployed environments
* [`function/test/loadtest.sh`](function/test/loadtest.sh) - Load testing script for performance evaluation

### Deployment
* [`Dockerfile`](Dockerfile) - Example Dockerfile with FFMPEG installation
