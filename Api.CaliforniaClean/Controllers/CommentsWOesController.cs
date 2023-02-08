using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Api.CaliforniaEF;
using Api.DbContext.CaliforniaEF;
using Api.CaliforniaClean.RequestModel;
using AutoMapper;

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
        public async Task<ActionResult<IEnumerable<CommentsWORequest>>> GetCommentsWOs()
        {
            try
            {
                var buildings = await _context.CommentsWOs.ToListAsync ( );
                var config = new MapperConfiguration ( cfg => cfg.CreateMap<CommentsWO , CommentsWORequest> ( ) );

                var mapper = new Mapper ( config );
                List<CommentsWORequest> dto = mapper.Map<List<CommentsWORequest>> ( buildings );

                return dto;
            }
            catch(Exception ex)
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

        }

        // GET: api/CommentsWOes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CommentsWORequest>> GetCommentsWO(int id)
        {
            try
            {
                var commentsWO = await _context.CommentsWOs.FindAsync ( id );

                if ( commentsWO == null )
                {
                    return NotFound ( );
                }

                var config = new MapperConfiguration ( cfg => cfg.CreateMap<CommentsWO , CommentsWORequest> ( ) );

                var mapper = new Mapper ( config );
                CommentsWORequest dto = mapper.Map<CommentsWORequest> ( commentsWO );

                return dto;

            }
            catch ( Exception ex )
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

        }

        // PUT: api/CommentsWOes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCommentsWO(int id, CommentsWO commentsWO)
        {
            try
            {
                if ( id != commentsWO.ID )
                {
                    return BadRequest ( );
                }

                _context.Entry ( commentsWO ).State = EntityState.Modified;

                try
                {
                    await _context.SaveChangesAsync ( );
                }
                catch ( DbUpdateConcurrencyException )
                {
                    if ( !CommentsWOExists ( id ) )
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
            catch ( Exception ex )
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

            
        }

        // POST: api/CommentsWOes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<CommentsWORequest>> PostCommentsWO(CommentsWO commentsWO)
        {
            try
            {
                _context.CommentsWOs.Add ( commentsWO );
                await _context.SaveChangesAsync ( );

                return CreatedAtAction ( "GetCommentsWO" , new { id = commentsWO.ID } , commentsWO );
            }
            catch ( Exception ex )
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );
            
        }

        // DELETE: api/CommentsWOes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCommentsWO(int id)
        {
            try
            {
                var commentsWO = await _context.CommentsWOs.FindAsync ( id );
                if ( commentsWO == null )
                {
                    return NotFound ( );
                }

                _context.CommentsWOs.Remove ( commentsWO );
                await _context.SaveChangesAsync ( );

                return NoContent ( );
            }
            catch ( Exception ex )
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );
            
        }

        private bool CommentsWOExists(int id)
        {
            return _context.CommentsWOs.Any(e => e.ID == id);
        }
    }
}
