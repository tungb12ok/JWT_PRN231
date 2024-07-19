using JewelryAuctionBusiness;
using JewelryAuctionBusiness.Dto;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;

namespace JewelryAuctionWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BidderController : ControllerBase
    {
        private readonly BidderBusiness _bidderBusiness;

        public BidderController(BidderBusiness bidderBusiness)
        {
            _bidderBusiness = bidderBusiness;
        }

        [HttpPost("place-bid")]
        public async Task<IActionResult> PlaceBid([FromBody] BidderAuction bidderDto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _bidderBusiness.PlaceBid(bidderDto);
            return GenerateActionResult(result);
        }
        [Authorize(Roles = "Manager, Admin")]
        [HttpGet("get-bidder/{customerId}")]
        public async Task<IActionResult> GetBidderByCustomerId(int customerId)
        {
            var result = await _bidderBusiness.GetBidderByCustomerId(customerId);
            return GenerateActionResult(result);
        }

        private IActionResult GenerateActionResult(IBusinessResult result)
        {
            return result.Status switch
            {
                400 => BadRequest(result),
                404 => NotFound(result),
                200 => result.Data == null ? Ok(result) : Ok(result.Data),
                _ => StatusCode(500, "An internal server error occurred. Please try again later."),
            };
        }
    }
}