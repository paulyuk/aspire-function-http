var builder = DistributedApplication.CreateBuilder(args);

var functions = builder.AddAzureFunctionsProject<Projects.function>("http")
                       .WithExternalHttpEndpoints();

// After adding all resources, run the app...
builder.Build().Run();
