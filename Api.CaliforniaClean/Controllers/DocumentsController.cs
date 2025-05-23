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
    public class DocumentsController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public DocumentsController ( californiaContext context )
        {
            _context = context;
        }

        // GET: api/Documents
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Document>>> GetDocuments ( [FromQuery] PaginationParams pagination )
        {
            try
            {
                var query = _context.Documents.AsQueryable ( );

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


        // GET: api/Documents/5
        [HttpGet ( "{id}" )]
        public async Task<ActionResult<Document>> GetDocument ( int id )
        {
            var document = await _context.Documents.FindAsync ( id );

            if (document == null)
            {
                return NotFound ( );
            }

            return document;
        }

        // PUT: api/Documents/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut ( "{id}" )]
        public async Task<IActionResult> PutDocument ( int id , Document document )
        {
            if (id != document.ID)
            {
                return BadRequest ( );
            }

            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.Entry ( document ).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync ( );
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DocumentExists ( id ))
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

        // POST: api/Documents
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Document>> PostDocument ( Document document )
        {
            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.Documents.Add ( document );
            await _context.SaveChangesAsync ( );

            return CreatedAtAction ( "GetDocument" , new { id = document.ID } , document );
        }

        // DELETE: api/Documents/5
        [HttpDelete ( "{id}" )]
        public async Task<IActionResult> DeleteDocument ( int id )
        {
            var document = await _context.Documents.FindAsync ( id );
            if (document == null)
            {
                return NotFound ( );
            }

            _context.Documents.Remove ( document );
            await _context.SaveChangesAsync ( );

            return NoContent ( );
        }

        private bool DocumentExists ( int id )
        {
            return _context.Documents.Any ( e => e.ID == id );
        }
    }
}
