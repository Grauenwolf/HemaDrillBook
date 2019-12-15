CREATE VIEW Interpretations.CommentaryDetail
WITH SCHEMABINDING
AS
SELECT c.SectionKey,
       c.UserKey,
       c.PublicNotes,
       c.PrivateNotes,
       c.CreatedDate,
       ISNULL(anu.DisplayName, anu.UserName) AS DisplayName,
       c.SysStartTime AS ModifiedDate,
       sd.PartKey,
       sd.BookKey
FROM Interpretations.Commentary c
    INNER JOIN Accounts.AspNetUsers anu
        ON c.UserKey = anu.UserKey
    INNER JOIN Sources.SectionDetail sd
        ON c.SectionKey = sd.SectionKey;

GO
GRANT SELECT ON Interpretations.CommentaryDetail TO HemaWeb;
