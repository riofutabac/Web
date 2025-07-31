using System;
using System.Configuration;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace EvaRestWeb.Models
{
    public static class ApiClient
    {
        private static string BaseUrl
        {
            get { return ConfigurationManager.AppSettings["ApiBaseUrl"]; }
        }

        public static async Task<string> GetAsync()
        {
            using (var client = new WebClient())
            {
                client.Headers[HttpRequestHeader.Accept] = "application/json";
                return await client.DownloadStringTaskAsync(BaseUrl);
            }
        }

        public static async Task<string> GetById(int id)
        {
            using (var client = new WebClient())
            {
                client.Headers[HttpRequestHeader.Accept] = "application/json";
                return await client.DownloadStringTaskAsync(BaseUrl + "/" + id);
            }
        }

        public static async Task<string> PostAsync(string jsonContent)
        {
            using (var client = new WebClient())
            {
                client.Headers[HttpRequestHeader.ContentType] = "application/json";
                return await client.UploadStringTaskAsync(BaseUrl, "POST", jsonContent);
            }
        }

        public static async Task<string> PutAsync(int id, string jsonContent)
        {
            using (var client = new WebClient())
            {
                client.Headers[HttpRequestHeader.ContentType] = "application/json";
                return await client.UploadStringTaskAsync(BaseUrl + "/" + id, "PUT", jsonContent);
            }
        }

        public static async Task<string> DeleteAsync(int id)
        {
            using (var client = new WebClient())
            {
                client.Headers[HttpRequestHeader.Accept] = "application/json";
                return await client.UploadStringTaskAsync(BaseUrl + "/" + id, "DELETE", "");
            }
        }
    }
}