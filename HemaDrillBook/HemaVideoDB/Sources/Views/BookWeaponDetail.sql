CREATE VIEW Sources.BookWeaponDetail
AS
SELECT DISTINCT
       b.BookKey,
       b.BookName,
       swm.PrimaryWeaponKey,
       w1.WeaponName AS PrimaryWeaponName,
       swm.SecondaryWeaponKey,
       w2.WeaponName AS SecondaryWeaponName
FROM Sources.Section s
	INNER JOIN Sources.SectionWeaponMap swm ON s.SectionKey = swm.SectionKey
    INNER JOIN Tags.Weapon w1
        ON w1.WeaponKey = swm.PrimaryWeaponKey
    LEFT JOIN Tags.Weapon w2
        ON w2.WeaponKey = swm.SecondaryWeaponKey
    INNER JOIN Sources.Book b
        ON b.BookKey = s.BookKey;
GO
GRANT SELECT ON Sources.BookWeaponDetail TO HemaWeb;