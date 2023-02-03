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
    public class StatusDatesController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public StatusDatesController(californiaContext context)
        {
            _context = context;
        }

        // GET: api/StatusDates
        [HttpGet]
        public async Task<ActionResult<IEnumerable<StatusDate>>> GetStatusDates()
        {
            return await _context.StatusDates.ToListAsync();
        }

        // GET: api/StatusDates/5
        [HttpGet("{id}")]
        public async Task<ActionResult<StatusDate>> GetStatusDate(int id)
        {
            var statusDate = await _context.StatusDates.FindAsync(id);

            if (statusDate == null)
            {
                return NotFound();
            }

            return statusDate;
        }

        // PUT: api/StatusDates/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutStatusDate(int id, StatusDate statusDate)
        {
            if (id != statusDate.ID)
            {
                return BadRequest();
            }

            _context.Entry(statusDate).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!StatusDateExists(id))
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

        // POST: api/StatusDates
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<StatusDate>> PostStatusDate(StatusDate statusDate)
        {
            _context.StatusDates.Add(statusDate);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetStatusDate", new { id = statusDate.ID }, statusDate);
        }

        // DELETE: api/StatusDates/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteStatusDate(int id)
        {
            var statusDate = await _context.StatusDates.FindAsync(id);
            if (statusDate == null)
            {
                return NotFound();
            }

            _context.StatusDates.Remove(statusDate);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool StatusDateExists(int id)
        {
            return _context.StatusDates.Any(e => e.ID == id);
        }
    }
}
