CREATE TABLE dbo.AspNetUserLogins
(
    LoginProvider NVARCHAR(450) NOT NULL,
    ProviderKey NVARCHAR(450) NOT NULL,
    ProviderDisplayName NVARCHAR(MAX) NULL,
    UserId NVARCHAR(450) NOT NULL,
    CONSTRAINT PK_AspNetUserLogins
        PRIMARY KEY CLUSTERED
        (
            LoginProvider ASC,
            ProviderKey ASC
        ),
    CONSTRAINT FK_AspNetUserLogins_AspNetUsers_UserId
        FOREIGN KEY (UserId)
        REFERENCES dbo.AspNetUsers (Id) /*ON DELETE CASCADE*/,
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.AspNetUserLogins_History));



GO
CREATE NONCLUSTERED INDEX IX_AspNetUserLogins_UserId
ON dbo.AspNetUserLogins (UserId ASC);

