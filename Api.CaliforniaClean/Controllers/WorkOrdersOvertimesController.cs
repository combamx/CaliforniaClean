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
    public class WorkOrdersOvertimesController : ControllerBase
    {
        private readonly californiaContext _context;

        public WorkOrdersOvertimesController(californiaContext context)
        {
            _context = context;
        }

        // GET: api/WorkOrdersOvertimes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<WorkOrdersOvertime>>> GetWorkOrdersOvertimes()
        {
            return await _context.WorkOrdersOvertimes.ToListAsync();
        }

        // GET: api/WorkOrdersOvertimes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<WorkOrdersOvertime>> GetWorkOrdersOvertime(int id)
        {
            var workOrdersOvertime = await _context.WorkOrdersOvertimes.FindAsync(id);

            if (workOrdersOvertime == null)
            {
                return NotFound();
            }

            return workOrdersOvertime;
        }

        // PUT: api/WorkOrdersOvertimes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutWorkOrdersOvertime(int id, WorkOrdersOvertime workOrdersOvertime)
        {
            if (id != workOrdersOvertime.ID)
            {
                return BadRequest();
            }

            _context.Entry(workOrdersOvertime).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!WorkOrdersOvertimeExists(id))
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

        // POST: api/WorkOrdersOvertimes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<WorkOrdersOvertime>> PostWorkOrdersOvertime(WorkOrdersOvertime workOrdersOvertime)
        {
            _context.WorkOrdersOvertimes.Add(workOrdersOvertime);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetWorkOrdersOvertime", new { id = workOrdersOvertime.ID }, workOrdersOvertime);
        }

        // DELETE: api/WorkOrdersOvertimes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteWorkOrdersOvertime(int id)
        {
            var workOrdersOvertime = await _context.WorkOrdersOvertimes.FindAsync(id);
            if (workOrdersOvertime == null)
            {
                return NotFound();
            }

            _context.WorkOrdersOvertimes.Remove(workOrdersOvertime);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool WorkOrdersOvertimeExists(int id)
        {
            return _context.WorkOrdersOvertimes.Any(e => e.ID == id);
        }
    }
}
