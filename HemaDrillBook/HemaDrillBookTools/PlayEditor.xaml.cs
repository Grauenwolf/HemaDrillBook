using HemaDrillBookTools.Services;
using System.Windows;
using System.Windows.Controls;

namespace HemaDrillBookTools
{
    /// <summary>
    /// Interaction logic for PlayEditor.xaml
    /// </summary>
    public partial class PlayEditor : Window
    {
        public PlayEditor()
        {
            InitializeComponent();
        }

        private void RadioButton_Checked(object sender, RoutedEventArgs e)
        {
            var radioButton = (RadioButton)sender;
            var dc = (PlayStep)radioButton.DataContext;
            dc.Actor = (string)radioButton.Tag;
        }
    }
}
