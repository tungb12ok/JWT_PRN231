using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using AutoMapper;
using JewelryAuctionBusiness.Dto;
using JewelryAuctionData;
using JewelryAuctionData.Entity;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace JewelryAuctionBusiness;

public class AccountBusiness
{
    private readonly UnitOfWork _unitOfWork;
    private readonly IConfiguration _config;

    public AccountBusiness(UnitOfWork unitOfWork, IConfiguration config)
    {
        _unitOfWork = unitOfWork;
        _config = config;
    }

    public async Task<IBusinessResult> LoginAsync(LoginDTO loginDto)
    {
        var account = await _unitOfWork.AccountRepository.LoginAsync(loginDto.Username, loginDto.Password);

        if (account == null)
        {
            return new BusinessResult(401, "Account incorrect Username or Password.", null);
        }
        var token = GenerateJSONWebToken(account.Username, account.Role);

        return new BusinessResult(200, "Login successfully.", token);
    }
    private string GenerateJSONWebToken(string username, string role)
    {
        var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
        var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);



        var token = new JwtSecurityToken(_config["Jwt:Issuer"],
            _config["Jwt:Audience"],
            new Claim[]
            {
                new("username", username),
                new(ClaimTypes.Role, role),
            },
            expires: DateTime.Now.AddMinutes(60),
            signingCredentials: credentials
        );
        return new JwtSecurityTokenHandler().WriteToken(token);
    }
}