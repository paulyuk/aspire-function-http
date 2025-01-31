var builder = DistributedApplication.CreateBuilder(args);
    
builder.AddAzureFunctionsProject<Projects.FunctionApp2>("http");

builder.Build().Run();
