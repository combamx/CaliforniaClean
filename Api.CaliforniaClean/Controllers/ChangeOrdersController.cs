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
    public class ChangeOrdersController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public ChangeOrdersController(californiaContext context)
        {
            _context = context;
        }

        // GET: api/ChangeOrders
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ChangeOrder>>> GetChangeOrders()
        {
            return await _context.ChangeOrders.ToListAsync();
        }

        // GET: api/ChangeOrders/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ChangeOrder>> GetChangeOrder(int id)
        {
            var changeOrder = await _context.ChangeOrders.FindAsync(id);

            if (changeOrder == null)
            {
                return NotFound();
            }

            return changeOrder;
        }

        // PUT: api/ChangeOrders/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutChangeOrder(int id, ChangeOrder changeOrder)
        {
            if (id != changeOrder.ID)
            {
                return BadRequest();
            }

            _context.Entry(changeOrder).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ChangeOrderExists(id))
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

        // POST: api/ChangeOrders
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ChangeOrder>> PostChangeOrder(ChangeOrder changeOrder)
        {
            _context.ChangeOrders.Add(changeOrder);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetChangeOrder", new { id = changeOrder.ID }, changeOrder);
        }

        // DELETE: api/ChangeOrders/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteChangeOrder(int id)
        {
            var changeOrder = await _context.ChangeOrders.FindAsync(id);
            if (changeOrder == null)
            {
                return NotFound();
            }

            _context.ChangeOrders.Remove(changeOrder);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ChangeOrderExists(int id)
        {
            return _context.ChangeOrders.Any(e => e.ID == id);
        }
    }
}
