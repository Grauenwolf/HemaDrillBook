using HemaDrillBookTools.Services;
using System;
using System.Windows;
using System.Windows.Controls;

namespace HemaDrillBookTools
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            Application.Current.Shutdown();
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            await ((MainViewModel)DataContext).LoadBooksAsync();
            await ((MainViewModel)DataContext).LoadTagsAsync();
            await ((MainViewModel)DataContext).ProcessStartupArgsAsync();
        }

        private void TreeView_SelectedItemChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
        {
            var selectedItem = ((TreeView)sender).SelectedItem;
            if (selectedItem is SectionSummary)
                ((MainViewModel)DataContext).Section = (SectionSummary)selectedItem;
            else
                ((MainViewModel)DataContext).Section = null;
        }
    }
}
