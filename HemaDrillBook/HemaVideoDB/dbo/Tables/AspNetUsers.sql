CREATE TABLE dbo.AspNetUsers
(
    UserKey INT IDENTITY NOT NULL,
    Id NVARCHAR(450) NOT NULL,
    AccessFailedCount INT NOT NULL,
    ConcurrencyStamp NVARCHAR(MAX) NULL,
    Email NVARCHAR(256) NULL,
    EmailConfirmed BIT NOT NULL,
    LockoutEnabled BIT NOT NULL,
    LockoutEnd DATETIMEOFFSET(7) NULL,
    NormalizedEmail NVARCHAR(256) NULL,
    NormalizedUserName NVARCHAR(256) NULL,
    PasswordHash NVARCHAR(MAX) NULL,
    PhoneNumber NVARCHAR(MAX) NULL,
    PhoneNumberConfirmed BIT NOT NULL,
    SecurityStamp NVARCHAR(MAX) NULL,
    TwoFactorEnabled BIT NOT NULL,
    UserName NVARCHAR(256) NULL,
    DisplayName NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_AspNetUsers
        PRIMARY KEY CLUSTERED (UserKey),
    CONSTRAINT UX_AspNetUsers_Id
        UNIQUE (Id),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.AspNetUsers_History));


GO
CREATE NONCLUSTERED INDEX EmailIndex
ON dbo.AspNetUsers (NormalizedEmail ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX UserNameIndex
ON dbo.AspNetUsers (NormalizedUserName ASC);

