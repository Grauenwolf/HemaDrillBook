CREATE TABLE Accounts.AspNetUserRoles
(
    UserId NVARCHAR(450) NOT NULL,
    RoleId NVARCHAR(450) NOT NULL,
    CONSTRAINT PK_AspNetUserRoles
        PRIMARY KEY CLUSTERED (
                                  UserId ASC,
                                  RoleId ASC
                              ),
    CONSTRAINT FK_AspNetUserRoles_AspNetRoles_RoleId
        FOREIGN KEY (RoleId)
        REFERENCES Accounts.AspNetRoles (Id) ON DELETE CASCADE,
    CONSTRAINT FK_AspNetUserRoles_AspNetUsers_UserId
        FOREIGN KEY (UserId)
        REFERENCES Accounts.AspNetUsers (Id) ON DELETE CASCADE,
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Accounts.AspNetUserRoles_History));



GO
CREATE NONCLUSTERED INDEX IX_AspNetUserRoles_RoleId
ON Accounts.AspNetUserRoles (RoleId ASC);

