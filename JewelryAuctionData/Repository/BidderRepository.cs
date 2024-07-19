using BadmintonReservationData.Base;
using JewelryAuctionData.Entity;
using Microsoft.EntityFrameworkCore;

namespace JewelryAuctionData.Repository
{
    public class BidderRepository : GenericRepository<Bidder>
    {
        public BidderRepository(UnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        public async Task<int?> GetLastAsync()
        {
            throw new NotImplementedException();
        }
    }

}
