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


:r .\Data\OneTime\Tags.Weapon.sql
:r .\Data\OneTime\Tags.Guard.sql
:r .\Data\OneTime\Tags.Footwork.sql
:r .\Data\OneTime\Tags.Measure.sql
:r .\Data\OneTime\Tags.GuardModifier.sql
:r .\Data\OneTime\Tags.Target.sql
:r .\Data\OneTime\Tags.Technique.sql


--Meyer
:r .\Data\OneTime\Sources.Author.sql
:r .\Data\OneTime\Sources.Book.sql
:r .\Data\OneTime\Sources.BookAuthor.sql
:r .\Data\OneTime\Meyer\Sources.Part.sql
:r .\Data\OneTime\Meyer\Sources.Section.Part.1.sql
:r .\Data\OneTime\Meyer\Sources.Section.Part.2.sql
:r .\Data\OneTime\Meyer\Sources.Section.Part.3.sql
:r .\Data\OneTime\Meyer\Sources.Section.Part.4.sql
:r .\Data\OneTime\Meyer\Sources.Section.Part.5.sql
:r .\Data\OneTime\Meyer\Sources.Section.Part.6.sql
:r .\Data\OneTime\Meyer\Sources.Section.Part.7.sql

--:r .\Data\OneTime\Meyer\Sources.SectionWeaponMap.1.sql
:r .\Data\OneTime\Meyer\Interpretations.Play.1.sql
:r .\Data\OneTime\Meyer\Interpretations.PlayStep.1.sql




---- System Users

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