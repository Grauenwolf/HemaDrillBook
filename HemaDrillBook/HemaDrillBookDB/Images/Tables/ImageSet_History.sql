CREATE TABLE Images.ImageSet_History
(
    ImageSetKey INT NOT NULL,
    ImageSetName NVARCHAR(50) NOT NULL,
    PartKey INT NOT NULL,
    CopyrightHolder NVARCHAR(100) NULL,
    Copyright NVARCHAR(MAX) NULL,
    CreatedByUserKey INT NOT NULL,
    CreatedDate DATETIME2 NOT NULL,
    ModifiedByUserKey INT NOT NULL,
    SysStartTime DATETIME2 NOT NULL,
    SysEndTime DATETIME2 NOT NULL
);
GO
CREATE CLUSTERED INDEX ix_ImageSet_History
ON Images.ImageSet_History (
                               SysEndTime,
                               SysStartTime
                           );
GO
