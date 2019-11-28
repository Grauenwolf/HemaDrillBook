using HemaDrillBookTools.Services;
using System;
using System.Net.Http;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using Tortuga.Sails;

namespace HemaDrillBookTools
{
    public class LoginViewModel : ViewModelBase
    {
        public Client ApiClient { get => Get<Client>(); set => Set(value); }

        public string UserName { get => Get<String>(); set => Set(value); }
        public string Url { get => Get<String>(); set => Set(value); }
        public string Password { get => Get<String>(); set => Set(value); }
        public bool IsLoggedIn { get => Get<bool>(); set => Set(value); }

        public ICommand LoginCommand => GetCommand<Window>(async (dialog) => await Login(dialog));

        public async Task Login(Window dialog)
        {
            var apiClient = new Client(Url, new HttpClient());
            var result = await apiClient.ApiAccountLoginAsync(UserName, Password, false);
            if (result)
            {
                IsLoggedIn = true;
                ApiClient = apiClient;
                dialog.Close();
            }
        }
    }
}
