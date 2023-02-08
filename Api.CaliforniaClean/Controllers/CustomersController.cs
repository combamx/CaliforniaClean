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
    public class CustomersController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;

        public CustomersController(californiaContext context)
        {
            _context = context;
        }

        // GET: api/Customers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CustomerRequest>>> GetCustomers()
        {
            try
            {
                var buildings = await _context.Customers.ToListAsync ( );
                var config = new MapperConfiguration ( cfg => cfg.CreateMap<Customer , CustomerRequest> ( ) );

                var mapper = new Mapper ( config );
                List<CustomerRequest> dto = mapper.Map<List<CustomerRequest>> ( buildings );

                return dto;
            }
            catch ( Exception ex )
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );
        }

        // GET: api/Customers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CustomerRequest>> GetCustomer(int id)
        {
            try
            {
                var customer = await _context.Customers.FindAsync(id);

                if (customer == null)
                {
                    return NotFound();
                }
            
                var config = new MapperConfiguration ( cfg => cfg.CreateMap<Customer , CustomerRequest> ( ) );

                var mapper = new Mapper ( config );
                CustomerRequest dto = mapper.Map<CustomerRequest> ( customer );

                return dto;
            }
            catch ( Exception ex )
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );
        }

        // PUT: api/Customers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCustomer(int id, Customer customer)
        {
            try
            {
                if ( id != customer.ID )
                {
                    return BadRequest ( );
                }

                _context.Entry ( customer ).State = EntityState.Modified;

                try
                {
                    await _context.SaveChangesAsync ( );
                }
                catch ( DbUpdateConcurrencyException )
                {
                    if ( !CustomerExists ( id ) )
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

        // POST: api/Customers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<CustomerRequest>> PostCustomer(Customer customer)
        {
            try
            {
                _context.Customers.Add ( customer );
                await _context.SaveChangesAsync ( );

                return CreatedAtAction ( "GetCustomer" , new { id = customer.ID } , customer );
            }
            catch ( Exception ex )
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );
        }

        // DELETE: api/Customers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCustomer(int id)
        {
            try
            {
                var customer = await _context.Customers.FindAsync ( id );
                if ( customer == null )
                {
                    return NotFound ( );
                }

                _context.Customers.Remove ( customer );
                await _context.SaveChangesAsync ( );

                return NoContent ( );
            }
            catch ( Exception ex )
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );
            
        }

        private bool CustomerExists(int id)
        {
            return _context.Customers.Any(e => e.ID == id);
        }
    }
}
