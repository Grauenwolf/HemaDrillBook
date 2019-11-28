using System.Windows;
using System.Windows.Controls;

namespace HemaDrillBookTools
{
    /// <summary>
    /// Interaction logic for LoginDialog.xaml
    /// </summary>
    public partial class LoginDialog : Window
    {
        public LoginDialog()
        {
            InitializeComponent();
        }

        private void PasswordBox_PasswordChanged(object sender, RoutedEventArgs e)
        {
            if (this.DataContext != null)
                ((LoginViewModel)DataContext).Password = ((PasswordBox)sender).Password;
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            await ((LoginViewModel)DataContext).Login(this);
        }
    }
}
