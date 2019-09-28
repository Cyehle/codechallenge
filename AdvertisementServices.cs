using Sabio.Data;
using Sabio.Data.Providers;
using Sabio.Models;
using Sabio.Models.Requests;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Sabio.Services
{
    public class AdvertisementServices : IAdvertisementServices
    {
        IDataProvider _data = null;
        public AdvertisementServices(IDataProvider data)
        {
            _data = data;
        }

        public Paged<Advertisement> GetPaged(int pageIndex, int pageSize)
        {
            Paged<Advertisement> paged = null;
            List<Advertisement> list = null;
            int totalCount = 0;

            string procName = "dbo.Advertisment_SelectAll";
            _data.ExecuteCmd(procName, inputParamMapper: delegate (SqlParameterCollection col)
            {
                col.AddWithValue("@pageIndex", pageIndex);
                col.AddWithValue("@pageSize", pageSize);
            },
            singleRecordMapper:delegate(IDataReader reader, short set)
            {
                    Advertisement advert = MapAdvert(reader);

                    if(list == null)
                    {
                        list = new List<Advertisement>();
                    }
                    list.Add(advert);
                });
            if(list != null)
            {
                paged = new Paged<Advertisement>(list, pageIndex, pageSize, totalCount);
            }
            return paged;
        }

        public int Add(AdvertAddRequest model)
        {
            int id = 0;
            string procName = "dbo.advert_insert";
            _data.ExecuteNonQuery(procName,
                inputParamMapper: delegate (SqlParameterCollection col)
                {
                    col.AddWithValue("@shortTitle", model.shortTitle);
                    col.AddWithValue("@Title", model.title);
                    col.AddWithValue("@shortDescription", model.shortDescription);
                    col.AddWithValue("@content", model.content);
                    col.AddWithValue("@CreatedBy", model.createdBy);
                    col.AddWithValue("@Slug", model.slug);
                    col.AddWithValue("@entityTypeId", model.entityTypeId);
                    col.AddWithValue("@statusId", model.statusId);
                    col.AddWithValue("@latitude", model.latitude);
                    col.AddWithValue("@longitude", model.longitude);
                    col.AddWithValue("@zipcode", model.zipcode);
                    col.AddWithValue("@address", model.address);




                    SqlParameter idOut = new SqlParameter("@Id", SqlDbType.Int);
                    idOut.Direction = ParameterDirection.Output;

                    col.Add(idOut);

                },
                returnParameters: delegate (SqlParameterCollection returnCollection)
                {
                    object oId = returnCollection["@Id"].Value;

                    int.TryParse(oId.ToString(), out id);

                    Console.WriteLine("");
                });

            return id;
        }

        private static Advertisement MapAdvert(IDataReader reader)
        {
            int index = 0;
            Advertisement advert = new Advertisement();

            advert.Id = reader.GetSafeInt32(index++);
            advert.shortTitle = reader.GetSafeString(index++);
            advert.title = reader.GetSafeString(index++);
            advert.shortDescription = reader.GetSafeString(index++);
            advert.content = reader.GetSafeString(index++);
            advert.createdBy = reader.GetSafeInt32(index++);
            advert.Slug = reader.GetSafeString(index++);
            advert.entityTypeId = reader.GetSafeInt32(index++);
            advert.statusId = reader.GetSafeInt32(index++);
            advert.dateCreated = reader.GetDateTime(index++);
            advert.dateModified = reader.GetDateTime(index++);

            return advert;

        }
    }
}
