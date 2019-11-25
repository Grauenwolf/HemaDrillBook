CREATE PROCEDURE Sources.AddWeaponsForSection
    @SectionKey INT,
    @PrimaryWeaponKey INT,
    @SecondaryWeaponKey INT = NULL
AS
SET NOCOUNT ON;

DECLARE @Map TABLE
(
    SectionKey INT NOT NULL,
    PrimaryWeaponKey INT NOT NULL,
    SecondaryWeaponKey INT NULL
);

INSERT INTO @Map
(
    SectionKey,
    PrimaryWeaponKey,
    SecondaryWeaponKey
)
SELECT SectionKey,
       @PrimaryWeaponKey,
       @SecondaryWeaponKey
FROM Sources.SubsectionsFor(@SectionKey);

MERGE INTO Sources.SectionWeaponMap AS t
USING @Map AS s
ON t.SectionKey = s.SectionKey
   AND t.PrimaryWeaponKey = s.PrimaryWeaponKey
   AND (ISNULL(t.SecondaryWeaponKey, -1) = ISNULL(s.SecondaryWeaponKey, -1))
WHEN NOT MATCHED THEN
    INSERT
    (
        SectionKey,
        PrimaryWeaponKey,
        SecondaryWeaponKey
    )
    VALUES
    (s.SectionKey, s.PrimaryWeaponKey, s.SecondaryWeaponKey);
RETURN 0;
