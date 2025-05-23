using Api.CaliforniaClean.Helpers;
using Api.CaliforniaEF;
using Api.DbContext.CaliforniaEF;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api.CaliforniaClean.Controllers
{
    [Authorize]
    [ApiController]
    [Route ( "api/[controller]" )]
    public class VListProjectsController : ControllerBase
    {
        private readonly californiaContext _context;

        public VListProjectsController ( californiaContext context )
        {
            _context = context;
        }

        // GET: api/VListProjects
        [HttpGet]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<vListProject>>> GetAll ( [FromQuery] PaginationParams pagination )
        {
            try
            {
                var query = _context.vListProjects.AsQueryable ( );

                // Aplicar ordenamiento dinámico
                query = query.ApplySorting ( pagination.OrderBy , pagination.Desc );

                // Total para encabezado
                var total = await query.CountAsync ( );
                Response.Headers.Add ( "X-Total-Count" , total.ToString ( ) );

                // Aplicar paginación
                var paged = await query.ApplyPagination ( pagination ).ToListAsync ( );

                return Ok ( paged );
            }
            catch (Exception ex)
            {
                return BadRequest ( ex.Message );
            }
        }


        // GET: api/VListProjects/5
        [HttpGet ( "{id}" )]
        public async Task<ActionResult<vListProject>> GetById ( int id )
        {
            var item = await _context.vListProjects.FirstOrDefaultAsync ( p => p.ID == id );
            if (item == null)
                return NotFound ( );

            return Ok ( item );
        }
    }
}
