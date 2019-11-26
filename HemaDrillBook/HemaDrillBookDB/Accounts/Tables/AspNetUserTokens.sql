CREATE TABLE Accounts.AspNetUserTokens
(
    UserId NVARCHAR(450) NOT NULL,
    LoginProvider NVARCHAR(128) NOT NULL,
    Name NVARCHAR(128) NOT NULL,
    Value NVARCHAR(MAX) NULL,
    CONSTRAINT PK_AspNetUserTokens
        PRIMARY KEY CLUSTERED (
                                  UserId ASC,
                                  LoginProvider ASC,
                                  Name ASC
                              ),
    CONSTRAINT FK_AspNetUserTokens_AspNetUsers_UserId
        FOREIGN KEY (UserId)
        REFERENCES Accounts.AspNetUsers (Id) ON DELETE CASCADE
,
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Accounts.AspNetUserTokens_History));

