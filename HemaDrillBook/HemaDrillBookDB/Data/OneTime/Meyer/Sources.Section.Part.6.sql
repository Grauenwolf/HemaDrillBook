IF $(OneTimeLoad) = 1
BEGIN

DECLARE @Section TABLE
(
    SectionKey INT NOT NULL PRIMARY KEY,
    PartKey INT NOT NULL,
    ParentSectionKey INT NULL,
    SectionName NVARCHAR(250) NOT NULL,
    PageReference NVARCHAR(50) NULL,
    DisplayOrder FLOAT NOT NULL,
    SectionSlug VARCHAR(50) NULL
        UNIQUE
);

INSERT INTO @Section
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
(1767, 6, NULL, N'The Oberhauw (High Cut)', NULL, 7, 'Oberhauw'),
(1768, 6, 1767, N'The First Device with the High Cut', N'3.33r.1', 1, 'Oberhauw-1'),
(1769, 6, 1767, N'The Second Device with the High Cut', N'3.33r.2', 2, 'Oberhauw-2'),
(1770, 6, 1767, N'Another with this High Cut', N'3.34r.1', 3, 'Oberhauw-3'),
(1771, 6, NULL, N'The Underhauw (Low Cut)', NULL, 8, 'Underhauw'),
(1772, 6, 1771, N'With the Low Cut', N'3.34r.2', 1, 'Underhauw-1'),
(1773, 6, 1771, N'Another', N'3.34v.1', 2, 'Underhauw-2'),
(1774, 6, 1771, N'A device with the Mittlehut (Middle Cut)', N'3.34v.2', 3, 'Mittlehut'),
(1775, 6, NULL, N'Wrenching/Changing Through', NULL, 9, 'Wrenching'),
(1776, 6, 1775, N'Wrenching', N'3.35r.1', 1, 'Wrenching-1'),
(1777, 6, 1775, N'How you shall conduct yourself with Changing Through...', N'3.35r.2', 2, 'Wrenching-2'),
(1778, 6, 1775, N'Item, thrust in on one side...', N'3.35r.3', 3, 'Wrenching-3'),
(1779, 6, 1775, N'Or when are thrusting in...', N'3.35r.4', 4, 'Wrenching-4'),
(1780, 6, 1775, N'Further note when you have bound...', N'3.35r.5', 5, 'Wrenching-5'),
(1781, 6, 1775, N'If you stand before an opponent in the middle..', N'3.36r.1', 6, 'Wrenching-6'),
(1782, 6, NULL, N'How you shall plant your halberd in front on his neck', NULL, 10, 'Neck'),
(1783, 6, 1782, N'Position yourself with your halberd...', N'3.36r.2', 1, 'Neck-1'),
(1784, 6, 1782, N'Or when an opponent thrusts in at your right...', N'3.36r.3', 2, 'Neck-2'),
(1785, 6, 1782, N'In the Onset, see that you catch...', N'3.36r.4', 3, 'Neck-3'),
(1786, 6, 1782, N'If an opponent sends your halberd...', N'3.37r.1', 4, 'Neck-4'),
(1787, 6, 1782, N'When you stand with your left foot forward...', N'3.37r.2', 5, 'Neck-5'),
(1788, 6, 1782, N'Item, again cut a High Round Stroke...', N'3.37r.3', 6, 'Neck-6'),
(1789, 6, 1782, N'Also you shall particularly note...', N'3.37r.4', 7, 'Neck-7'),
(1790, 6, 1782, N'Item, thrust earnestly against his right...', N'3.37r.5', 8, 'Neck-8'),
(1791, 6, NULL, N'Some Counters against the Postures', NULL, 11, 'Counter'),
(1792, 6, 1791, N'Counter 1', N'3.38r.1', 1, 'Counter-1'),
(1793, 6, 1791, N'Counter 2', N'3.38r.2', 2, 'Counter-2'),
(1794, 6, 1791, N'Counter 3', N'3.38r.3', 3, 'Counter-3'),
(1795, 6, 1791, N'Counter 4', N'3.38r.4', 4, 'Counter-4'),
(1796, 6, 1791, N'Counter 5', N'3.38r.5', 5, 'Counter-5'),
(1797, 6, 1791, N'Counter 6', N'3.38r.6', 6, 'Counter-6'),
(1798, 6, 1791, N'Counter 7', N'3.38r.6', 7, 'Counter-7'),
(1799, 6, 1791, N'Counter 8', N'3.38v.1', 8, 'Counter-8'),
(1800, 6, NULL, N'A Wrath Cut', NULL, 12, 'Zornhauw'),
(1801, 6, 1800, N'Wrath Cut 1', N'3.38v.2', 1, 'Zornhauw-1'),
(1802, 6, 1800, N'Wrath Cut 2', N'3.38v.3', 2, 'Zornhauw-2'),
(1803, 6, 1800, N'Wrath Cut 3', N'3.38v.4', 3, 'Zornhauw-3'),
(1763, 6, NULL, N'Cross Cut from Above', N'3.32r.1', 21, 'Cross-Cut-Above'),
(1764, 6, NULL, N'Cross Cut from Below', N'3.32r.2', 22, 'Cross-Cut-Below'),
(1765, 6, NULL, N'Driving Diagonally through the opponent', N'3.32v.1', 23, 'Driving-1'),
(1766, 6, NULL, N'Another Driving', N'3.32v.2', 24, 'Driving-2');


MERGE INTO Sources.Section t
USING @Section s
ON t.SectionKey = s.SectionKey
WHEN NOT MATCHED THEN
    INSERT
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
    (s.SectionKey, s.PartKey, s.ParentSectionKey, s.SectionName, s.PageReference, s.DisplayOrder, s.SectionSlug)
WHEN MATCHED THEN
    UPDATE SET t.PartKey = s.PartKey,
               t.ParentSectionKey = s.ParentSectionKey,
               t.SectionName = s.SectionName,
               t.PageReference = s.PageReference,
               t.DisplayOrder = s.DisplayOrder,
               t.SectionSlug = s.SectionSlug;


END
GO
