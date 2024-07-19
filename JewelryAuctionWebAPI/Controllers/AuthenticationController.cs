using JewelryAuctionBusiness;
using JewelryAuctionBusiness.Dto;
using Microsoft.AspNetCore.Mvc;

namespace JewelryAuctionWebAPI.Controllers;

[Route("api/[controller]")]
[ApiController]
public class AuthenticationController : Controller
{
    private readonly AccountBusiness _accountBusiness;

    public AuthenticationController(AccountBusiness accountBusiness)
    {
        _accountBusiness = accountBusiness;
    }

    [HttpPost("login")]
    public async Task<IActionResult> Login([FromBody] LoginDTO loginDto)
    {
        var result = await _accountBusiness.LoginAsync(loginDto);
        return GenerateActionResult(result);
    }

    private IActionResult GenerateActionResult(IBusinessResult result)
    {
        return result.Status switch
        {
            400 => BadRequest(result.Message),
            401 => Unauthorized(result.Message),
            404 => NotFound(result.Message),
            200 => Ok(new { token = result.Data, message = result.Message }),
            _ => StatusCode(500, "An internal server error occurred. Please try again later.")
        };
    }
}