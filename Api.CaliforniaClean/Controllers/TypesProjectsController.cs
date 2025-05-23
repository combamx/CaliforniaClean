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
    public class TypesProjectsController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public TypesProjectsController ( californiaContext context )
        {
            _context = context;
        }

        // GET: api/TypesProjects
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TypesProject>>> GetTypesProjects ( [FromQuery] PaginationParams pagination )
        {
            try
            {
                var query = _context.TypesProjects.AsQueryable ( );

                // Aplicar ordenamiento dinámico
                query = query.ApplySorting ( pagination.OrderBy , pagination.Desc );

                // Total de registros
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


        // GET: api/TypesProjects/5
        [HttpGet ( "{id}" )]
        public async Task<ActionResult<TypesProject>> GetTypesProject ( int id )
        {
            var typesProject = await _context.TypesProjects.FindAsync ( id );

            if (typesProject == null)
            {
                return NotFound ( );
            }

            return typesProject;
        }

        // PUT: api/TypesProjects/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut ( "{id}" )]
        public async Task<IActionResult> PutTypesProject ( int id , TypesProject typesProject )
        {
            if (id != typesProject.ID)
            {
                return BadRequest ( );
            }

            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.Entry ( typesProject ).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync ( );
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TypesProjectExists ( id ))
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

        // POST: api/TypesProjects
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TypesProject>> PostTypesProject ( TypesProject typesProject )
        {
            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.TypesProjects.Add ( typesProject );
            await _context.SaveChangesAsync ( );

            return CreatedAtAction ( "GetTypesProject" , new { id = typesProject.ID } , typesProject );
        }

        // DELETE: api/TypesProjects/5
        [HttpDelete ( "{id}" )]
        public async Task<IActionResult> DeleteTypesProject ( int id )
        {
            var typesProject = await _context.TypesProjects.FindAsync ( id );
            if (typesProject == null)
            {
                return NotFound ( );
            }

            _context.TypesProjects.Remove ( typesProject );
            await _context.SaveChangesAsync ( );

            return NoContent ( );
        }

        private bool TypesProjectExists ( int id )
        {
            return _context.TypesProjects.Any ( e => e.ID == id );
        }
    }
}
