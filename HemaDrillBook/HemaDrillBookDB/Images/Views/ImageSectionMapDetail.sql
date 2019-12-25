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
       id.Copyright
FROM Images.ImageSectionMap ism
    INNER JOIN Images.ImageDetail id
        ON ism.ImageKey = id.ImageKey;
GO

GRANT SELECT ON Images.ImageSectionMapDetail TO HemaWeb;


