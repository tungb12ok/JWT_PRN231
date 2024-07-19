using JewelryAuctionBusiness;
using JewelryAuctionData.Entity;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using JewelryAuctionBusiness.Dto;
using Microsoft.AspNetCore.Authorization;

namespace JewelryAuctionWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuctionRequestController : ControllerBase
    {
        private readonly RequestAuctionBusiness _auctionBusiness;

        public AuctionRequestController(RequestAuctionBusiness auctionBusiness)
        {
            _auctionBusiness = auctionBusiness;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var result = await _auctionBusiness.GetAllRequestAuctions();
            return GenerateActionResult(result);
        }

        [HttpGet("{key}")]
        public async Task<IActionResult> Get(int key)
        {
            var result = await _auctionBusiness.GetRequestAuctionById(key);
            return GenerateActionResult(result);
        }
        [Authorize(Roles = "Manager, Admin")]
        [HttpPost("CreateJewelryAndAuction")]
        public async Task<IActionResult> CreateJewelryAndAuction([FromBody] CreateJewelryAndAuctionDto dto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _auctionBusiness.CreateJewelryAndRequestAuction(dto, dto.CustomerID);
            return GenerateActionResult(result);
        }
        [Authorize(Roles = "Manager, Admin")]
        [HttpPost("ApproveAuction")]
        public async Task<IActionResult> ApproveAuction([FromBody] RequestAuctionDetailsDto detailsDto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _auctionBusiness.ApproveRequestAuction(detailsDto, true);
            return GenerateActionResult(result);
        }

        private IActionResult GenerateActionResult(IBusinessResult result)
        {
            switch (result.Status)
            {
                case 400:
                    return BadRequest(result);
                case 404:
                    return NotFound(result);
                case 200:
                    return Ok(result.Data);
                default:
                    return StatusCode(500, result.Message);
            }
        }
    }
}
