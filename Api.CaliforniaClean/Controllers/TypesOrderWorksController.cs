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
    public class TypesOrderWorksController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public TypesOrderWorksController ( californiaContext context )
        {
            _context = context;
        }

        // GET: api/TypesOrderWorks
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TypesOrderWork>>> GetTypesOrderWorks ( [FromQuery] PaginationParams pagination )
        {
            try
            {
                var query = _context.TypesOrderWorks.AsQueryable ( );

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


        // GET: api/TypesOrderWorks/5
        [HttpGet ( "{id}" )]
        public async Task<ActionResult<TypesOrderWork>> GetTypesOrderWork ( int id )
        {
            var typesOrderWork = await _context.TypesOrderWorks.FindAsync ( id );

            if (typesOrderWork == null)
            {
                return NotFound ( );
            }

            return typesOrderWork;
        }

        // PUT: api/TypesOrderWorks/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut ( "{id}" )]
        public async Task<IActionResult> PutTypesOrderWork ( int id , TypesOrderWork typesOrderWork )
        {
            if (id != typesOrderWork.ID)
            {
                return BadRequest ( );
            }

            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.Entry ( typesOrderWork ).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync ( );
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TypesOrderWorkExists ( id ))
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

        // POST: api/TypesOrderWorks
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TypesOrderWork>> PostTypesOrderWork ( TypesOrderWork typesOrderWork )
        {
            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.TypesOrderWorks.Add ( typesOrderWork );
            await _context.SaveChangesAsync ( );

            return CreatedAtAction ( "GetTypesOrderWork" , new { id = typesOrderWork.ID } , typesOrderWork );
        }

        // DELETE: api/TypesOrderWorks/5
        [HttpDelete ( "{id}" )]
        public async Task<IActionResult> DeleteTypesOrderWork ( int id )
        {
            var typesOrderWork = await _context.TypesOrderWorks.FindAsync ( id );
            if (typesOrderWork == null)
            {
                return NotFound ( );
            }

            _context.TypesOrderWorks.Remove ( typesOrderWork );
            await _context.SaveChangesAsync ( );

            return NoContent ( );
        }

        private bool TypesOrderWorkExists ( int id )
        {
            return _context.TypesOrderWorks.Any ( e => e.ID == id );
        }
    }
}
