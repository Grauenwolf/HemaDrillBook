using HemaDrillBookTools.Services;
using System;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using Tortuga.Sails;

namespace HemaDrillBookTools
{
    public class PlayEditorViewModel : ViewModelBase
    {
        readonly Client m_ApiClient;
        readonly Func<Task> m_OnSave;
        int m_BookKey;
        string m_Url;

        public PlayEditorViewModel(Client apiClient, Tags tags, SectionDetail section, Func<Task> onSave)
        {
            m_OnSave = onSave;
            m_ApiClient = apiClient ?? throw new ArgumentNullException(nameof(apiClient), $"{nameof(apiClient)} is null.");
            Tags = tags ?? throw new ArgumentNullException(nameof(tags), $"{nameof(tags)} is null.");
            SectionName = section.SectionName;
            Play.SectionKey = section.SectionKey;
            Play.Steps = new ObservableCollection<PlayStep>();
            foreach (var step in Play.Steps)
                step.PropertyChanged += Step_PropertyChanged;
            m_BookKey = section.BookKey;
            m_Url = $"{m_ApiClient.BaseUrl}/b/{section.BookSlug}/p/{section.PartSlug}/s/{section.SectionSlug}/t/plays";
        }

        public PlayEditorViewModel(Client apiClient, Tags tags, SectionDetail section, Func<Task> onSave, PlayDetail play, bool isCopy) : this(apiClient, tags, section, onSave)
        {
            Play.AGuardKey = play.AGuardKey;
            Play.PGuardKey = play.PGuardKey;
            Play.AGuardModifierKey = play.AGuardModifierKey;
            Play.PGuardModifierKey = play.PGuardModifierKey;
            Play.MeasureKey = play.MeasureKey;

            if (!isCopy)
            {
                Play.PlayKey = play.PlayKey;
                Play.VariantName = play.VariantName;
            }
            else
            {
                if (Play.SectionKey == play.SectionKey) //copy into same section
                    Play.VariantName = "Copy of " + play.VariantName;
                else //copy into different section
                    Play.VariantName = play.VariantName;
            }

            foreach (var step in play.Steps)
            {
                PlayStep item = new PlayStep()
                {
                    Actor = step.Actor,
                    FootworkKey = step.FootworkKey,
                    GuardKey = step.GuardKey,
                    GuardModifierKey = step.GuardModifierKey,
                    IntermediateGuardKey = step.IntermediateGuardKey,
                    IntermediateGuardModifierKey = step.IntermediateGuardModifierKey,
                    Notes = step.Notes,
                    TargetKey1 = step.TargetKey1,
                    TargetKey2 = step.TargetKey2,
                    TargetKey3 = step.TargetKey3,
                    TechniqueKey1 = step.TechniqueKey1,
                    TechniqueKey2 = step.TechniqueKey2,
                    TechniqueKey3 = step.TechniqueKey3,
                    TempoNumber = step.TempoNumber
                };
                Play.Steps.Add(item);

                item.PropertyChanged += Step_PropertyChanged;
            }
        }

        public ICommand AddStepCommand => GetCommand(AddStep);
        public ICommand DeleteStepCommand => GetCommand<PlayStep>(DeleteStep);
        public ICommand MoveDownCommand => GetCommand<PlayStep>(MoveDown);
        public ICommand MoveUpCommand => GetCommand<PlayStep>(MoveUp);
        public Play Play => GetNew<Play>();

        public ICommand SaveCommand => GetCommand(async () => await SaveAsync());

        public string SectionName { get; }

        public ICommand ShowInBrowserCommand => GetCommand(ShowInBrowser);

        public Tags Tags { get; }

        public void AddStep()
        {
            var s = new PlayStep() { Actor = "A" };
            Play.Steps.Add(s);
            s.PropertyChanged += Step_PropertyChanged;
            Normalize();
        }

        public void DeleteStep(PlayStep step)
        {
            step.PropertyChanged -= Step_PropertyChanged;
            Play.Steps.Remove(step);
            Normalize();
        }

        public void MoveDown(PlayStep step)
        {
            var oldIndex = Play.Steps.IndexOf(step);
            if (oldIndex < Play.Steps.Count - 1)
                Play.Steps.Move(oldIndex, oldIndex + 1);
            Normalize();
        }

