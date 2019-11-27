IF $(OneTimeLoad) = 1
BEGIN

DECLARE @Book TABLE
(
    BookKey INT NOT NULL PRIMARY KEY,
    BookName NVARCHAR(500) NOT NULL,
    AlternateBookName NVARCHAR(500) NULL,
    BookSlug VARCHAR(50) NOT NULL,
    Notes NVARCHAR(MAX) NULL,
    WiktenauerUrl NVARCHAR(300) NULL
);

INSERT INTO @Book
(
    BookKey,
    BookName,
    AlternateBookName,
    BookSlug,
    Notes,
    WiktenauerUrl
)
VALUES
--(-1, N'Test', N'You can use this for testing.', 'Test', NULL, NULL),
(1, N'A Thorough Description of the Art of Fencing', N'Gründtliche Beschreibung der Kunst des Fechtens', 'Meyer1570',
 NULL, N'http://wiktenauer.com/wiki/Joachim_Meyer'),
(2, N'MS I.33', N'Walpurgis Fechtbuch', 'MSI.33', NULL, N'http://wiktenauer.com/wiki/Walpurgis_Fechtbuch_(MS_I.33)'),
(3, N'Memorial Da Prattica do Montante', N'Memorial of the Practice of the Montante', 'Figueyredo-Montante', NULL,
 N'http://wiktenauer.com/wiki/Diogo_Gomes_de_Figueyredo'),
(4, N'On the Montante', NULL, 'Viedma', NULL, NULL),
(5, N'Opera Nova', NULL, 'Manciolino', NULL, N'http://wiktenauer.com/wiki/Antonio_Manciolino'),
(6, N'Dell''Arte di Scrima Libri Tre', N'Three Books on the Art of Defense', 'dall''Agocchie', NULL,
 N'http://wiktenauer.com/wiki/Giovanni_dall%27Agocchie'),
(7, N'Lo Schermo, overo Scienza d’Arme', N'On Fencing, or the Science of Arms', 'Fabris', NULL,
 N'http://wiktenauer.com/wiki/Salvator_Fabris'),
(9, N'Flower of Battle (Wiktenauer Completed Translation)', NULL, 'Fiore                                             ',
 N'This index uses the verse numbers found in the Getty/PD Completed Translation found on Wiktenauer. Other numbering systems are found in parens. G:Getty, GE:Getty Exiles Translation',
 NULL);


MERGE INTO Sources.Book t
USING @Book s
ON t.BookKey = s.BookKey
WHEN NOT MATCHED THEN
    INSERT
    (
        BookKey,
        BookName,
        AlternateBookName,
        BookSlug,
        Notes,
        WiktenauerUrl
    )
    VALUES
    (s.BookKey, s.BookName, s.AlternateBookName, s.BookSlug, s.Notes, s.WiktenauerUrl)
WHEN MATCHED THEN
    UPDATE SET BookName = s.BookName,
               AlternateBookName = s.AlternateBookName,
               BookSlug = s.BookSlug,
               Notes = s.Notes,
               WiktenauerUrl = s.WiktenauerUrl;


END
GO
