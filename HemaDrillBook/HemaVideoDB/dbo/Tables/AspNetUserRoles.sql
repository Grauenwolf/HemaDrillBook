CREATE TABLE dbo.AspNetUserRoles
(
    UserId NVARCHAR(450) NOT NULL,
    RoleId NVARCHAR(450) NOT NULL,
    CONSTRAINT PK_AspNetUserRoles
        PRIMARY KEY CLUSTERED
        (
            UserId ASC,
            RoleId ASC
        ),
    CONSTRAINT FK_AspNetUserRoles_AspNetRoles_RoleId
        FOREIGN KEY (RoleId)
        REFERENCES dbo.AspNetRoles (Id) /*ON DELETE CASCADE*/,
    CONSTRAINT FK_AspNetUserRoles_AspNetUsers_UserId
        FOREIGN KEY (UserId)
        REFERENCES dbo.AspNetUsers (Id) /*ON DELETE CASCADE*/,
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.AspNetUserRoles_History));


GO
CREATE NONCLUSTERED INDEX IX_AspNetUserRoles_RoleId
ON dbo.AspNetUserRoles (RoleId ASC);


GO
CREATE NONCLUSTERED INDEX IX_AspNetUserRoles_UserId
ON dbo.AspNetUserRoles (UserId ASC);

