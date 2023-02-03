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
    public class TypesOrderWorksController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public TypesOrderWorksController(californiaContext context)
        {
            _context = context;
        }

        // GET: api/TypesOrderWorks
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TypesOrderWork>>> GetTypesOrderWorks()
        {
            return await _context.TypesOrderWorks.ToListAsync();
        }

        // GET: api/TypesOrderWorks/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TypesOrderWork>> GetTypesOrderWork(int id)
        {
            var typesOrderWork = await _context.TypesOrderWorks.FindAsync(id);

            if (typesOrderWork == null)
            {
                return NotFound();
            }

            return typesOrderWork;
        }

        // PUT: api/TypesOrderWorks/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTypesOrderWork(int id, TypesOrderWork typesOrderWork)
        {
            if (id != typesOrderWork.ID)
            {
                return BadRequest();
            }

            _context.Entry(typesOrderWork).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TypesOrderWorkExists(id))
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

        // POST: api/TypesOrderWorks
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TypesOrderWork>> PostTypesOrderWork(TypesOrderWork typesOrderWork)
        {
            _context.TypesOrderWorks.Add(typesOrderWork);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTypesOrderWork", new { id = typesOrderWork.ID }, typesOrderWork);
        }

        // DELETE: api/TypesOrderWorks/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTypesOrderWork(int id)
        {
            var typesOrderWork = await _context.TypesOrderWorks.FindAsync(id);
            if (typesOrderWork == null)
            {
                return NotFound();
            }

            _context.TypesOrderWorks.Remove(typesOrderWork);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TypesOrderWorkExists(int id)
        {
            return _context.TypesOrderWorks.Any(e => e.ID == id);
        }
    }
}
