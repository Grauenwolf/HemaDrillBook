﻿CREATE TABLE Accounts.BookEditor
(
    UserKey INT NOT NULL CONSTRAINT FK_BookEditor_UserKey REFERENCES Accounts.AspNetUsers(UserKey),
	BookKey INT NOT NULL CONSTRAINT FK_BookEditor_BookKey REFERENCES Sources.Book(BookKey),
	CONSTRAINT PK_BookEditor PRIMARY KEY(UserKey, BookKey),
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Accounts.BookEditor_History));