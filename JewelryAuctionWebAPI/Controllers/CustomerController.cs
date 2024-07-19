using JewelryAuctionBusiness;
using JewelryAuctionData.Dto;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace JewelryAuctionWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomersController : ControllerBase
    {
        private readonly CustomerBusiness _customerBusiness;

        public CustomersController(CustomerBusiness customerBusiness)
        {
            _customerBusiness = customerBusiness;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var result = await _customerBusiness.GetAllCustomers();
            return GenerateActionResult(result);
        }

        [HttpGet("{key}")]
        public async Task<IActionResult> Get(int key)
        {
            var result = await _customerBusiness.GetCustomerById(key);
            return GenerateActionResult(result);
        }

        [HttpGet("Companies")]
        public async Task<IActionResult> GetCompany()
        {
            var result = await _customerBusiness.GetAllCompany();
            return GenerateActionResult(result);
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] CustomerDTO customer)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var result = await _customerBusiness.CreateCustomer(customer);
            return GenerateActionResult(result);
        }

        [HttpPut("{key}")]
        public async Task<IActionResult> Put(int key, [FromBody] CustomerDTO customer)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (key != customer.CustomerId)
            {
                return BadRequest("The ID in the URL does not match the ID in the entity.");
            }

            var result = await _customerBusiness.UpdateCustomer(customer);
            return GenerateActionResult(result);
        }

        [HttpDelete("{key}")]
        public async Task<IActionResult> Delete(int key)
        {
            var result = await _customerBusiness.DeleteCustomer(key);
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
