IF $(OneTimeLoad) = 1
BEGIN

DECLARE @Section TABLE
(
SectionKey int NOT NULL PRIMARY KEY,
PartKey int NOT NULL,
ParentSectionKey int NULL,
SectionName nvarchar(250) NOT NULL,
PageReference nvarchar(50) NULL,
DisplayOrder float NOT NULL,
SectionSlug varchar(50) NULL UNIQUE

);

INSERT INTO @Section
(  SectionKey,
PartKey,
ParentSectionKey,
SectionName,
PageReference,
DisplayOrder,
SectionSlug )
VALUES
(1804, 7, NULL, N'Postures or Guards', NULL, 13, 'Postures-or-Guards'),
(1805, 7, 1804, N'Oberhut (High Guard)', NULL, 1, 'Oberhut'),
(1806, 7, 1804, N'Mittelhut (Middle Guard)', NULL, 2, 'Mittelhut'),
(1807, 7, 1804, N'Gerade Versatzung (Straight Parrying)', NULL, 3, 'Gerade-Versatzung'),
(1808, 7, 1804, N'Nebehut (Side Guard)', NULL, 4, 'Nebehut'),
(1809, 7, 1804, N'Wechsel (Change Guard)', NULL, 5, 'Wechsel'),
(1810, 7, 1804, N'Oberhut zum StoB (High Guard for the Thrust)', NULL, 6, 'Oberhut-zum-StoB'),
(1811, 7, 1804, N'Underhut (Low Guard)', NULL, 7, 'Underhut'),
(1812, 7, 1804, N'Dempffhut (Suppressing Guard)', NULL, 8, 'Dempffhut'),
(1813, 7, NULL, N'Concerning Thrusts, and how you shall carry them out fluidly in the work', NULL, 14, 'Thrusts'),
(1814, 7, 1813, N'Device 1', N'3.40r.1', 1, 'Thrusts-1'),
(1815, 7, 1813, N'Device 2', N'3.40v.1', 2, 'Thrusts-2'),
(1816, 7, NULL, N'Fighting from the Oberhut (High Guard)', NULL, 15, 'Fighting-Oberhut'),
(1817, 7, 1816, N'Oberhut 1', N'3.40v.2', 1, 'Oberhut-1'),
(1818, 7, 1816, N'Oberhut 2', N'3.41r.1', 2, 'Oberhut-2'),
(1819, 7, NULL, N'Fighting from the Underhut (Low Guard)', NULL, 16, 'Fighting-Underhut'),
(1820, 7, 1819, N'Underhut 1', N'3.41r.3', 1, 'Underhut-1'),
(1821, 7, NULL, N'Working in the Before', NULL, 17, 'Vor'),
(1822, 7, 1821, N'Device 1', N'3.41r.3', 1, 'Vor-1'),
(1823, 7, 1821, N'Device 2', N'3.41r.4', 2, 'Vor-2'),
(1824, 7, 1821, N'Device 3', N'3.41v.2', 3, 'Vor-3'),
(1825, 7, NULL, N'Mittelhut (Middle Guard)', NULL, 18, 'Devices-Mittelhut'),
(1826, 7, 1825, N'Mittelhut 1', N'3.41v.3', 1, 'Mittelhut-1'),
(1827, 7, 1825, N'Mittelhut 2', N'3.41v.4', 2, 'Mittelhut-2'),
(1828, 7, 1825, N'Mittelhut 3', N'3.41v.5', 3, 'Mittelhut-3'),
(1829, 7, NULL, N'Dempffhut (Suppressing Guard)', NULL, 19, 'Devices-Dempffhut'),
(1830, 7, 1829, N'Dempffhut 1', N'3.41v.6', 1, 'Dempffhut-1'),
(1831, 7, 1829, N'Dempffhut 2', N'3.42v.1', 2, 'Dempffhut-2'),
(1832, 7, 1829, N'Dempffhut 3', N'3.42v.2', 3, 'Dempffhut-3'),
(1833, 7, NULL, N'Nebenhut (Side Guard)', NULL, 20, 'Devices-Nebenhut'),
(1834, 7, 1833, N'Nebenhut 1', N'3.42v.3', 1, 'Nebenhut-1'),
(1835, 7, 1833, N'Nebenhut 2', N'3.42r.1', 2, 'Nebenhut-2'),
(1836, 7, 1833, N'Nebenhut 3', N'3.43r.2', 3, 'Nebenhut-3'),
(1837, 7, 1833, N'Nebenhut 4', N'3.43r.3', 4, 'Nebenhut-4'),
(1838, 7, NULL, N'Counters for the Postures in the Pike, along with other shrewd devices', NULL, 21, 'Counters'),
(1839, 7, 1838, N'Device 1', N'3.43r.4', 1, 'Counter-1'),
(1840, 7, 1838, N'Device 2', N'3.43v.1', 2, 'Counter-2'),
(1841, 7, 1838, N'Device 3', N'3.43v.2', 3, 'Counter-3'),
(1842, 7, 1838, N'Device 4', N'3.43v.3', 4, 'Counter-4'),
(1843, 7, 1838, N'Device 5', N'3.43v.4', 5, 'Counter-5'),
(1844, 7, 1838, N'Device 6', N'3.43v.5', 6, 'Counter-6'),
(1845, 7, NULL, N'Precept 1', N'3.44v', 22, 'Precept-1'),
(1846, 7, 1845, N'Device 1', N'3.44v', 1, 'Precept-1-1'),
(1847, 7, 1845, N'Device 2', N'3.44v.1', 2, 'Precept-1-2'),
(1848, 7, 1845, N'Device 3', N'3.44v.2', 3, 'Precept-1-3'),
(1849, 7, 1845, N'Device 4', N'3.44v.3', 4, 'Precept-1-4'),
(1850, 7, 1845, N'Device 5', N'3.44v.4', 5, 'Precept-1-5'),
(1851, 7, 1845, N'Device 6', N'3.45r.1', 6, 'Precept-1-6'),
(1852, 7, NULL, N'Precept 2', N'3.45r.2', 23, 'Precept-2'),
(1853, 7, 1852, N'Device 1', N'3.45r.2', 1, 'Precept-2-1'),
(1854, 7, 1852, N'Device 2', N'3.45r.3', 2, 'Precept-2-2'),
(1855, 7, 1852, N'Device 3', N'3.45r.4', 3, 'Precept-2-3'),
(1856, 7, 1852, N'Device 4', N'3.45v.1', 4, 'Precept-2-4'),
(1857, 7, 1852, N'Device 5', N'3.45v.2', 5, 'Precept-2-5'),
(1858, 7, NULL, N'Running In', NULL, 24, 'Running-In'),
(1859, 7, 1858, N'Running In 1', N'3.46r.1', 1, 'Running-In-1'),
(1860, 7, 1858, N'Running In 2', N'3.46r.2', 2, 'Running-In-2'),
(1861, 7, NULL, N'A brief lesson in how to use your pike in earnest cases...', NULL, 25, 'Earnest'),
(1862, 7, 1861, N'Device 1', N'3.46v.1', 1, 'Earnest-1'),
(1863, 7, 1861, N'Device 2', N'3.47r.1', 2, 'Earnest-2'),
(1864, 7, 1861, N'Device 3', N'3.47r.2', 3, 'Earnest-3'),
(1865, 7, 1861, N'Device 4', N'3.47r.3', 4, 'Earnest-4');


MERGE INTO Sources.Section t
USING @Section s
ON t.SectionKey = s.SectionKey
WHEN NOT MATCHED THEN
    INSERT
(  SectionKey,
PartKey,
ParentSectionKey,
SectionName,
PageReference,
DisplayOrder,
SectionSlug )
    VALUES
    (  s.SectionKey,
s.PartKey,
s.ParentSectionKey,
s.SectionName,
s.PageReference,
s.DisplayOrder,
s.SectionSlug )
WHEN MATCHED THEN
    UPDATE SET  PartKey = s.PartKey,
ParentSectionKey = s.ParentSectionKey,
SectionName = s.SectionName,
PageReference = s.PageReference,
DisplayOrder = s.DisplayOrder,
SectionSlug = s.SectionSlug;


END
GO
