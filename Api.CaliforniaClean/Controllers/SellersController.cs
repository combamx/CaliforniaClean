﻿using Api.CaliforniaEF;
using Api.DbContext.CaliforniaEF;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api.CaliforniaClean.Controllers
{
    [Route ( "api/[controller]" )]
    [ApiController]
    public class SellersController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public SellersController ( californiaContext context )
        {
            _context = context;
        }

        // GET: api/Sellers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Seller>>> GetSellers ( )
        {
            return await _context.Sellers.ToListAsync ( );
        }

        // GET: api/Sellers/5
        [HttpGet ( "{id}" )]
        public async Task<ActionResult<Seller>> GetSeller ( int id )
        {
            var seller = await _context.Sellers.FindAsync ( id );

            if (seller == null)
            {
                return NotFound ( );
            }

            return seller;
        }

        // PUT: api/Sellers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut ( "{id}" )]
        public async Task<IActionResult> PutSeller ( int id , Seller seller )
        {
            if (id != seller.ID)
            {
                return BadRequest ( );
            }

            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.Entry ( seller ).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync ( );
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SellerExists ( id ))
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

        // POST: api/Sellers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Seller>> PostSeller ( Seller seller )
        {
            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.Sellers.Add ( seller );
            await _context.SaveChangesAsync ( );

            return CreatedAtAction ( "GetSeller" , new { id = seller.ID } , seller );
        }

        // DELETE: api/Sellers/5
        [HttpDelete ( "{id}" )]
        public async Task<IActionResult> DeleteSeller ( int id )
        {
            var seller = await _context.Sellers.FindAsync ( id );
            if (seller == null)
            {
                return NotFound ( );
            }

            _context.Sellers.Remove ( seller );
            await _context.SaveChangesAsync ( );

            return NoContent ( );
        }

        private bool SellerExists ( int id )
        {
            return _context.Sellers.Any ( e => e.ID == id );
        }
    }
}
