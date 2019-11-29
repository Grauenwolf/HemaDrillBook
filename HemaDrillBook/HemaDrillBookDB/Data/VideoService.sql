BEGIN

DECLARE @VideoService TABLE
(
VideoServiceKey int NOT NULL PRIMARY KEY,
VideoServiceName varchar(50) NOT NULL,
VideoServiceUrlFormat varchar(500) NULL,
VideoServiceEmbedFormat varchar(500) NULL

);

INSERT INTO @VideoService
(  VideoServiceKey,
VideoServiceName,
VideoServiceUrlFormat,
VideoServiceEmbedFormat )
VALUES

(0, 'Custom', NULL, NULL),
(1, 'YouTube', NULL, NULL),
(2, 'Vimeo', NULL, NULL)

;


MERGE INTO Interpretations.VideoService t
USING @VideoService s
ON t.VideoServiceKey = s.VideoServiceKey
WHEN NOT MATCHED THEN
    INSERT
(  VideoServiceKey,
VideoServiceName,
VideoServiceUrlFormat,
VideoServiceEmbedFormat )
    VALUES
    (  s.VideoServiceKey,
s.VideoServiceName,
s.VideoServiceUrlFormat,
s.VideoServiceEmbedFormat )
WHEN MATCHED THEN
    UPDATE SET  VideoServiceName = s.VideoServiceName,
VideoServiceUrlFormat = s.VideoServiceUrlFormat,
VideoServiceEmbedFormat = s.VideoServiceEmbedFormat;

END;
GO
