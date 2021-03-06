﻿CREATE TABLE Accounts.AspNetUserClaims
(
    Id INT IDENTITY(1, 1) NOT NULL,
    UserId NVARCHAR(450) NOT NULL,
    ClaimType NVARCHAR(MAX) NULL,
    ClaimValue NVARCHAR(MAX) NULL,
    CONSTRAINT PK_AspNetUserClaims
        PRIMARY KEY CLUSTERED (Id ASC),
    CONSTRAINT FK_AspNetUserClaims_AspNetUsers_UserId
        FOREIGN KEY (UserId)
        REFERENCES Accounts.AspNetUsers (Id) ON DELETE CASCADE,
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.AspNetUserClaims_History));


GO
CREATE NONCLUSTERED INDEX IX_AspNetUserClaims_UserId
ON Accounts.AspNetUserClaims (UserId ASC);

