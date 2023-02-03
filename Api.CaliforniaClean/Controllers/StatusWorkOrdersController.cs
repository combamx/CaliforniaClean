using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Api.CaliforniaEF;
using Api.DbContext.CaliforniaEF;

namespace Api.CaliforniaClean.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StatusWorkOrdersController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public StatusWorkOrdersController(californiaContext context)
        {
            _context = context;
        }

        // GET: api/StatusWorkOrders
        [HttpGet]
        public async Task<ActionResult<IEnumerable<StatusWorkOrder>>> GetStatusWorkOrders()
        {
            return await _context.StatusWorkOrders.ToListAsync();
        }

        // GET: api/StatusWorkOrders/5
        [HttpGet("{id}")]
        public async Task<ActionResult<StatusWorkOrder>> GetStatusWorkOrder(int id)
        {
            var statusWorkOrder = await _context.StatusWorkOrders.FindAsync(id);

            if (statusWorkOrder == null)
            {
                return NotFound();
            }

            return statusWorkOrder;
        }

        // PUT: api/StatusWorkOrders/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutStatusWorkOrder(int id, StatusWorkOrder statusWorkOrder)
        {
            if (id != statusWorkOrder.ID)
            {
                return BadRequest();
            }

            _context.Entry(statusWorkOrder).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!StatusWorkOrderExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/StatusWorkOrders
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<StatusWorkOrder>> PostStatusWorkOrder(StatusWorkOrder statusWorkOrder)
        {
            _context.StatusWorkOrders.Add(statusWorkOrder);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetStatusWorkOrder", new { id = statusWorkOrder.ID }, statusWorkOrder);
        }

        // DELETE: api/StatusWorkOrders/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteStatusWorkOrder(int id)
        {
            var statusWorkOrder = await _context.StatusWorkOrders.FindAsync(id);
            if (statusWorkOrder == null)
            {
                return NotFound();
            }

            _context.StatusWorkOrders.Remove(statusWorkOrder);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool StatusWorkOrderExists(int id)
        {
            return _context.StatusWorkOrders.Any(e => e.ID == id);
        }
    }
}
