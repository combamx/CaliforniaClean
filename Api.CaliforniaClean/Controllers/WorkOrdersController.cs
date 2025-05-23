using Api.CaliforniaClean.Helpers;
using Api.CaliforniaEF;
using Api.DbContext.CaliforniaEF;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api.CaliforniaClean.Controllers
{
    [Route ( "api/[controller]" )]
    [ApiController]
    public class WorkOrdersController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public WorkOrdersController ( californiaContext context )
        {
            _context = context;
        }

        // GET: api/WorkOrders
        [HttpGet]
        public async Task<ActionResult<IEnumerable<WorkOrder>>> GetWorkOrders ( [FromQuery] PaginationParams pagination )
        {
            try
            {
                var query = _context.WorkOrders.AsQueryable ( );

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


        // GET: api/WorkOrders/5
        [HttpGet ( "{id}" )]
        public async Task<ActionResult<WorkOrder>> GetWorkOrder ( int id )
        {
            var workOrder = await _context.WorkOrders.FindAsync ( id );

            if (workOrder == null)
            {
                return NotFound ( );
            }

            return workOrder;
        }

        // PUT: api/WorkOrders/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut ( "{id}" )]
        public async Task<IActionResult> PutWorkOrder ( int id , WorkOrder workOrder )
        {
            if (id != workOrder.ID)
            {
                return BadRequest ( );
            }

            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.Entry ( workOrder ).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync ( );
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!WorkOrderExists ( id ))
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

        // POST: api/WorkOrders
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<WorkOrder>> PostWorkOrder ( WorkOrder workOrder )
        {
            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.WorkOrders.Add ( workOrder );
            await _context.SaveChangesAsync ( );

            return CreatedAtAction ( "GetWorkOrder" , new { id = workOrder.ID } , workOrder );
        }

        // DELETE: api/WorkOrders/5
        [HttpDelete ( "{id}" )]
        public async Task<IActionResult> DeleteWorkOrder ( int id )
        {
            var workOrder = await _context.WorkOrders.FindAsync ( id );
            if (workOrder == null)
            {
                return NotFound ( );
            }

            _context.WorkOrders.Remove ( workOrder );
            await _context.SaveChangesAsync ( );

            return NoContent ( );
        }

        private bool WorkOrderExists ( int id )
        {
            return _context.WorkOrders.Any ( e => e.ID == id );
        }
    }
}
