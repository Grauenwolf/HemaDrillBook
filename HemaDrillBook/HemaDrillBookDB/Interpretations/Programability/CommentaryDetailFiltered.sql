CREATE FUNCTION Interpretations.CommentaryDetailFiltered
(
    @UserKey INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT cd.SectionKey,
           cd.UserKey,
           cd.PublicNotes,
           CASE
               WHEN (cd.UserKey = @UserKey) THEN
                   cd.PrivateNotes
               ELSE
                   NULL
           END AS PrivateNotes,
           cd.CreatedDate,
           cd.DisplayName,
		   cd.ModifiedDate
    FROM Interpretations.CommentaryDetail cd
    WHERE cd.PublicNotes IS NOT NULL
          OR (CASE
                  WHEN (cd.UserKey = @UserKey) THEN
                      cd.PrivateNotes
                  ELSE
                      NULL
              END
             ) IS NOT NULL
);
GO
GRANT SELECT ON Interpretations.CommentaryDetailFiltered TO HemaWeb;
