CREATE TABLE Interpretations.Play_History
(
    PlayKey INT NOT NULL,
    SectionKey INT NOT NULL,
    VariantName NVARCHAR(200) NULL,
    CreatedByUserKey INT NOT NULL,
    CreatedDate DATETIME2(7) NOT NULL,
    ModifiedByUserKey INT NOT NULL,
    AGuardKey INT NULL,
    PGuardKey INT NULL,
    AGuardModifierKey INT NULL,
    PGuardModifierKey INT NULL,
    MeasureKey INT NULL,
    Notes NVARCHAR(MAX) NULL,
    SysStartTime DATETIME2(7) NOT NULL,
    SysEndTime DATETIME2(7) NOT NULL
);
GO
;
