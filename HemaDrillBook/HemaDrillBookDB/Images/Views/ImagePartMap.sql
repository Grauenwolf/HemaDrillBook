CREATE VIEW Images.ImagePartMap
WITH SCHEMABINDING
AS
SELECT DISTINCT
       id.ImageKey,
       id.ImageName,
       id.FileName,
       id.FileSize,
       id.CreatedByUserKey,
       id.CreatedDate,
       id.ModifiedByUserKey,
       id.ModifiedDate,
       id.FileType,
       id.StorageFileName,
       id.ImageSetName,
       id.CopyrightHolder,
       id.Copyright,
       sd.PartKey,
       sd.PartSlug,
       sd.BookSlug
FROM Images.ImageDetail id
    INNER JOIN Images.ImageSectionMap ism
        ON id.ImageKey = ism.ImageKey
    INNER JOIN Sources.SectionDetail sd
        ON ism.SectionKey = sd.SectionKey;
GO

GRANT SELECT ON Images.ImagePartMap TO HemaWeb;
