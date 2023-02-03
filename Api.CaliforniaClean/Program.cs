using Api.DbContext.CaliforniaEF;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json.Converters;

var builder = WebApplication.CreateBuilder ( args );
var ConnectionString = builder.Configuration.GetConnectionString ( "california_db" );

// Add services to the container.

builder.Services.AddControllers ( );
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer ( );
builder.Services.AddSwaggerGen ( );
builder.Services.AddDbContext<californiaContext> ( options => options.UseSqlServer ( ConnectionString ) );
builder.Services.AddControllers ( )
        .AddNewtonsoftJson ( jsonOptions =>
        {
            jsonOptions.SerializerSettings.Converters.Add ( new StringEnumConverter ( ) );
        } );

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
