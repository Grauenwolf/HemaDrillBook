using HemaDrillBookTools.Properties;
using System;
using System.Windows;

namespace HemaDrillBookTools
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            LoginViewModel loginViewModel = new LoginViewModel()
            {
                //Url = "https://localhost:44333/",
                Url = "https://hemadrillbook.azurewebsites.net/",

                UserName = Settings.Default.UserName,
                Password = Settings.Default.Password
            };
            var dialog = new LoginDialog() { DataContext = loginViewModel };

            dialog.ShowDialog();

            if (!loginViewModel.IsLoggedIn)
            {
                Shutdown();
                return;
            }

            Settings.Default.UserName = loginViewModel.UserName;
            Settings.Default.Password = loginViewModel.Password;
            Settings.Default.Save();

            var args = AppDomain.CurrentDomain.SetupInformation.ActivationArguments;

            var window = new MainWindow() { DataContext = new MainViewModel(loginViewModel.ApiClient, args) };
            window.Show();
        }
    }
}
