CREATE TABLE Accounts.AspNetUsers
(
    UserKey INT NOT NULL IDENTITY CONSTRAINT PK_AspNetUsers PRIMARY KEY,
	Id NVARCHAR(450) NOT NULL,
    UserName NVARCHAR(256) NULL,
    NormalizedUserName NVARCHAR(256) NULL,
    Email NVARCHAR(256) NULL,
    NormalizedEmail NVARCHAR(256) NULL,
    EmailConfirmed BIT NOT NULL,
    PasswordHash NVARCHAR(MAX) NULL,
    SecurityStamp NVARCHAR(MAX) NULL,
    ConcurrencyStamp NVARCHAR(MAX) NULL,
    PhoneNumber NVARCHAR(MAX) NULL,
    PhoneNumberConfirmed BIT NOT NULL,
    TwoFactorEnabled BIT NOT NULL,
    LockoutEnd DATETIMEOFFSET(7) NULL,
    LockoutEnabled BIT NOT NULL,
    AccessFailedCount INT NOT NULL,
	DisplayName NVARCHAR(50) NULL,
    CONSTRAINT UX_AspNetUsers_Id UNIQUE (Id ASC),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Accounts.AspNetUsers_History));



GO
CREATE NONCLUSTERED INDEX EmailIndex
ON Accounts.AspNetUsers (NormalizedEmail ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX UserNameIndex
ON Accounts.AspNetUsers (NormalizedUserName ASC)
WHERE (NormalizedUserName IS NOT NULL);


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'If this is null, the user cannot share their commentary/videos.',
    @level0type = N'SCHEMA',
    @level0name = N'Accounts',
    @level1type = N'TABLE',
    @level1name = N'AspNetUsers',
    @level2type = N'COLUMN',
    @level2name = N'DisplayName'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'This is the primary key according to ASP.NET Identity',
    @level0type = N'SCHEMA',
    @level0name = N'Accounts',
    @level1type = N'TABLE',
    @level1name = N'AspNetUsers',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'This is the primary key according to the application',
    @level0type = N'SCHEMA',
    @level0name = N'Accounts',
    @level1type = N'TABLE',
    @level1name = N'AspNetUsers',
    @level2type = N'COLUMN',
    @level2name = N'UserKey'