using Api.DbContext.CaliforniaEF;
using Azure.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;
using System.Text.Json;
using Azure.Security.KeyVault.Secrets;
using Azure.Extensions.AspNetCore.Configuration.Secrets;
using System.Security.Cryptography.X509Certificates;

var builder = WebApplication.CreateBuilder ( args );


var keyVaultEndpoint = builder.Configuration [ "AzureKeyVault:VaultUrl" ];
var clientId = builder.Configuration [ "AzureKeyVault:ClientId" ];
var clientSecret = builder.Configuration [ "AzureKeyVault:ClientSecret" ];

var credential = new DefaultAzureCredential ( );
var client = new SecretClient ( new Uri ( keyVaultEndpoint ) , credential );

var secret = client.GetSecret ( clientSecret );

var ConnectionString = secret.Value.Value; //builder.Configuration.GetConnectionString ( "california_db" );

// Add services to the container.

builder.Services.AddControllers ( );
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer ( );
builder.Services.AddSwaggerGen ( );
builder.Services.AddDbContext<californiaContext> ( options => options.UseSqlServer ( ConnectionString ) );
builder.Services.AddControllers ( )
        .AddNewtonsoftJson ( options =>
        {
            options.SerializerSettings.Converters.Add ( new StringEnumConverter ( new CamelCaseNamingStrategy ( true, true ) ));
            options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
        } );
builder.Services.AddControllersWithViews ( ).AddNewtonsoftJson ( );

var app = builder.Build ( );


// Configure the HTTP request pipeline.
if ( app.Environment.IsDevelopment ( ) )
{
    app.UseSwagger ( );
    app.UseSwaggerUI ( );
}

app.UseHttpsRedirection ( );

app.UseAuthorization ( );

app.MapControllers ( );

app.Run ( );
