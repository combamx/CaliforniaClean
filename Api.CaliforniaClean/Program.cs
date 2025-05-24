using Api.CaliforniaClean.Middleware;
using Api.DbContext.CaliforniaEF;
using Azure.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
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
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer ( );
builder.Services.AddSwaggerGen ( c =>
{
    c.SwaggerDoc ( "v1" , new ( ) { Title = "Api.CaliforniaClean" , Version = "v1" } );

    // 🔐 Añadir soporte para JWT
    c.AddSecurityDefinition ( "Bearer" , new Microsoft.OpenApi.Models.OpenApiSecurityScheme
    {
        In = Microsoft.OpenApi.Models.ParameterLocation.Header ,
        Description = "Ingresa el token JWT como: Bearer {token}" ,
        Name = "Authorization" ,
        Type = Microsoft.OpenApi.Models.SecuritySchemeType.ApiKey ,
        Scheme = "Bearer"
    } );

    c.AddSecurityRequirement ( new Microsoft.OpenApi.Models.OpenApiSecurityRequirement
    {
        {
            new Microsoft.OpenApi.Models.OpenApiSecurityScheme
            {
                Reference = new Microsoft.OpenApi.Models.OpenApiReference
                {
                    Type = Microsoft.OpenApi.Models.ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            Array.Empty<string>()
        }
    } );
} );

builder.Services.AddDbContext<californiaContext> ( options => options.UseSqlServer ( ConnectionString ) );

builder.Services.AddControllersWithViews ( ).AddNewtonsoftJson ( options =>
{
    options.SerializerSettings.Converters.Add ( new StringEnumConverter ( new CamelCaseNamingStrategy ( true , true ) ) );
    options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
} );

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

builder.Services.AddMemoryCache ( );
builder.Services.Configure<IpRateLimitOptions> ( builder.Configuration.GetSection ( "IpRateLimiting" ) );
builder.Services.AddInMemoryRateLimiting ( );
builder.Services.AddSingleton<IRateLimitConfiguration , RateLimitConfiguration> ( );


var app = builder.Build ( );


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment ( ))
{
    app.UseSwagger ( );
    app.UseSwaggerUI ( );
}

app.UseHttpsRedirection ( );

app.UseRequestMonitor ( );
app.UseSecurityHeaders ( );
app.UseAuthentication ( );
app.UseAuthorization ( );

app.UseCors ( "AllowFrontend" );

app.MapControllers ( );

app.Run ( );
