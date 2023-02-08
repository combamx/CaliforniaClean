using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Api.CaliforniaEF;
using Api.DbContext.CaliforniaEF;
using AutoMapper;
using Api.CaliforniaClean.RequestModel;

namespace Api.CaliforniaClean.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BuildingsController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;

        public BuildingsController ( californiaContext context )
        {
            _context = context;
        }

        // GET: api/Buildings
        [HttpGet]
        public async Task<ActionResult<IEnumerable<BuildingRequest>>> GetBuildings()
        {
            try
            {
                var buildings = await _context.Buildings.ToListAsync();
                var config = new MapperConfiguration ( cfg => cfg.CreateMap<Building , BuildingRequest> ( ) );

                var mapper = new Mapper ( config );
                List<BuildingRequest> dto = mapper.Map<List<BuildingRequest>> ( buildings );

                return dto;
            }
            catch (Exception ex)
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );
        }

        // GET: api/Buildings/5
        [HttpGet("{id}")]
        public async Task<ActionResult<BuildingRequest>> GetBuilding(int id)
        {
            try
            {
                var building = await _context.Buildings.FindAsync ( id );

                if ( building == null )
                {
                    return NotFound ( );
                }

                var config = new MapperConfiguration ( cfg => cfg.CreateMap<Building , BuildingRequest> ( ) );

                var mapper = new Mapper ( config );
                BuildingRequest dto = mapper.Map<BuildingRequest> ( building );

                return dto;
            }
            catch ( Exception ex )
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

        }

        // PUT: api/Buildings/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBuilding(int id, Building building)
        {
            try
            {
                if ( id != building.ID )
                {
                    return BadRequest ( );
                }

                _context.Entry ( building ).State = EntityState.Modified;

                try
                {
                    await _context.SaveChangesAsync ( );
                }
                catch ( DbUpdateConcurrencyException )
                {
                    if ( !BuildingExists ( id ) )
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
            catch(Exception ex )
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

        }

        // POST: api/Buildings
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<BuildingRequest>> PostBuilding(Building building)
        {
            try
            {
                _context.Buildings.Add ( building );
                await _context.SaveChangesAsync ( );

                return CreatedAtAction ( "GetBuilding" , new { id = building.ID } , building );
            }
            catch(Exception ex )
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );
        }

        // DELETE: api/Buildings/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBuilding(int id)
        {
            try
            {
                var building = await _context.Buildings.FindAsync ( id );
                if ( building == null )
                {
                    return NotFound ( );
                }

                _context.Buildings.Remove ( building );
                await _context.SaveChangesAsync ( );

                return NoContent ( );
            }
            catch ( Exception ex )
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );
            
        }

        private bool BuildingExists(int id)
        {
            return _context.Buildings.Any(e => e.ID == id);
        }
    }
}
