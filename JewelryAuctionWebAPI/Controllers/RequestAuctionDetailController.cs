using JewelryAuctionBusiness;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;

namespace JewelryAuctionWebAPI.Controllers
{
    [Authorize(Roles = "Manager, Admin")]
    [Route("api/[controller]")]
    [ApiController]
    public class RequestAuctionDetailController : ControllerBase
    {
        private readonly RequestAuctionBusiness _auctionBusiness;

        public RequestAuctionDetailController(RequestAuctionBusiness auctionBusiness)
        {
            _auctionBusiness = auctionBusiness;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var result = await _auctionBusiness.GetAllRequestDetail();
            return GenerateActionResult(result);
        }

        [HttpGet("{key}")]
        public async Task<IActionResult> Get(int key)
        {
            var result = await _auctionBusiness.GetAllRequestDetailByKey(key);
            return GenerateActionResult(result);
        }

        [HttpPut("{key}")]
        public async Task<IActionResult> Put(int key, [FromQuery] string status)
        {
            if (_auctionBusiness.GetAllRequestDetailByKey(key) == null)
            {
                return BadRequest("The ID in the URL does not match the ID in the entity.");
            }

            switch (status)
            {
                case "Pending":
                case "Rejected":
                case "Approved":
                    var result = await _auctionBusiness.UpdateRequestAuctionDetailsStatus(key, status);
                    return GenerateActionResult(result);
                default:
                    return BadRequest("The status must be one of the enum values: Pending, Rejected, or Approved.");
            }
        }

        private IActionResult GenerateActionResult(IBusinessResult result)
        {
            return result.Status switch
            {
                400 => BadRequest(result),
                404 => NotFound(result),
                200 => Ok(result.Data),
                _ => StatusCode(500, "An internal server error occurred. Please try again later."),
            };
        }
    }
}
