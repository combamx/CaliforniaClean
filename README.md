# 🧼 CaliforniaClean API - .NET Core

API RESTful desarrollada con **ASP.NET Core Web API** para la gestión de proyectos de limpieza profesional. Esta API permite administrar clientes, vendedores, órdenes de trabajo, documentos, comentarios, trabajadores y más.

---

## 📁 Estructura del proyecto

✅ README.md — Versión C# (.NET Core)
markdown
Copiar
Editar

---

## 🚀 Tecnologías

- ASP.NET Core 8
- Entity Framework Core 9
- SQL Server
- JWT Authentication
- AutoMapper
- Swagger / OpenAPI 3.0
- Seguridad con middlewares personalizados
- Paginación y ordenamiento dinámico
- Envío de alertas por correo (SMTP)

---

## 📁 Estructura del proyecto

CaliforniaClean/
  - ├── Controllers/ # Controladores REST por entidad
  - ├── Models/ # Entidades EF + DTOs
  - ├── Middleware/ # Seguridad, monitoreo y cabeceras
  - ├── Helpers/ # Paginación y extensiones
  - ├── DbContext/ # Contexto de Entity Framework
  - ├── appsettings.json # Configuración general y secreta
  - ├── Program.cs # Entrada principal

---

## ⚙️ Configuración

1. Clona el repositorio:

```bash
git clone https://github.com/tuUsuario/CaliforniaClean.git
cd CaliforniaClean

## Asegúrate de tener SQL Server instalado y actualiza tu cadena de conexión en appsettings.json:
"ConnectionStrings": {
  "california_db": "Server=localhost;Database=CaliforniaClean;User Id=sa;Password=TuClave123;"
}

## Configura los valores de autenticación y correo:
"Jwt": {
  "Key": "clave_super_secreta_256_bits",
  "Issuer": "californiaclean.api",
  "Audience": "californiaclean.app"
},
"EmailSettings": {
  "Host": "smtp.gmail.com",
  "Port": "587",
  "Username": "tucorreo@gmail.com",
  "Password": "claveSegura",
  "From": "tucorreo@gmail.com",
  "To": "admin@empresa.com",
  "UseSSL": "true"
},
"Security": {
  "BlockedIps": [ "192.168.1.10" ]
}

## Ejecuta el proyecto desde Visual Studio o con CLI:
dotnet build
dotnet run

## Autenticación
La API usa JWT para proteger rutas.
Llama a:
POST /api/login
{
  "username": "admin",
  "password": "admin123"
}

## Luego, usa el token en los headers:
Authorization: Bearer {token}

## Documentación interactiva (Swagger)
https://localhost:{puerto}/swagger

## Licencia
Distribuido bajo la MIT License.





