# Starter Template for Functions in Aspire 9

## https://aka.ms/aspire-function

![image](https://github.com/user-attachments/assets/ca6b7694-5dc4-440c-a1a7-11c946404be8)

## Running

In Visual Studio or Visual Studio Code you can simply F5.

From the command line, just do a `dotnet run` inside the AppHost folder:
```shell
cd FunctionApp2.AppHost
dotnet run
```

## Deploying

```shell
azd up
```

## Code

Check out the main simplistic function code with HTTP trigger.  Edit as you like.

[httpGetFunction.cs](function/httpGetFunction.cs)
[httpPostFunction.cs](function/httpPostBodyFunction.cs)

Also here is where the Function project is wired up with Aspire in the AppHost:

[Program.cs](apphost/Program.cs)

Test the app with this file:

[test.http](function/test/test.http)

Load test the app with this file:
[loadtest.sh](function/test/loadtest.sh)

Here is a starting point for a Dockerfile that shows example of adding FFMPEG:

[Dockerfile](Dockerfile)
