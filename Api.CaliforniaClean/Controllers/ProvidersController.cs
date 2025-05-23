﻿using Api.CaliforniaClean.Helpers;
using Api.CaliforniaEF;
using Api.DbContext.CaliforniaEF;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api.CaliforniaClean.Controllers
{
    [Authorize]
    [Route ( "api/[controller]" )]
    [ApiController]
    public class ProvidersController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        public ProvidersController ( californiaContext context )
        {
            _context = context;
        }

        // GET: api/Providers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Provider>>> GetProviders ( [FromQuery] PaginationParams pagination )
        {
            try
            {
                var query = _context.Providers.AsQueryable ( );

                // Ordenamiento dinámico
                query = query.ApplySorting ( pagination.OrderBy , pagination.Desc );

                // Total para encabezado
                var total = await query.CountAsync ( );
                Response.Headers.Add ( "X-Total-Count" , total.ToString ( ) );

                // Aplicar paginación
                var paged = await query.ApplyPagination ( pagination ).ToListAsync ( );

                return Ok ( paged );
            }
            catch (Exception ex)
            {
                return BadRequest ( ex.Message );
            }
        }


        // GET: api/Providers/5
        [HttpGet ( "{id}" )]
        public async Task<ActionResult<Provider>> GetProvider ( int id )
        {
            var provider = await _context.Providers.FindAsync ( id );

            if (provider == null)
            {
                return NotFound ( );
            }

            return provider;
        }

        // PUT: api/Providers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut ( "{id}" )]
        public async Task<IActionResult> PutProvider ( int id , Provider provider )
        {
            if (id != provider.ID)
            {
                return BadRequest ( );
            }

            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.Entry ( provider ).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync ( );
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProviderExists ( id ))
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

        // POST: api/Providers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Provider>> PostProvider ( Provider provider )
        {
            if (!ModelState.IsValid)
                return BadRequest ( ModelState );

            _context.Providers.Add ( provider );
            await _context.SaveChangesAsync ( );

            return CreatedAtAction ( "GetProvider" , new { id = provider.ID } , provider );
        }

        // DELETE: api/Providers/5
        [HttpDelete ( "{id}" )]
        public async Task<IActionResult> DeleteProvider ( int id )
        {
            var provider = await _context.Providers.FindAsync ( id );
            if (provider == null)
            {
                return NotFound ( );
            }

            _context.Providers.Remove ( provider );
            await _context.SaveChangesAsync ( );

            return NoContent ( );
        }

        private bool ProviderExists ( int id )
        {
            return _context.Providers.Any ( e => e.ID == id );
        }
    }
}
