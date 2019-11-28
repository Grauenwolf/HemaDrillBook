namespace HemaDrillBookTools.Services
{
    partial class PlayStep
    {
        public PlayStep()
        {
            PropertyChanged += PlayStep_PropertyChanged;
        }

        private void PlayStep_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            if (e.PropertyName == nameof(Actor))
                RaisePropertyChanged(nameof(IsAgent));
        }

        public bool IsAgent
        {
            get
            {
                return Actor != "P";
            }
            set
            {
                //Setting the Actor property raises the property changed notification for this as well.
                if (value)
                    Actor = "A";
                else
                    Actor = "P";
            }
        }
    }
}
