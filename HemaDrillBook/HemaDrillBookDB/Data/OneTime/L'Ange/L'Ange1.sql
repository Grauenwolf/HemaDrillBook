INSERT INTO Sources.Book
(
    BookKey,
    BookName,
    BookSlug,
    Notes,
    WiktenauerUrl
)
VALUES
(10, N'Lessons on the Thrust', 'L''Ange', NULL, N'https://wiktenauer.com/wiki/Jean_Daniel_L%27Ange');

GO


INSERT INTO Sources.AlternateBookName
(
    BookKey,
    AlternateBookName
)
VALUES
(   10, -- BookKey - int
    N'A Clear and Thorough Explanation of the Noble, Chivalric, and Free Art of Fencing'),
(   10, -- BookKey - int
    N'Deutliche und grůndliche Erklårung der Adelichen und Ritterlichen freyen Fecht-Kunst');

GO


INSERT INTO Sources.Part
(
    PartKey,
    BookKey,
    PartName,
    DisplayOrder,
    PartSlug
)
VALUES
(28, 10, N'Main Text', 1, 'Main'),
(29, 10, N'Extras', 2, 'Extras');


GO

SET IDENTITY_INSERT Sources.Section ON;
INSERT INTO Sources.Section
(
    SectionKey,
    PartKey,
    ParentSectionKey,
    SectionName,
    PageReference,
    DisplayOrder,
    SectionSlug
)
VALUES
(10901, 29, NULL, N'History', NULL, 1, 'History'),
(10902, 29, NULL, N'Weapons and Equipment', NULL, 2, 'Weapons-and-Equipment'),
(10903, 29, NULL, N'General Discussion', NULL, 3, 'General-Discussion'),
(10904, 29, NULL, N'Misc. Drills and Lessons', NULL, 4, 'Misc.-Drills-and-Lessons');
SET IDENTITY_INSERT Sources.Section OFF;
GO



INSERT INTO Sources.Author
(
    AuthorKey,
    AuthorName,
    AuthorSlug
)
VALUES
(   10,                     -- AuthorKey - int
    N'Jean Daniel L''Ange', -- AuthorName - nvarchar(500)
    'L''Ange');

GO



INSERT INTO Sources.BookAuthorMap
(
    BookKey,
    AuthorKey,
    DisplayOrder
)
VALUES
(   10, -- BookKey - int
    10, -- AuthorKey - int
    1);
GO

SET IDENTITY_INSERT Images.ImageSet ON
INSERT INTO Images.ImageSet
(
    ImageSetKey, 
	ImageSetName,
    PartKey,
    CopyrightHolder,
    Copyright,
    CreatedByUserKey,
    ModifiedByUserKey
)
VALUES
(   1,
	N'L''Ange',           -- ImageSetName - nvarchar(50)
    28,             -- PartKey - int,
	N'Göttingen State and University Library',
    N'The Göttingen State and University Library provides access to digitized documents strictly for noncommercial
educational, research and private purposes and makes no warranty with regard to their use for other
purposes. Some of our collections are protected by copyright. Publication and/or broadcast in any form
(including electronic) requires prior written permission from the Goettingen State- and University Library.
Each copy of any part of this document must contain there Terms and Conditions. With the usage of the
library''s online system to access or download a digitized document you accept there Terms and Conditions.
Reproductions of material on the web site may not be made for or donated to other repositories, nor may be
further reproduced without written permission from the Goettingen State- and University Library
For reproduction requests and permissions, please contact us. If citing materials, please
give proper attribution of the source.

Contact:
Niedersächsische Staats- und Universitätsbibliothek
Digitalisierungszentrum
37070 Goettingen
Germany
Email: gdz@sub.uni-goettingen.de
 
Purchase a CD-ROM
The Goettingen State and University Library offers CD-ROMs containing whole volumes / monographs in PDF
for Adobe Acrobat. The PDF-version contains the table of contents as bookmarks, which allows easy
navigation in the document. For availability and pricing, please contact:
Niedersaechisische Staats- und Universitaetsbibliothek Goettingen - Digitalisierungszentrum',           -- Copyright - nvarchar(max)
    -1,             -- CreatedByUserKey - int
    -1
    )

SET IDENTITY_INSERT Images.ImageSet OFF

