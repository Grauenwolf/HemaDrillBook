CREATE VIEW Images.ImageDetail
AS
SELECT i.ImageKey,
       i.ImageName,
       i.FileName,
       i.FileSize,
       i.CreatedByUserKey,
       i.CreatedDate,
       i.ModifiedByUserKey,
       i.SysStartTime AS ModifiedDate,
       (RIGHT(i.FileName, CHARINDEX('.', REVERSE(i.FileName)) - 1)) AS FileType,
       CONVERT(NVARCHAR(10), i.ImageKey) + '_' + i.FileName AS StorageFileName,
	   ise.ImageSetName,
	   ise.Copyright
FROM Images.Image i
    LEFT JOIN Images.ImageSet ise
        ON i.ImageSetKey = ise.ImageSetKey;
GO

GRANT SELECT ON Images.ImageDetail TO HemaWeb;


