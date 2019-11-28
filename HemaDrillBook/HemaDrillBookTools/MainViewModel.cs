using HemaDrillBookTools.Services;
using System;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Hosting;
using System.Threading.Tasks;
using System.Web;
using System.Windows;
using System.Windows.Input;
using Tortuga.Anchor.Collections;

namespace HemaDrillBookTools
{
    public class MainViewModel : Tortuga.Sails.ViewModelBase
    {
        readonly Client m_ApiClient;
        ActivationArguments m_Args;
        bool m_Zelda = false;

        public MainViewModel(Client apiClient, System.Runtime.Hosting.ActivationArguments args)
        {
            m_Args = args;
            m_ApiClient = apiClient;
            PropertyChanged += MainViewModel_PropertyChanged;
        }

        public ICommand AddPlayCommand => GetCommand(AddPlay);
        public ICommand AddSectionWeaponCommand => GetCommand(AddSectionWeapon);
        public BookSummary Book { get => Get<BookSummary>(); set => Set(value); }
        public BookDetailWithSections BookDetail { get => Get<BookDetailWithSections>(); set => Set(value); }
        public ObservableCollectionExtended<BookSummary> BookList => GetNew<ObservableCollectionExtended<BookSummary>>();
        public ICommand CopyMarkedPlayCommand => GetCommand(CopyMarkedPlay);
        public ICommand CopyPlayCommand => GetCommand<PlayDetail>(CopyPlay);
        public ICommand DeletePlayCommand => GetCommand<PlayDetail>(DeletePlay);
        public ICommand DeleteSectionWeaponCommand => GetCommand<WeaponPairSummary>(DeleteSectionWeapon);

        //public ICommand DeleteVideoCommand => GetCommand<Video>(DeleteVideo);
        public ICommand EditPlayCommand => GetCommand<PlayDetail>(EditPlay);

        public ICommand EditSectionNameCommand => GetCommand<SectionDetail>(EditSectionName);
        //public ICommand EditVideoCommand => GetCommand<Video>(EditVideo);

        public ICommand LoadTagsCommand => GetCommand(async () => await LoadTagsAsync());

        public PlayDetail MarkedPlay { get => Get<PlayDetail>(); set => Set(value); }

        public ICommand MarkPlayCommand => GetCommand<PlayDetail>(MarkPlay);

        public SectionSummary Section { get => Get<SectionSummary>(); set => Set(value); }

        public SectionDetail SectionDetail { get => Get<SectionDetail>(); set => Set(value); }

        public ICommand ShowInBrowserCommand => GetCommand(ShowInBrowser);

        public Tags Tags { get => Get<Tags>(); set => Set(value); }

        public bool TagsLoading { get => Get<bool>(); set => Set(value); }

        public WindowState WindowState { get => Get<WindowState>(); set => Set(value); }

        public async Task LoadBooksAsync()
        {
            BookList.Clear();
            BookList.AddRange(await m_ApiClient.ApiBookGetAsync());
        }

        public async Task LoadTagsAsync()
        {
            TagsLoading = true;
            var techniques = (await m_ApiClient.ApiTagTechniqueAsync()).OrderBy(x => x.TechniqueName);
            var guards = (await m_ApiClient.ApiTagGuardAsync()).OrderBy(x => x.GuardName);
            var footwork = (await m_ApiClient.ApiTagFootworkAsync()).OrderBy(x => x.FootworkName);
            var targets = (await m_ApiClient.ApiTagTargetAsync()).OrderBy(x => x.TargetName);
            var guardModifiers = (await m_ApiClient.ApiTagGuardmodifierAsync()).OrderBy(x => x.GuardModifierName);
            var measures = (await m_ApiClient.ApiTagMeasureAsync()).OrderBy(x => x.MeasureName);

            Tags = new Tags(footwork, techniques, targets, guards, guardModifiers, measures);
            TagsLoading = false;
        }

