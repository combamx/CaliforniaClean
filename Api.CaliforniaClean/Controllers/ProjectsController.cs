using Api.CaliforniaClean.Helpers;
using Api.CaliforniaClean.RequestModel;
using Api.CaliforniaClean.RequestModel.Views;
using Api.CaliforniaEF;
using Api.DbContext.CaliforniaEF;
using AutoMapper;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data.SqlClient;

namespace Api.CaliforniaClean.Controllers
{
    [Route ( "api/[controller]" )]
    [ApiController]
    public class ProjectsController : ControllerBase
    {
        private readonly californiaContext _context;
        private Exception? exception = null;
        private string? ConnectionString = "";

        public ProjectsController ( californiaContext context )
        {
            _context = context;
            ConnectionString = _context.Database.GetConnectionString ( );
        }

        // GET: api/Projects
        [HttpGet ( "GetProjects" )]
        public async Task<ActionResult<IEnumerable<ProjectRequest>>> GetProjects ( [FromQuery] PaginationParams pagination )
        {
            try
            {
                var query = _context.Projects.AsQueryable ( );

                // Aplicar ordenamiento dinámico
                query = query.ApplySorting ( pagination.OrderBy , pagination.Desc );

                var total = await query.CountAsync ( );
                Response.Headers.Add ( "X-Total-Count" , total.ToString ( ) );

                // Paginación
                var paged = await query.ApplyPagination ( pagination ).ToListAsync ( );

                // Mapeo
                var config = new MapperConfiguration ( cfg => cfg.CreateMap<Project , ProjectRequest> ( ) );
                var mapper = new Mapper ( config );
                var dto = mapper.Map<List<ProjectRequest>> ( paged );

                return dto;
            }
            catch (Exception ex)
            {
                return BadRequest ( ex.Message );
            }
        }

        // GET: api/Projects/5
        [HttpGet ( "{id}" )]
        public async Task<ActionResult<ProjectRequest>> GetProject ( int id )
        {
            try
            {
                var project = await _context.Projects.FindAsync ( id );

                if (project == null)
                {
                    return NotFound ( );
                }

                var projects = await _context.Projects.ToListAsync ( );
                var config = new MapperConfiguration ( cfg => cfg.CreateMap<Project , ProjectRequest> ( ) );

                var mapper = new Mapper ( config );
                ProjectRequest dto = mapper.Map<ProjectRequest> ( projects );

                return dto;
            }
            catch (Exception ex)
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

        }

        // PUT: api/Projects/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut ( "{id}" )]
        public async Task<IActionResult> PutProject ( int id , Project project )
        {
            try
            {
                if (id != project.ID)
                {
                    return BadRequest ( );
                }

                if (!ModelState.IsValid)
                    return BadRequest ( ModelState );

                _context.Entry ( project ).State = EntityState.Modified;

                try
                {
                    await _context.SaveChangesAsync ( );
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProjectExists ( id ))
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

        // POST: api/Projects
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ProjectRequest>> PostProject ( Project project )
        {
            try
            {
                _context.Projects.Add ( project );
                try
                {
                    if (!ModelState.IsValid)
                        return BadRequest ( ModelState );

                    await _context.SaveChangesAsync ( );
                }
                catch (DbUpdateException)
                {
                    if (ProjectExists ( project.ID ))
                    {
                        return Conflict ( );
                    }
                    else
                    {
                        throw;
                    }
                }

                return CreatedAtAction ( "GetProject" , new { id = project.ID } , project );
            }
            catch (Exception ex)
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

        }

        // DELETE: api/Projects/5
        [HttpDelete ( "{id}" )]
        public async Task<IActionResult> DeleteProject ( int id )
        {
            try
            {
                var project = await _context.Projects.FindAsync ( id );
                if (project == null)
                {
                    return NotFound ( );
                }

                _context.Projects.Remove ( project );
                await _context.SaveChangesAsync ( );

                return NoContent ( );
            }
            catch (Exception ex)
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

        }

        [HttpGet ( "GetProjectsList" )]
        public async Task<ActionResult<IEnumerable<ProjectView>>> GetProjectsList ( )
        {
            try
            {
                using (var con = new SqlConnection ( ConnectionString ))
                {
                    var version = await con.QueryAsync ( "SELECT * FROM vListProjects ORDER BY DateProject DESC;" );
                    return Ok ( version.ToList ( ) );
                }
            }
            catch (Exception ex)
            {
                exception = ex;
            }

            return BadRequest ( exception.Message );

        }

        private bool ProjectExists ( int id )
        {
            return _context.Projects.Any ( e => e.ID == id );
        }
    }
}
