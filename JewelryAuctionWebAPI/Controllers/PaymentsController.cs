using JewelryAuctionBusiness;
using JewelryAuctionBusiness.Dto;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;

namespace JewelryAuctionWebAPI.Controllers
{
    [Authorize(Roles = "Manager, Admin")]
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentsController : ControllerBase
    {
        private readonly PaymentBusiness _paymentBusiness;

        public PaymentsController(PaymentBusiness paymentBusiness)
        {
            _paymentBusiness = paymentBusiness;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var result = await _paymentBusiness.GetAllPayments();
            return GenerateActionResult(result);
        }

        [HttpGet("{key}")]
        public async Task<IActionResult> Get(int key)
        {
            var result = await _paymentBusiness.GetPaymentById(key);
            return GenerateActionResult(result);
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] PaymentDto paymentDto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _paymentBusiness.RecordPayment(paymentDto);
            return GenerateActionResult(result);
        }

        [HttpPut("{key}")]
        public async Task<IActionResult> Put(int key, [FromBody] PaymentDto paymentDto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _paymentBusiness.UpdatePayment(key, paymentDto);
            return GenerateActionResult(result);
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