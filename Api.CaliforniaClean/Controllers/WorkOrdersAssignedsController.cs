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
    public class WorkOrdersAssignedsController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public WorkOrdersAssignedsController(californiaContext context)
        {
            _context = context;
        }

        // GET: api/WorkOrdersAssigneds
        [HttpGet]
        public async Task<ActionResult<IEnumerable<WorkOrdersAssigned>>> GetWorkOrdersAssigneds()
        {
            return await _context.WorkOrdersAssigneds.ToListAsync();
        }

        // GET: api/WorkOrdersAssigneds/5
        [HttpGet("{id}")]
        public async Task<ActionResult<WorkOrdersAssigned>> GetWorkOrdersAssigned(int id)
        {
            var workOrdersAssigned = await _context.WorkOrdersAssigneds.FindAsync(id);

            if (workOrdersAssigned == null)
            {
                return NotFound();
            }

            return workOrdersAssigned;
        }

        // PUT: api/WorkOrdersAssigneds/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutWorkOrdersAssigned(int id, WorkOrdersAssigned workOrdersAssigned)
        {
            if (id != workOrdersAssigned.ID)
            {
                return BadRequest();
            }

            _context.Entry(workOrdersAssigned).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!WorkOrdersAssignedExists(id))
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

        // POST: api/WorkOrdersAssigneds
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<WorkOrdersAssigned>> PostWorkOrdersAssigned(WorkOrdersAssigned workOrdersAssigned)
        {
            _context.WorkOrdersAssigneds.Add(workOrdersAssigned);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetWorkOrdersAssigned", new { id = workOrdersAssigned.ID }, workOrdersAssigned);
        }

        // DELETE: api/WorkOrdersAssigneds/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteWorkOrdersAssigned(int id)
        {
            var workOrdersAssigned = await _context.WorkOrdersAssigneds.FindAsync(id);
            if (workOrdersAssigned == null)
            {
                return NotFound();
            }

            _context.WorkOrdersAssigneds.Remove(workOrdersAssigned);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool WorkOrdersAssignedExists(int id)
        {
            return _context.WorkOrdersAssigneds.Any(e => e.ID == id);
        }
    }
}
