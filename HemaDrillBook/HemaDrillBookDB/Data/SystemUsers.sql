IF NOT EXISTS (SELECT * FROM Accounts.AspNetUsers anu WHERE anu.UserKey = -1)
BEGIN
    SET IDENTITY_INSERT Accounts.AspNetUsers ON;
    INSERT INTO Accounts.AspNetUsers
    (
        Id,
        AccessFailedCount,
        ConcurrencyStamp,
        Email,
        EmailConfirmed,
        LockoutEnabled,
        LockoutEnd,
        NormalizedEmail,
        NormalizedUserName,
        PasswordHash,
        PhoneNumber,
        PhoneNumberConfirmed,
        SecurityStamp,
        TwoFactorEnabled,
        UserName,
        DisplayName,
        UserKey
    )
    VALUES
    (   N'',      -- Id - nvarchar(450)
        0,        -- AccessFailedCount - int
        N'',      -- ConcurrencyStamp - nvarchar(max)
        N'',      -- Email - nvarchar(256)
        0,        -- EmailConfirmed - bit
        0,        -- LockoutEnabled - bit
        NULL,     -- LockoutEnd - datetimeoffset(7)
        NULL,     -- NormalizedEmail - nvarchar(256)
        NULL,     -- NormalizedUserName - nvarchar(256)
        N'',      -- PasswordHash - nvarchar(max)
        NULL,     -- PhoneNumber - nvarchar(max)
        0,        -- PhoneNumberConfirmed - bit
        N'',      -- SecurityStamp - nvarchar(max)
        0,        -- TwoFactorEnabled - bit
        N'Admin', -- UserName - nvarchar(256)
        N'Admin', -- DisplayName - nvarchar(50)
        -1);
    SET IDENTITY_INSERT Accounts.AspNetUsers OFF;

END;

GO