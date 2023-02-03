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
    public class StatusProjectsController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public StatusProjectsController(californiaContext context)
        {
            _context = context;
        }

        // GET: api/StatusProjects
        [HttpGet]
        public async Task<ActionResult<IEnumerable<StatusProject>>> GetStatusProjects()
        {
            return await _context.StatusProjects.ToListAsync();
        }

        // GET: api/StatusProjects/5
        [HttpGet("{id}")]
        public async Task<ActionResult<StatusProject>> GetStatusProject(int id)
        {
            var statusProject = await _context.StatusProjects.FindAsync(id);

            if (statusProject == null)
            {
                return NotFound();
            }

            return statusProject;
        }

        // PUT: api/StatusProjects/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutStatusProject(int id, StatusProject statusProject)
        {
            if (id != statusProject.ID)
            {
                return BadRequest();
            }

            _context.Entry(statusProject).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!StatusProjectExists(id))
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

        // POST: api/StatusProjects
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<StatusProject>> PostStatusProject(StatusProject statusProject)
        {
            _context.StatusProjects.Add(statusProject);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetStatusProject", new { id = statusProject.ID }, statusProject);
        }

        // DELETE: api/StatusProjects/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteStatusProject(int id)
        {
            var statusProject = await _context.StatusProjects.FindAsync(id);
            if (statusProject == null)
            {
                return NotFound();
            }

            _context.StatusProjects.Remove(statusProject);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool StatusProjectExists(int id)
        {
            return _context.StatusProjects.Any(e => e.ID == id);
        }
    }
}
