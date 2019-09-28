using System.Collections.Generic;
using Sabio.Models;
using Sabio.Models.Requests;

namespace Sabio.Services
{
    public interface IAdvertisementServices
    {
        Paged<Advertisement> GetPaged(int pageIndex, int pageSize);
        int Add(AdvertAddRequest model);
    }
}