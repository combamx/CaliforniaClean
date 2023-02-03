using Api.DbContext.CaliforniaEF;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;
using System.Text.Json;

var builder = WebApplication.CreateBuilder ( args );
var ConnectionString = builder.Configuration.GetConnectionString ( "california_db" );

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
