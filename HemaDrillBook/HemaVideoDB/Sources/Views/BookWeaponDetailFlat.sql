CREATE VIEW Sources.BookWeaponDetailFlat
AS
SELECT DISTINCT
       A.BookKey,
       A.WeaponKey,
       A.WeaponName,
	   b.BookName
FROM
(
    SELECT s.BookKey,
           w.WeaponKey,
           w.WeaponName
    FROM Sources.Section s
	INNER JOIN Sources.SectionWeaponMap swm ON s.SectionKey = swm.SectionKey
        INNER JOIN Tags.Weapon w
            ON w.WeaponKey = swm.PrimaryWeaponKey
    UNION
    SELECT s.BookKey,
           w.WeaponKey,
           w.WeaponName
    FROM Sources.Section s
	INNER JOIN Sources.SectionWeaponMap swm ON s.SectionKey = swm.SectionKey
        INNER JOIN Tags.Weapon w
            ON w.WeaponKey = swm.SecondaryWeaponKey
) A
INNER JOIN Sources.Book b ON b.BookKey = A.BookKey
;
