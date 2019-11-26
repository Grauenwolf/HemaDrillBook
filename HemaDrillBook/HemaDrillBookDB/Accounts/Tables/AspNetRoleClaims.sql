﻿CREATE TABLE Accounts.AspNetRoleClaims
(
    Id INT IDENTITY(1, 1) NOT NULL,
    RoleId NVARCHAR(450) NOT NULL,
    ClaimType NVARCHAR(MAX) NULL,
    ClaimValue NVARCHAR(MAX) NULL,
    CONSTRAINT PK_AspNetRoleClaims
        PRIMARY KEY CLUSTERED (Id ASC),
    CONSTRAINT FK_AspNetRoleClaims_AspNetRoles_RoleId
        FOREIGN KEY (RoleId)
        REFERENCES Accounts.AspNetRoles (Id) ON DELETE CASCADE,
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Accounts.AspNetRoleClaims_History));


GO
CREATE NONCLUSTERED INDEX IX_AspNetRoleClaims_RoleId
ON Accounts.AspNetRoleClaims (RoleId ASC);

