using Api.CaliforniaClean.Middleware;
using Api.DbContext.CaliforniaEF;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;
using System.Text;

var builder = WebApplication.CreateBuilder ( args );

// 🛠 Configuración de la cadena de conexión
var connectionString = builder.Configuration.GetConnectionString ( "california_db" );
builder.Services.AddDbContext<californiaContext> ( options =>
    options.UseSqlServer ( connectionString ) );

// ⚙️ Configuración de controladores y JSON
builder.Services.AddControllers ( )
    .AddNewtonsoftJson ( options =>
    {
        options.SerializerSettings.Converters.Add ( new StringEnumConverter ( new CamelCaseNamingStrategy ( true , true ) ) );
        options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
    } );

// 🔐 Configuración de autenticación JWT
var jwtSettings = builder.Configuration.GetSection ( "Jwt" );
var key = Encoding.UTF8.GetBytes ( jwtSettings [ "Key" ] );

builder.Services.AddAuthentication ( options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
} )
.AddJwtBearer ( options =>
{
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true ,
        ValidateAudience = true ,
        ValidateLifetime = true ,
        ValidateIssuerSigningKey = true ,
        ValidIssuer = jwtSettings [ "Issuer" ] ,
        ValidAudience = jwtSettings [ "Audience" ] ,
        IssuerSigningKey = new SymmetricSecurityKey ( key )
    };
} );

// 📦 Configuración de Swagger con soporte JWT
builder.Services.AddEndpointsApiExplorer ( );
builder.Services.AddSwaggerGen ( c =>
{
    c.SwaggerDoc ( "v1" , new OpenApiInfo { Title = "Api.CaliforniaClean" , Version = "v1" } );

    c.AddSecurityDefinition ( "Bearer" , new OpenApiSecurityScheme
    {
        In = ParameterLocation.Header ,
        Description = "Ingresa el token como: Bearer {tu_token}" ,
        Name = "Authorization" ,
        Type = SecuritySchemeType.ApiKey ,
        Scheme = "Bearer"
    } );

    c.AddSecurityRequirement ( new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            Array.Empty<string>()
        }
    } );
} );

// 🚀 Aplicación
var app = builder.Build ( );

if (app.Environment.IsDevelopment ( ))
{
    app.UseSwagger ( );
    app.UseSwaggerUI ( );
}

// 🛡️ Middlewares personalizados
app.UseRequestMonitor ( );      // Monitorea IP y user-agent y envía alertas por correo
app.UseSecurityHeaders ( );     // Agrega cabeceras de seguridad HTTP

app.UseHttpsRedirection ( );
app.UseAuthentication ( );
app.UseAuthorization ( );
app.MapControllers ( );
app.Run ( );
