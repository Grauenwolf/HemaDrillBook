using HemaDrillBook.Services;

namespace HemaDrillBook.Services.UI
{
    public class PlayStepDetail
    {
        public char Actor { get; set; }
        public string? ActorName => Actor == 'A' ? "Agent" : "Patient";

        //public string? AlternateFootworkName { get; set; }
        public string? AlternateGuardName { get; set; }

        public string? IntermediateAlternateGuardName { get; set; }
        public string? AlternateTechniqueName1 { get; set; }
        public string? AlternateTechniqueName2 { get; set; }
        public string? AlternateTechniqueName3 { get; set; }

        //public int? FootworkKey { get; set; }
        public string? FootworkName { get; set; }

        public int? GuardKey { get; set; }
        public int? GuardModifierKey { get; set; }
        public string? GuardModifierName { get; set; }
        public string? GuardName { get; set; }
        public int? IntermediateGuardKey { get; set; }
        public int? IntermediateGuardModifierKey { get; set; }
        public string? IntermediateGuardModifierName { get; set; }
        public string? IntermediateGuardName { get; set; }
        public string? Notes { get; set; }
        public int PlayKey { get; set; }

        //public int? TargetKey1 { get; set; }
        //public int? TargetKey2 { get; set; }
        //public int? TargetKey3 { get; set; }
        public string? TargetName1 { get; set; }

        public string? TargetName2 { get; set; }
        public string? TargetName3 { get; set; }

        //public int? TechniqueKey1 { get; set; }
        //public int? TechniqueKey2 { get; set; }
        //public int? TechniqueKey3 { get; set; }
        public string? TechniqueName1 { get; set; }

        public string? TechniqueName2 { get; set; }
        public string? TechniqueName3 { get; set; }
        public int TempoNumber { get; set; }

        public string? GuardFullName => Formatter.GuardFullNameForDisplay("into", GuardName, AlternateGuardName, GuardModifierName);
        public string? IntermediateGuardFullName => Formatter.GuardFullNameForDisplay("thru", IntermediateGuardName, IntermediateAlternateGuardName, IntermediateGuardModifierName);

        public string? TargetFull => Formatter.Join("or", TargetName1, TargetName2, TargetName3);

        public string? TechniqueFullName1 => Formatter.MultiPart(TechniqueName1, AlternateTechniqueName1);
        public string? TechniqueFullName2 => Formatter.MultiPart(TechniqueName2, AlternateTechniqueName2);
        public string? TechniqueFullName3 => Formatter.MultiPart(TechniqueName3, AlternateTechniqueName3);
        public string? TechniqueFullName => Formatter.Join("and", TechniqueFullName1, TechniqueFullName2, TechniqueFullName3);
    }
}
