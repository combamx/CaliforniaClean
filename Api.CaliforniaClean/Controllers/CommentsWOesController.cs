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
    public class CommentsWOesController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public CommentsWOesController(californiaContext context)
        {
            _context = context;
        }

        // GET: api/CommentsWOes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CommentsWO>>> GetCommentsWOs()
        {
            return await _context.CommentsWOs.ToListAsync();
        }

        // GET: api/CommentsWOes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CommentsWO>> GetCommentsWO(int id)
        {
            var commentsWO = await _context.CommentsWOs.FindAsync(id);

            if (commentsWO == null)
            {
                return NotFound();
            }

            return commentsWO;
        }

        // PUT: api/CommentsWOes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCommentsWO(int id, CommentsWO commentsWO)
        {
            if (id != commentsWO.ID)
            {
                return BadRequest();
            }

            _context.Entry(commentsWO).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CommentsWOExists(id))
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

        // POST: api/CommentsWOes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<CommentsWO>> PostCommentsWO(CommentsWO commentsWO)
        {
            _context.CommentsWOs.Add(commentsWO);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCommentsWO", new { id = commentsWO.ID }, commentsWO);
        }

        // DELETE: api/CommentsWOes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCommentsWO(int id)
        {
            var commentsWO = await _context.CommentsWOs.FindAsync(id);
            if (commentsWO == null)
            {
                return NotFound();
            }

            _context.CommentsWOs.Remove(commentsWO);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool CommentsWOExists(int id)
        {
            return _context.CommentsWOs.Any(e => e.ID == id);
        }
    }
}
