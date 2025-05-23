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
    public class WorkersController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public WorkersController ( californiaContext context )
        {
            _context = context;
        }

        // GET: api/Workers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Worker>>> GetWorkers ( [FromQuery] PaginationParams pagination )
        {
            try
            {
                var query = _context.Workers.AsQueryable ( );

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


        // GET: api/Workers/5
        [HttpGet ( "{id}" )]
        public async Task<ActionResult<Worker>> GetWorker ( int id )
        {
            var worker = await _context.Workers.FindAsync ( id );

            if (worker == null)
            {
                return NotFound ( );
            }

            return worker;
        }

        // PUT: api/Workers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut ( "{id}" )]
        public async Task<IActionResult> PutWorker ( int id , Worker worker )
        {
            if (id != worker.ID)
            {
                return BadRequest ( );
            }

            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.Entry ( worker ).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync ( );
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!WorkerExists ( id ))
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

        // POST: api/Workers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Worker>> PostWorker ( Worker worker )
        {
            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.Workers.Add ( worker );
            await _context.SaveChangesAsync ( );

            return CreatedAtAction ( "GetWorker" , new { id = worker.ID } , worker );
        }

        // DELETE: api/Workers/5
        [HttpDelete ( "{id}" )]
        public async Task<IActionResult> DeleteWorker ( int id )
        {
            var worker = await _context.Workers.FindAsync ( id );
            if (worker == null)
            {
                return NotFound ( );
            }

            _context.Workers.Remove ( worker );
            await _context.SaveChangesAsync ( );

            return NoContent ( );
        }

        private bool WorkerExists ( int id )
        {
            return _context.Workers.Any ( e => e.ID == id );
        }
    }
}
