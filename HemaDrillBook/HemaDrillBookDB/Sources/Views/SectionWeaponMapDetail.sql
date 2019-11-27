CREATE VIEW Sources.SectionWeaponMapDetail
WITH SCHEMABINDING
AS
SELECT swm.SectionWeaponMapKey,
       swm.SectionKey,
       swm.PrimaryWeaponKey,
       swm.SecondaryWeaponKey,
       s.SectionName,
	   s.PartKey,
       w1.WeaponName AS PrimaryWeaponName,
       w2.WeaponName AS SecondaryWeaponName
FROM Sources.SectionWeaponMap swm
    INNER JOIN Sources.Section s
        ON s.SectionKey = swm.SectionKey
    INNER JOIN Tags.Weapon w1
        ON w1.WeaponKey = swm.PrimaryWeaponKey
    LEFT JOIN Tags.Weapon w2
        ON w2.WeaponKey = swm.SecondaryWeaponKey;



GO
GRANT SELECT ON Sources.SectionWeaponMapDetail TO HemaWeb;