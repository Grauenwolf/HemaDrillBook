/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


:r .\Data\Weapon.sql
--:r .\Data\Guard.sql
--:r .\Data\Footwork.sql
--:r .\Data\Measure.sql
--:r .\Data\GuardModifier.sql
--:r .\Data\Target.sql
--:r .\Data\Technique.sql

----- Video Services

IF NOT EXISTS (SELECT * FROM Interpretations.VideoService)
    INSERT INTO Interpretations.VideoService
    (
        VideoServiceKey,
        VideoServiceName,
        VideoServiceUrlFormat,
        VideoServiceEmbedFormat
    )
    VALUES
    (   0,        -- VideoServiceKey - int
        'Custom', -- VideoServiceName - varchar(50)
        NULL, NULL),
    (   1,         -- VideoServiceKey - int
        'YouTube', -- VideoServiceName - varchar(50)
        NULL, NULL),
    (   2,       -- VideoServiceKey - int
        'Vimeo', -- VideoServiceName - varchar(50)
        NULL, NULL);

---- System Users

IF NOT EXISTS (SELECT * FROM dbo.AspNetUsers anu WHERE anu.UserKey = -1)
BEGIN
    SET IDENTITY_INSERT dbo.AspNetUsers ON;
    INSERT INTO dbo.AspNetUsers
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
    SET IDENTITY_INSERT dbo.AspNetUsers OFF;

END;