using JewelryAuctionBusiness;
using JewelryAuctionBusiness.Dto;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;

namespace JewelryAuctionWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuctionController : ControllerBase
    {
        private readonly AuctionBusiness _auctionBusiness;

        public AuctionController(AuctionBusiness auctionBusiness)
        {
            _auctionBusiness = auctionBusiness;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var result = await _auctionBusiness.GetScheduledAuctions();
            return GenerateActionResult(result);
        }

        [HttpGet("{key}")]
        public async Task<IActionResult> Get(int key)
        {
            var result = await _auctionBusiness.GetAuctionSectionById(key);
            return GenerateActionResult(result);
        }
        [Authorize(Roles = "Manager, Admin")]
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] AuctionSectionUpdateDto auctionSectionDto)
        {
            var result = await _auctionBusiness.CreateAuctionSection(auctionSectionDto);
            return GenerateActionResult(result);
        }
        [Authorize(Roles = "Manager, Admin")]
        [HttpPut("{key}")]
        public async Task<IActionResult> Put(int key, [FromBody] AuctionSectionUpdateDto auctionSectionDto)
        {
            if (key != auctionSectionDto.AuctionID)
            {
                return BadRequest("The ID in the URL does not match the ID in the entity.");
            }

            var result = await _auctionBusiness.UpdateAuctionSection(key, auctionSectionDto);
            return GenerateActionResult(result);
        }
        [Authorize(Roles = "Manager, Admin")]
        [HttpDelete("{key}")]
        public async Task<IActionResult> Delete(int key)
        {
            var result = await _auctionBusiness.DeleteAuctionSection(key);
            return GenerateActionResult(result);
        }

        private IActionResult GenerateActionResult(IBusinessResult result)
        {
            return result.Status switch
            {
                200 => Ok(result.Data),
                400 => BadRequest(result),
                404 => NotFound(result),
                _ => StatusCode(500, "An internal server error occurred. Please try again later.")
            };
        }
    }
}
