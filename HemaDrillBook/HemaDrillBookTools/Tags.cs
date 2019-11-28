using HemaDrillBookTools.Services;
using System.Collections.Generic;
using Tortuga.Anchor.Collections;

namespace HemaDrillBookTools
{
    public class Tags
    {
        public Tags(IEnumerable<Footwork> footwork,
            IEnumerable<Technique> techniques,
            IEnumerable<Target> targets,
            IEnumerable<Guard> guards,
            IEnumerable<GuardModifier> guardModifiers,
            IEnumerable<Measure> measures)
        {
            Footwork.AddRange(footwork);
            Techniques.AddRange(techniques);
            Targets.AddRange(targets);
            Guards.AddRange(guards);
            GuardModifiers.AddRange(guardModifiers);
            Measures.AddRange(measures);

            Footwork.Insert(0, new Footwork() { });
            Techniques.Insert(0, new Technique() { });
            Targets.Insert(0, new Target() { });
            Guards.Insert(0, new Guard() { });
            GuardModifiers.Insert(0, new GuardModifier() { });
            Measures.Insert(0, new Measure() { });
        }

        public ObservableCollectionExtended<Footwork> Footwork { get; } = new ObservableCollectionExtended<Footwork>();
        public ObservableCollectionExtended<Technique> Techniques { get; } = new ObservableCollectionExtended<Technique>();
        public ObservableCollectionExtended<Target> Targets { get; } = new ObservableCollectionExtended<Target>();
        public ObservableCollectionExtended<Guard> Guards { get; } = new ObservableCollectionExtended<Guard>();
        public ObservableCollectionExtended<GuardModifier> GuardModifiers { get; } = new ObservableCollectionExtended<GuardModifier>();
        public ObservableCollectionExtended<Measure> Measures { get; } = new ObservableCollectionExtended<Measure>();
    }
}
