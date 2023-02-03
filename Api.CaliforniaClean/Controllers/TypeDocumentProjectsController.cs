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
    public class TypeDocumentProjectsController : ControllerBase
    {
        private readonly californiaContext _context;

        public TypeDocumentProjectsController(californiaContext context)
        {
            _context = context;
        }

        // GET: api/TypeDocumentProjects
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TypeDocumentProject>>> GetTypeDocumentProjects()
        {
            return await _context.TypeDocumentProjects.ToListAsync();
        }

        // GET: api/TypeDocumentProjects/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TypeDocumentProject>> GetTypeDocumentProject(int id)
        {
            var typeDocumentProject = await _context.TypeDocumentProjects.FindAsync(id);

            if (typeDocumentProject == null)
            {
                return NotFound();
            }

            return typeDocumentProject;
        }

        // PUT: api/TypeDocumentProjects/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTypeDocumentProject(int id, TypeDocumentProject typeDocumentProject)
        {
            if (id != typeDocumentProject.ID)
            {
                return BadRequest();
            }

            _context.Entry(typeDocumentProject).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TypeDocumentProjectExists(id))
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

        // POST: api/TypeDocumentProjects
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TypeDocumentProject>> PostTypeDocumentProject(TypeDocumentProject typeDocumentProject)
        {
            _context.TypeDocumentProjects.Add(typeDocumentProject);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTypeDocumentProject", new { id = typeDocumentProject.ID }, typeDocumentProject);
        }

        // DELETE: api/TypeDocumentProjects/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTypeDocumentProject(int id)
        {
            var typeDocumentProject = await _context.TypeDocumentProjects.FindAsync(id);
            if (typeDocumentProject == null)
            {
                return NotFound();
            }

            _context.TypeDocumentProjects.Remove(typeDocumentProject);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TypeDocumentProjectExists(int id)
        {
            return _context.TypeDocumentProjects.Any(e => e.ID == id);
        }
    }
}
