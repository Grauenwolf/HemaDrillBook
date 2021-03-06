﻿CREATE TABLE Interpretations.Play
(
    PlayKey INT NOT NULL IDENTITY
        CONSTRAINT PK_Play PRIMARY KEY,
    SectionKey INT NOT NULL
        CONSTRAINT FK_Play_SectionKey
        REFERENCES Sources.Section (SectionKey),
    VariantName NVARCHAR(200) NULL
        CONSTRAINT C_Play_VariantName CHECK (LEN(VariantName) > 0),
    CreatedByUserKey INT NOT NULL
        CONSTRAINT FK_Play_CreatedByUserKey
        REFERENCES Accounts.AspNetUsers (UserKey),
    CreatedDate DATETIME2(7) NOT NULL
        CONSTRAINT D_Play_CreatedDate
            DEFAULT (GETUTCDATE()),
    ModifiedByUserKey INT NOT NULL
        CONSTRAINT FK_Play_ModifiedByUserKey
        REFERENCES Accounts.AspNetUsers (UserKey),
    AGuardKey INT NULL
        CONSTRAINT FK_Play_AGuard
        REFERENCES Tags.Guard (GuardKey),
    PGuardKey INT NULL
        CONSTRAINT FK_Play_PGuard
        REFERENCES Tags.Guard (GuardKey),
    AGuardModifierKey INT NULL
        CONSTRAINT FK_Play_AGuardModifier
        REFERENCES Tags.GuardModifier (GuardModifierKey),
    PGuardModifierKey INT NULL
        CONSTRAINT FK_Play_PGuardModifier
        REFERENCES Tags.GuardModifier (GuardModifierKey),
    MeasureKey INT NULL
        CONSTRAINT FK_Play_Measure
        REFERENCES Tags.Measure (MeasureKey),
    Notes NVARCHAR(MAX) NULL,
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime),
    CONSTRAINT UX_Play_VariantName
        UNIQUE (
                   SectionKey,
                   VariantName
               )
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Interpretations.Play_History));
GO
GRANT SELECT, INSERT, UPDATE ON Interpretations.Play TO HemaWeb;