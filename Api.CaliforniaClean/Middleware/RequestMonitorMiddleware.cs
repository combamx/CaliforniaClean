using System.Net;
using System.Net.Mail;

namespace Api.CaliforniaClean.Middleware
{
    public class RequestMonitorMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<RequestMonitorMiddleware> _logger;
        private readonly IConfiguration _config;
        private readonly List<string> _blockedIps;

        public RequestMonitorMiddleware ( RequestDelegate next , ILogger<RequestMonitorMiddleware> logger , IConfiguration config )
        {
            _next = next;
            _logger = logger;
            _config = config;
            _blockedIps = _config.GetSection ( "Security:BlockedIps" ).Get<List<string>> ( ) ?? new List<string> ( );
        }

        public async Task InvokeAsync ( HttpContext context )
        {
            var ipAddress = context.Connection.RemoteIpAddress?.ToString ( ) ?? "unknown";
            var userAgent = context.Request.Headers [ "User-Agent" ].ToString ( );

            _logger.LogInformation ( $"📡 Solicitud desde IP: {ipAddress}, User-Agent: {userAgent}" );

            if (_blockedIps.Contains ( ipAddress ) ||
                userAgent.Contains ( "sqlmap" ) ||
                userAgent.Contains ( "nmap" ) ||
                userAgent.Contains ( "scanner" ))
            {
                _logger.LogWarning ( $"🚨 Petición bloqueada: IP o User-Agent sospechoso ({ipAddress})" );
                await SendAlertEmailAsync ( ipAddress , userAgent );

                context.Response.StatusCode = 403;
                await context.Response.WriteAsync ( "Solicitud bloqueada por razones de seguridad." );
                return;
            }

            await _next ( context );
        }

        private async Task SendAlertEmailAsync ( string ip , string userAgent )
        {
            try
            {
                var smtp = _config.GetSection ( "EmailSettings" );
                var client = new SmtpClient ( smtp [ "Host" ] , int.Parse ( smtp [ "Port" ] ) )
                {
                    Credentials = new NetworkCredential ( smtp [ "Username" ] , smtp [ "Password" ] ) ,
                    EnableSsl = bool.Parse ( smtp [ "UseSSL" ] )
                };

                var message = new MailMessage
                {
                    From = new MailAddress ( smtp [ "From" ] ) ,
                    Subject = "🚨 Alerta de IP bloqueada" ,
                    Body = $"Se ha bloqueado una solicitud desde IP: {ip}, User-Agent: {userAgent}" ,
                    IsBodyHtml = false
                };
                message.To.Add ( smtp [ "To" ] );

                await client.SendMailAsync ( message );
            }
            catch (System.Exception ex)
            {
                _logger.LogError ( $"Error al enviar correo de alerta: {ex.Message}" );
            }
        }
    }

    public static class RequestMonitorMiddlewareExtensions
    {
        public static IApplicationBuilder UseRequestMonitor ( this IApplicationBuilder builder )
        {
            return builder.UseMiddleware<RequestMonitorMiddleware> ( );
        }
    }
}
