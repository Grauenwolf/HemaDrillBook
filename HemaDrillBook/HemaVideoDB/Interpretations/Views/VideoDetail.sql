CREATE VIEW Interpretations.VideoDetail
AS
SELECT v.VideoKey,
       v.SectionKey,
       v.VideoServiceVideoId,
       v.Url,
       v.StartTime,
       v.CreatedByUserKey,
       v.CreatedDate,
       s.BookKey,
       v.VideoServiceKey,
       vs.VideoServiceName,
       vs.VideoServiceUrlFormat,
       vs.VideoServiceEmbedFormat,
	   v.Description,
	   v.Author
FROM Interpretations.Video v
    INNER JOIN Sources.Section s
        ON s.SectionKey = v.SectionKey
    INNER JOIN Interpretations.VideoService vs
        ON vs.VideoServiceKey = v.VideoServiceKey;
