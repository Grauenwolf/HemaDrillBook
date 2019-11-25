CREATE TABLE Interpretations.PlayStep
(
    PlayKey INT NOT NULL,
    TempoNumber INT NOT NULL,
    Actor CHAR(1) NOT NULL
        CONSTRAINT C_PlayStep_Actor CHECK (Actor IN ( 'A', 'P' )),
    CONSTRAINT PK_PlayStep
        PRIMARY KEY (
                        PlayKey,
                        TempoNumber,
                        Actor
                    ),
    FootworkKey INT NULL
        CONSTRAINT FK_PlayStep_Footwork
        REFERENCES Tags.Footwork (FootworkKey),
    TechniqueKey1 INT NULL
        CONSTRAINT FK_PlayStep_TechniqueKey1
        REFERENCES Tags.Technique (TechniqueKey),
    TechniqueKey2 INT NULL
        CONSTRAINT FK_PlayStep_TechniqueKey2
        REFERENCES Tags.Technique (TechniqueKey),
    TechniqueKey3 INT NULL
        CONSTRAINT FK_PlayStep_TechniqueKey3
        REFERENCES Tags.Technique (TechniqueKey),
    TargetKey1 INT NULL
        CONSTRAINT FK_PlayStep_Target1
        REFERENCES Tags.Target (TargetKey),
    TargetKey2 INT NULL
        CONSTRAINT FK_PlayStep_Target2
        REFERENCES Tags.Target (TargetKey),
    TargetKey3 INT NULL
        CONSTRAINT FK_PlayStep_Target3
        REFERENCES Tags.Target (TargetKey),
    GuardKey INT NULL
        CONSTRAINT FK_PlayStep_Guard
        REFERENCES Tags.Guard (GuardKey),
    GuardModifierKey INT NULL
        CONSTRAINT FK_PlayStep_GuardModifier
        REFERENCES Tags.GuardModifier (GuardModifierKey),
    IntermediateGuardKey INT NULL
        CONSTRAINT FK_PlayStep_IntermediateGuard
        REFERENCES Tags.Guard (GuardKey),
    IntermediateGuardModifierKey INT NULL
        CONSTRAINT FK_PlayStep_IntermediateGuardModifier
        REFERENCES Tags.GuardModifier (GuardModifierKey),
    Notes NVARCHAR(MAX) NULL,
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Interpretations.PlayStep_History));
GO
GRANT SELECT, INSERT, UPDATE, DELETE ON Interpretations.PlayStep TO HemaWeb;