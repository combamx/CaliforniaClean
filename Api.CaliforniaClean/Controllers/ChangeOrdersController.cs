using Api.CaliforniaClean.RequestModel;
using Api.CaliforniaEF;
using Api.DbContext.CaliforniaEF;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api.CaliforniaClean.Controllers
{
    [Route ( "api/[controller]" )]
    [ApiController]
    public class ChangeOrdersController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;

        public ChangeOrdersController ( californiaContext context )
        {
            _context = context;
        }

        // GET: api/ChangeOrders
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ChangeOrderRequest>>> GetChangeOrders ( )
        {
            try
            {
                var buildings = await _context.ChangeOrders.ToListAsync ( );
                var config = new MapperConfiguration ( cfg => cfg.CreateMap<ChangeOrder , ChangeOrderRequest> ( ) );

                var mapper = new Mapper ( config );
                List<ChangeOrderRequest> dto = mapper.Map<List<ChangeOrderRequest>> ( buildings );

                return dto;

            }
            catch (Exception ex)
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

        }

        // GET: api/ChangeOrders/5
        [HttpGet ( "{id}" )]
        public async Task<ActionResult<ChangeOrderRequest>> GetChangeOrder ( int id )
        {
            try
            {
                var changeOrder = await _context.ChangeOrders.FindAsync ( id );

                if (changeOrder == null)
                {
                    return NotFound ( );
                }

                var config = new MapperConfiguration ( cfg => cfg.CreateMap<ChangeOrder , ChangeOrderRequest> ( ) );

                var mapper = new Mapper ( config );
                ChangeOrderRequest dto = mapper.Map<ChangeOrderRequest> ( changeOrder );

                return dto;
            }
            catch (Exception ex)
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );
        }

        // PUT: api/ChangeOrders/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut ( "{id}" )]
        public async Task<IActionResult> PutChangeOrder ( int id , ChangeOrder changeOrder )
        {
            try
            {
                if (id != changeOrder.ID)
                {
                    return BadRequest ( );
                }

                if (!ModelState.IsValid)
                    return BadRequest ( ModelState );

                _context.Entry ( changeOrder ).State = EntityState.Modified;

                try
                {
                    await _context.SaveChangesAsync ( );
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ChangeOrderExists ( id ))
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
            catch (Exception ex)
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

        }

        // POST: api/ChangeOrders
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ChangeOrderRequest>> PostChangeOrder ( ChangeOrder changeOrder )
        {
            try
            {
                if (!ModelState.IsValid)
                    return BadRequest ( ModelState );

                _context.ChangeOrders.Add ( changeOrder );
                await _context.SaveChangesAsync ( );

                return CreatedAtAction ( "GetChangeOrder" , new { id = changeOrder.ID } , changeOrder );
            }
            catch (Exception ex)
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

        }

        // DELETE: api/ChangeOrders/5
        [HttpDelete ( "{id}" )]
        public async Task<IActionResult> DeleteChangeOrder ( int id )
        {
            try
            {
                var changeOrder = await _context.ChangeOrders.FindAsync ( id );
                if (changeOrder == null)
                {
                    return NotFound ( );
                }

                _context.ChangeOrders.Remove ( changeOrder );
                await _context.SaveChangesAsync ( );

                return NoContent ( );
            }
            catch (Exception ex)
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

        }

        private bool ChangeOrderExists ( int id )
        {
            return _context.ChangeOrders.Any ( e => e.ID == id );
        }
    }
}
