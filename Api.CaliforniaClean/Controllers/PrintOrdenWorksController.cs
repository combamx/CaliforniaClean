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
    public class PrintOrdenWorksController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public PrintOrdenWorksController ( californiaContext context )
        {
            _context = context;
        }

        // GET: api/PrintOrdenWorks
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PrintOrdenWork>>> GetPrintOrdenWorks ( [FromQuery] PaginationParams pagination )
        {
            try
            {
                var query = _context.PrintOrdenWorks.AsQueryable ( );

                // Orden dinámico
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


        // GET: api/PrintOrdenWorks/5
        [HttpGet ( "{id}" )]
        public async Task<ActionResult<PrintOrdenWork>> GetPrintOrdenWork ( int id )
        {
            var printOrdenWork = await _context.PrintOrdenWorks.FindAsync ( id );

            if (printOrdenWork == null)
            {
                return NotFound ( );
            }

            return printOrdenWork;
        }

        // PUT: api/PrintOrdenWorks/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut ( "{id}" )]
        public async Task<IActionResult> PutPrintOrdenWork ( int id , PrintOrdenWork printOrdenWork )
        {
            if (id != printOrdenWork.ID)
            {
                return BadRequest ( );
            }

            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.Entry ( printOrdenWork ).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync ( );
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PrintOrdenWorkExists ( id ))
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

        // POST: api/PrintOrdenWorks
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<PrintOrdenWork>> PostPrintOrdenWork ( PrintOrdenWork printOrdenWork )
        {
            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.PrintOrdenWorks.Add ( printOrdenWork );
            await _context.SaveChangesAsync ( );

            return CreatedAtAction ( "GetPrintOrdenWork" , new { id = printOrdenWork.ID } , printOrdenWork );
        }

        // DELETE: api/PrintOrdenWorks/5
        [HttpDelete ( "{id}" )]
        public async Task<IActionResult> DeletePrintOrdenWork ( int id )
        {
            var printOrdenWork = await _context.PrintOrdenWorks.FindAsync ( id );
            if (printOrdenWork == null)
            {
                return NotFound ( );
            }

            _context.PrintOrdenWorks.Remove ( printOrdenWork );
            await _context.SaveChangesAsync ( );

            return NoContent ( );
        }

        private bool PrintOrdenWorkExists ( int id )
        {
            return _context.PrintOrdenWorks.Any ( e => e.ID == id );
        }
    }
}
