CREATE TABLE Interpretations.Commentary
(
   CONSTRAINT PK_Commentary PRIMARY KEY (SectionKey, UserKey),
    SectionKey INT NOT NULL
        CONSTRAINT FK_Commentary_SectionKey
        REFERENCES Sources.Section (SectionKey),
    UserKey INT NOT NULL
        CONSTRAINT FK_Commentary_UserKey
        REFERENCES Accounts.AspNetUsers (UserKey),
    PublicNotes NVARCHAR(MAX) NULL
        CONSTRAINT C_Commentary_PublicNotes CHECK (LEN(PublicNotes) > 0),
    PrivateNotes NVARCHAR(MAX) NULL
        CONSTRAINT C_Commentary_PrivateNotes CHECK (LEN(PrivateNotes) > 0),
    CreatedDate DATETIME2(7) NOT NULL
        CONSTRAINT D_Commentary_CreateDate
            DEFAULT (GETUTCDATE()),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Interpretations.Commentary_History));
GO
GRANT SELECT, INSERT, UPDATE ON Interpretations.Commentary TO HemaWeb;
GO