        public async Task ProcessStartupArgsAsync()
        {
            m_Zelda = true;
            try
            {
                if (m_Args?.ActivationData?.Length > 0)

                {
                    var url = new Uri(m_Args.ActivationData[0], UriKind.Absolute);

                    var parameters = HttpUtility.ParseQueryString(url.Query);

                    // Process parameters here
                    if (parameters.AllKeys.Contains("book"))
                    {
                        var bookKey = int.Parse(parameters["book"]);
                        Book = BookList.SingleOrDefault(b => b.BookKey == bookKey);
                        if (Book != null)
                            BookDetail = await m_ApiClient.ApiBookDetailAsync(Book.BookKey);
                    }
                    if (parameters.AllKeys.Contains("section"))
                    {
                        var sectionKey = int.Parse(parameters["section"]);
                        Section = BookDetail.FindSection(sectionKey);
                        if (Section != null)
                            SectionDetail = await m_ApiClient.ApiBookGetAsync(Section.SectionKey, Section.BookKey.ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Unable to automatically open book/section.");
            }
            m_Args = null;
            m_Zelda = false;
        }

        public async Task RefreshSectionDetailAsync()
        {
            if (Section?.SectionKey != null)
                SectionDetail = await m_ApiClient.ApiBookGetAsync(Section.SectionKey, Section.BookKey.ToString());
        }

        void AddPlay()
        {
            var vm = new PlayEditorViewModel(m_ApiClient, Tags, SectionDetail, RefreshSectionDetailAsync);
            ShowPlayEditor(vm);
        }

        void AddSectionWeapon()
        {
            MessageBox.Show("TODO add weapon to section");
        }

        void CopyMarkedPlay()
        {
            var vm = new PlayEditorViewModel(m_ApiClient, Tags, SectionDetail, RefreshSectionDetailAsync, MarkedPlay, true);
            ShowPlayEditor(vm);
        }

        void CopyPlay(PlayDetail play)
        {
            var vm = new PlayEditorViewModel(m_ApiClient, Tags, SectionDetail, RefreshSectionDetailAsync, play, true);
            ShowPlayEditor(vm);
        }

        void DeletePlay(PlayDetail play)
        {
            MessageBox.Show("TODO: Delete play command");
        }

        void DeleteSectionWeapon(WeaponPairSummary obj)
        {
            MessageBox.Show("TODO delete weapon from section");
        }

        //void DeleteVideo(Video video)
        //{
        //    MessageBox.Show("TODO: add ability to delete videos");
        //}

        void EditPlay(PlayDetail play)
        {
            var vm = new PlayEditorViewModel(m_ApiClient, Tags, SectionDetail, RefreshSectionDetailAsync, play, false);
            ShowPlayEditor(vm);
        }

        void EditSectionName(SectionDetail obj)
        {
            MessageBox.Show("TODO edit section name");
        }

        //void EditVideo(Video video)
        //{
        //    MessageBox.Show("TODO: add ability to edit videos");
        //}

        private async void MainViewModel_PropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            if (m_Zelda)
                return; //we're manually handling this stuff

            if (e.PropertyName == null || e.PropertyName == nameof(Book))
            {
                if (Book?.BookKey != null)
                {
                    BookDetail = await m_ApiClient.ApiBookDetailAsync(Book.BookKey);
                }
                else
                    BookDetail = null;
            }
            if (e.PropertyName == null | e.PropertyName == nameof(Section))
            {
                if (Section?.SectionKey != null)
                    SectionDetail = await m_ApiClient.ApiBookGetAsync(Section.SectionKey, Section.BookKey.ToString());
                else
                    SectionDetail = null;
            }
        }

        void MarkPlay(PlayDetail play)
        {
            MarkedPlay = play;
        }

        void ShowInBrowser()
        {
            if (SectionDetail != null)
                Process.Start($"{m_ApiClient.BaseUrl}/b/{SectionDetail.BookSlug}/p/{SectionDetail.PartSlug}/s/{SectionDetail.SectionSlug}");
            else if (BookDetail != null)
                Process.Start($"{m_ApiClient.BaseUrl}/b/{SectionDetail.BookSlug}/p/{SectionDetail.PartSlug}");
            else
                Process.Start($"{m_ApiClient.BaseUrl}");
        }

        private void ShowPlayEditor(PlayEditorViewModel vm)
        {
            var window = new PlayEditor() { DataContext = vm };
            if (WindowState == WindowState.Maximized)
                window.WindowState = WindowState.Maximized;
            window.Show();
        }
    }
}