        public void MoveUp(PlayStep step)
        {
            var oldIndex = Play.Steps.IndexOf(step);
            if (oldIndex > 0)
                Play.Steps.Move(oldIndex, oldIndex - 1);
            Normalize();
        }

        public void Normalize()
        {
            //Renumber steps
            var previousATempo = 0;
            var previousPTempo = 0;

            foreach (var step in Play.Steps)
            {
                if (previousATempo == 0 && previousPTempo == 0 && step.Actor[0] == 'A')
                {
                    previousATempo = 1;
                    step.TempoNumber = 1;
                }
                else if (previousATempo == 0 && previousPTempo == 0 && step.Actor[0] == 'P')
                {
                    //It is wrong to start with P, but whatever
                    previousATempo = 1;
                    previousPTempo = 1;
                    step.TempoNumber = 1;
                }
                else if (step.Actor[0] == 'A')
                {
                    previousATempo += 1;
                    if (previousATempo <= previousPTempo) //we must have skipped an A turn
                        previousATempo = previousPTempo + 1; //A tempi always start on a new number

                    step.TempoNumber = previousATempo;
                }
                else if (step.Actor[0] == 'P')
                {
                    previousPTempo += 1;
                    if (previousPTempo < previousATempo) //we must have skipped a P turn
                        previousPTempo = previousATempo;
                    else if (previousPTempo > previousATempo) //we must have skipped an A turn
                        previousATempo = previousPTempo; //drag along the A count.

                    step.TempoNumber = previousPTempo;
                }
            }
        }

        async Task SaveAsync()
        {
            Normalize();

            try
            {
                Play.PlayKey = await m_ApiClient.ApiBookUpdateplayAsync(Play);
                await m_OnSave();
                MessageBox.Show($"Play was saved as key {Play.PlayKey}");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Failed to save record");
            }
        }

        void ShowInBrowser()
        {
            Process.Start(m_Url);
        }

        private void Step_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            if (string.IsNullOrEmpty(e.PropertyName) || e.PropertyName == nameof(PlayStep.Actor))
                Normalize();
        }

        public ICommand AddMeasureCommand => GetCommand(AddMeasure);

        void AddMeasure()
        {
            var vm = new TagViewModel<Measure>(m_ApiClient);
            var dialog = new TagEditorDialog() { DataContext = vm };
            var result = dialog.ShowDialog();
            if (result == true)
                Tags.Measures.Insert(1, vm.Tag);
        }

        public ICommand AddTargetCommand => GetCommand(AddTarget);

        void AddTarget()
        {
            var vm = new TagViewModel<Target>(m_ApiClient);
            var dialog = new TagEditorDialog() { DataContext = vm };
            var result = dialog.ShowDialog();
            if (result == true)
                Tags.Targets.Insert(1, vm.Tag);
        }

        public ICommand AddGuardCommand => GetCommand(AddGuard);

        void AddGuard()
        {
            var vm = new TagViewModel<Guard>(m_ApiClient);
            var dialog = new TagEditorDialog() { DataContext = vm };
            var result = dialog.ShowDialog();
            if (result == true)
                Tags.Guards.Insert(1, vm.Tag);
        }

        public ICommand AddGuardModifierCommand => GetCommand(AddGuardModifier);

        void AddGuardModifier()
        {
            var vm = new TagViewModel<GuardModifier>(m_ApiClient);
            var dialog = new TagEditorDialog() { DataContext = vm };
            var result = dialog.ShowDialog();
            if (result == true)
                Tags.GuardModifiers.Insert(1, vm.Tag);
        }

        public ICommand AddFootworkCommand => GetCommand(AddFootwork);

        void AddFootwork()
        {
            var vm = new TagViewModel<Footwork>(m_ApiClient);
            var dialog = new TagEditorDialog() { DataContext = vm };
            var result = dialog.ShowDialog();
            if (result == true)
                Tags.Footwork.Insert(1, vm.Tag);
        }

        public ICommand AddTechniqueCommand => GetCommand(AddTechnique);

        void AddTechnique()
        {
            var vm = new TagViewModel<Technique>(m_ApiClient);
            var dialog = new TagEditorDialog() { DataContext = vm };
            var result = dialog.ShowDialog();
            if (result == true)
                Tags.Techniques.Insert(1, vm.Tag);
        }
    }
}
