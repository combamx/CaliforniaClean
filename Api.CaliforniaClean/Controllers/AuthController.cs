using Api.CaliforniaClean.RequestModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Api.CaliforniaClean.Controllers
{
    [Route ( "api/[controller]" )]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IConfiguration _config;

        public AuthController ( IConfiguration config )
        {
            _config = config;
        }

        [HttpPost ( "login" )]
        public IActionResult Login ( [FromBody] UserLogin login )
        {
            // Simulación. En producción valida desde la BD
            if (login.Username == "admin" && login.Password == "admin123")
            {
                var token = GenerateJwtToken ( login.Username );
                return Ok ( new { token } );
            }

            return Unauthorized ( "Credenciales inválidas." );
        }

        private string GenerateJwtToken ( string username )
        {
            var jwt = _config.GetSection ( "Jwt" );
            var securityKey = new SymmetricSecurityKey ( Encoding.UTF8.GetBytes ( jwt [ "Key" ] ) );
            var credentials = new SigningCredentials ( securityKey , SecurityAlgorithms.HmacSha256 );

            var claims = new []
            {
            new Claim(ClaimTypes.Name, username)
        };

            var token = new JwtSecurityToken (
                issuer: jwt [ "Issuer" ] ,
                audience: jwt [ "Audience" ] ,
                claims: claims ,
                expires: DateTime.Now.AddHours ( 2 ) ,
                signingCredentials: credentials
            );

            return new JwtSecurityTokenHandler ( ).WriteToken ( token );
        }
    }
}
