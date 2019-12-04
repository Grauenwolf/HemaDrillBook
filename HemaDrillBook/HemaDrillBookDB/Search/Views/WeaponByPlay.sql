CREATE VIEW Search.WeaponByPlay
WITH SCHEMABINDING
AS
SELECT DISTINCT
       swmd.PrimaryWeaponKey,
       swmd.SecondaryWeaponKey,
       swmd.PrimaryWeaponName,
       swmd.SecondaryWeaponName,
       p.PlayKey
FROM Sources.SectionWeaponMapDetail swmd
    INNER JOIN Interpretations.Play p
        ON swmd.SectionKey = p.SectionKey;
GO
GRANT SELECT ON Search.WeaponByPlay TO HemaWeb;
