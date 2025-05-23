using Api.CaliforniaClean.Helpers;
using Api.CaliforniaEF;
using Api.DbContext.CaliforniaEF;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api.CaliforniaClean.Controllers
{
    [Authorize]
    [Route ( "api/[controller]" )]
    [ApiController]
    public class StatusProjectsController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public StatusProjectsController ( californiaContext context )
        {
            _context = context;
        }

        // GET: api/StatusProjects
        [HttpGet]
        public async Task<ActionResult<IEnumerable<StatusProject>>> GetStatusProjects ( [FromQuery] PaginationParams pagination )
        {
            try
            {
                var query = _context.StatusProjects.AsQueryable ( );

                // Ordenamiento dinámico
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


        // GET: api/StatusProjects/5
        [HttpGet ( "{id}" )]
        public async Task<ActionResult<StatusProject>> GetStatusProject ( int id )
        {
            var statusProject = await _context.StatusProjects.FindAsync ( id );

            if (statusProject == null)
            {
                return NotFound ( );
            }

            return statusProject;
        }

        // PUT: api/StatusProjects/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut ( "{id}" )]
        public async Task<IActionResult> PutStatusProject ( int id , StatusProject statusProject )
        {
            if (id != statusProject.ID)
            {
                return BadRequest ( );
            }

            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.Entry ( statusProject ).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync ( );
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!StatusProjectExists ( id ))
                {
                    return NotFound ( );
                }
                else
                {
                    throw;
                }
            }

            return NoContent ( );
        }

        // POST: api/StatusProjects
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<StatusProject>> PostStatusProject ( StatusProject statusProject )
        {
            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.StatusProjects.Add ( statusProject );
            await _context.SaveChangesAsync ( );

            return CreatedAtAction ( "GetStatusProject" , new { id = statusProject.ID } , statusProject );
        }

        // DELETE: api/StatusProjects/5
        [HttpDelete ( "{id}" )]
        public async Task<IActionResult> DeleteStatusProject ( int id )
        {
            var statusProject = await _context.StatusProjects.FindAsync ( id );
            if (statusProject == null)
            {
                return NotFound ( );
            }

            _context.StatusProjects.Remove ( statusProject );
            await _context.SaveChangesAsync ( );

            return NoContent ( );
        }

        private bool StatusProjectExists ( int id )
        {
            return _context.StatusProjects.Any ( e => e.ID == id );
        }
    }
}
