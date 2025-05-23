﻿using Api.CaliforniaClean.Helpers;
using Api.CaliforniaClean.RequestModel;
using Api.CaliforniaEF;
using Api.DbContext.CaliforniaEF;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api.CaliforniaClean.Controllers
{
    [Authorize]
    [Route ( "api/[controller]" )]
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
        public async Task<ActionResult<IEnumerable<BuildingRequest>>> GetBuildings ( [FromQuery] PaginationParams pagination )
        {
            try
            {
                var query = _context.Buildings.AsQueryable ( );

                // Ordenamiento dinámico
                query = query.ApplySorting ( pagination.OrderBy , pagination.Desc );

                // Encabezado con el total
                var total = await query.CountAsync ( );
                Response.Headers.Add ( "X-Total-Count" , total.ToString ( ) );

                // Paginación
                var paged = await query.ApplyPagination ( pagination ).ToListAsync ( );

                // Mapeo con AutoMapper
                var config = new MapperConfiguration ( cfg => cfg.CreateMap<Building , BuildingRequest> ( ) );
                var mapper = new Mapper ( config );
                var dto = mapper.Map<List<BuildingRequest>> ( paged );

                return dto;
            }
            catch (Exception ex)
            {
                return BadRequest ( ex.Message );
            }
        }


        // GET: api/Buildings/5
        [HttpGet ( "{id}" )]
        public async Task<ActionResult<BuildingRequest>> GetBuilding ( int id )
        {
            try
            {
                var building = await _context.Buildings.FindAsync ( id );

                if (building == null)
                {
                    return NotFound ( );
                }

                var config = new MapperConfiguration ( cfg => cfg.CreateMap<Building , BuildingRequest> ( ) );

                var mapper = new Mapper ( config );
                BuildingRequest dto = mapper.Map<BuildingRequest> ( building );

                return dto;
            }
            catch (Exception ex)
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

        }

        // PUT: api/Buildings/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut ( "{id}" )]
        public async Task<IActionResult> PutBuilding ( int id , Building building )
        {
            try
            {
                if (id != building.ID)
                {
                    return BadRequest ( );
                }

                if (!ModelState.IsValid)
                    return BadRequest ( ModelState );

                _context.Entry ( building ).State = EntityState.Modified;

                try
                {
                    await _context.SaveChangesAsync ( );
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BuildingExists ( id ))
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

        // POST: api/Buildings
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<BuildingRequest>> PostBuilding ( Building building )
        {
            try
            {
                if (!ModelState.IsValid)
                    return BadRequest ( ModelState );

                _context.Buildings.Add ( building );
                await _context.SaveChangesAsync ( );

                return CreatedAtAction ( "GetBuilding" , new { id = building.ID } , building );
            }
            catch (Exception ex)
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );
        }

        // DELETE: api/Buildings/5
        [HttpDelete ( "{id}" )]
        public async Task<IActionResult> DeleteBuilding ( int id )
        {
            try
            {
                var building = await _context.Buildings.FindAsync ( id );
                if (building == null)
                {
                    return NotFound ( );
                }

                _context.Buildings.Remove ( building );
                await _context.SaveChangesAsync ( );

                return NoContent ( );
            }
            catch (Exception ex)
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

        }

        private bool BuildingExists ( int id )
        {
            return _context.Buildings.Any ( e => e.ID == id );
        }
    }
}
