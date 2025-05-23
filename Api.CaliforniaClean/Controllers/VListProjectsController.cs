using Api.CaliforniaEF;
using Api.DbContext.CaliforniaEF;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Api.CaliforniaClean.Controllers
{
    [ApiController]
    [Route ( "api/[controller]" )]
    public class VListProjectsController : ControllerBase
    {
        private readonly californiaContext _context;

        public VListProjectsController ( californiaContext context )
        {
            _context = context;
        }

        // GET: api/VListProjects
        [HttpGet]
        public async Task<ActionResult<IEnumerable<vListProject>>> GetAll ( )
        {
            var result = await _context.vListProjects.ToListAsync ( );
            return Ok ( result );
        }

        // GET: api/VListProjects/5
        [HttpGet ( "{id}" )]
        public async Task<ActionResult<vListProject>> GetById ( int id )
        {
            var item = await _context.vListProjects.FirstOrDefaultAsync ( p => p.ID == id );
            if (item == null)
                return NotFound ( );

            return Ok ( item );
        }
    }
}
