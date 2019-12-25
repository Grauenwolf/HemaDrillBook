CREATE VIEW Images.ImageSectionMapDetail
WITH SCHEMABINDING
AS
SELECT ism.ImageKey,
       ism.SectionKey,
       ism.IsPrimaryImage,
       id.ImageName,
       id.FileName,
       id.FileSize,
       id.FileType,
       id.StorageFileName,
       id.ImageSetName,
       id.CopyrightHolder,
       id.Copyright,
       sd.BookSlug,
       sd.PageReference,
       sd.PartSlug,
       sd.SectionName,
       sd.SectionSlug
FROM Images.ImageSectionMap ism
    INNER JOIN Images.ImageDetail id
        ON ism.ImageKey = id.ImageKey
    INNER JOIN Sources.SectionDetail sd
        ON ism.SectionKey = sd.SectionKey;
GO

GRANT SELECT ON Images.ImageSectionMapDetail TO HemaWeb;


