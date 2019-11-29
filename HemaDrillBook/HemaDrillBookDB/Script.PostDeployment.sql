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

-- System Users
:r .\Data\SystemUsers.SQL
:r .\Data\VideoService.sql

--Tags
:r .\Data\OneTime\Tags.Weapon.sql
:r .\Data\OneTime\Tags.Guard.sql
:r .\Data\OneTime\Tags.Footwork.sql
:r .\Data\OneTime\Tags.Measure.sql
:r .\Data\OneTime\Tags.GuardModifier.sql
:r .\Data\OneTime\Tags.Target.sql
:r .\Data\OneTime\Tags.Technique.sql


--Meyer
:r .\Data\OneTime\Meyer\Sources.Book.sql
:r .\Data\OneTime\Meyer\Sources.Part.sql
:r .\Data\OneTime\Meyer\Sources.Section.Part.1.sql
:r .\Data\OneTime\Meyer\Sources.Section.Part.2.sql
:r .\Data\OneTime\Meyer\Sources.Section.Part.3.sql
:r .\Data\OneTime\Meyer\Sources.Section.Part.4.sql
:r .\Data\OneTime\Meyer\Sources.Section.Part.5.sql
:r .\Data\OneTime\Meyer\Sources.Section.Part.6.sql
:r .\Data\OneTime\Meyer\Sources.Section.Part.7.sql
:r .\Data\OneTime\Meyer\Sources.SectionWeaponMap.1.sql
--:r .\Data\OneTime\Meyer\Sources.SectionWeaponMap.1.sql
:r .\Data\OneTime\Meyer\Interpretations.Play.1.sql
:r .\Data\OneTime\Meyer\Interpretations.PlayStep.1.sql
:r .\Data\OneTime\Meyer\Interpretations.Video.1.sql





