CREATE TABLE Interpretations.VideoService
(
    VideoServiceKey INT NOT NULL PRIMARY KEY,
    VideoServiceName VARCHAR(50) NOT NULL,
    VideoServiceUrlFormat VARCHAR(500) NULL,
    VideoServiceEmbedFormat VARCHAR(500) NULL,
    SysStartTime DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    SysEndTime DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
    PERIOD FOR SYSTEM_TIME(SysStartTime, SysEndTime)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = Interpretations.VideoService_History) );
