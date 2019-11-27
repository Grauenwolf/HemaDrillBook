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

(1706, 5, NULL, N'Postures or Guards', NULL, 1, 'Guards'),
(1707, 5, 1706, N'Oberhut (High Guard)', NULL, 1, 'Oberhut'),
(1708, 5, 1706, N'Underhut (Low Guard)', NULL, 2, 'Underhut'),
(1709, 5, 1706, N'Nebenhut (Side Guard)', NULL, 3, 'Nebenhut'),
(1710, 5, 1706, N'Mittelhut (Middle Guard)', NULL, 4, 'Mittelhut'),
(1711, 5, 1706, N'Steurhut (Rudder Guard)', NULL, 5, 'Steurhut'),
(1712, 5, 1706, N'Concerning Binding and the Parryings of the Staff and their Classifications', NULL, 6, 'Binding'),
(1713, 5, NULL, N'Devices from the Oberhut (High Guard)', NULL, 2, 'Devices-Oberhut'),
(1714, 5, 1713, N'Oberhut Device 1', N'3.18r.1', 1, 'Oberhut-1'),
(1715, 5, 1713, N'Oberhut Device 2', N'3.18r.2', 2, 'Oberhut-2'),
(1716, 5, 1713, N'Oberhut Device 3', N'3.18v.1', 3, 'Oberhut-3'),
(1717, 5, 1713, N'Oberhut Device 4', N'3.18v.2', 4, 'Oberhut-4'),
(1718, 5, NULL, N'Devices from the Underhut (Low Guard)', NULL, 3, 'Devices-Underhut'),
(1719, 5, 1718, N'Underhut Device 1', N'3.19r.1', 1, 'Underhut-1'),
(1720, 5, 1718, N'Underhut Device 2', N'3.19v.1', 2, 'Underhut-2'),
(1721, 5, 1718, N'Underhut Device 3', N'3.19v.2', 3, 'Underhut-3'),
(1722, 5, 1718, N'Underhut Device 4', N'3.20r.1', 4, 'Underhut-4'),
(1723, 5, 1718, N'Underhut Device 5', N'3.20r.2', 5, 'Underhut-5'),
(1724, 5, 1718, N'Underhut Device 6', N'3.20v.1', 6, 'Underhut-6'),
(1725, 5, 1718, N'Underhut Device 7', N'3.20v.2', 7, 'Underhut-7'),
(1726, 5, NULL, N'Devices from the MIttelhut (Middle Guard)', NULL, 4, 'Devices-MIttelhut'),
(1727, 5, 1726, N'Mittelhut Device 1', N'3.21r.1', 1, 'Mittelhut-1'),
(1728, 5, 1726, N'Mittelhut Device 2', N'3.21v.1', 2, 'Mittelhut-2'),
(1729, 5, 1726, N'Mittelhut Device 3', N'3.21v.2', 3, 'Mittelhut-3'),
(1730, 5, NULL, N'Devices from the Gerade Versatzung (Straight Parrying)', NULL, 5, 'Devices-Gerade-Versatzung'),
(1731, 5, 1730, N'Gerade Versatzung Device 1', N'3.22v.1', 1, 'Gerade-Versatzung-1'),
(1732, 5, 1730, N'Gerade Versatzung Device 2', N'3.23r.1', 2, 'Gerade-Versatzung-2'),
(1733, 5, 1730, N'Gerade Versatzung Device 3', N'3.23r.2', 3, 'Gerade-Versatzung-3'),
(1734, 5, 1730, N'Gerade Versatzung Device 4', N'3.23v.1', 4, 'Gerade-Versatzung-4'),
(1735, 5, 1730, N'Gerade Versatzung Device 5', N'3.23v.2', 5, 'Gerade-Versatzung-5'),
(1736, 5, 1730, N'Gerade Versatzung Device 6', N'3.24r.1', 6, 'Gerade-Versatzung-6'),
(1737, 5, 1730, N'Gerade Versatzung Device 7', N'3.24r.2', 7, 'Gerade-Versatzung-7'),
(1738, 5, 1730, N'Gerade Versatzung Device 8', N'3.25r.1', 8, 'Gerade-Versatzung-8'),
(1739, 5, 1730, N'Gerade Versatzung Device 9', N'3.25r.2', 9, 'Gerade-Versatzung-9'),
(1740, 5, 1730, N'Gerade Versatzung Device 10', N'3.25v.1', 10, 'Gerade-Versatzung-10'),
(1741, 5, 1730, N'Gerade Versatzung Device 11', N'3.25v.2', 11, 'Gerade-Versatzung-11'),
(1742, 5, NULL, N'Deceitful Devices/Pulling/Winding/Driving', NULL, 6, 'Deceitful-Devices/Pulling/Winding/Driving'),
(1743, 5, 1742, N'A Deceitful Device 1', N'3.26r.1', 1, 'Deceitful-1'),
(1744, 5, 1742, N'A Deceitful Device 2', N'3.26r.2', 2, 'Deceitful-2'),
(1745, 5, 1742, N'How you shall thrust with one hand...', N'3.26r.3', 3, 'Thrust-one-hand'),
(1746, 5, 1742, N'Another in which you shall wind...', N'3.26v.1', 4, 'Another-in-which-you-shall-wind...'),
(1747, 5, 1742, N'An artful and shrewd thrust to use...', N'3.26v.2', 5, 'An-artful-and-shrewd-thrust-to-use...'),
(1748, 5, 1742, N'Another in which you shall deliver a thrust...', N'3.27r.1', 6, 'Another-in-which-you-shall-deliver-a-thrust...'),
(1749, 5, 1742, N'Another how you shall thrust before him...', N'3.27v.1', 7, 'Another-how-you-shall-thrust-before-him...'),
(1750, 5, 1742, N'A good stroke in which you turn around', N'3.27v.2', 8, 'A-good-stroke-in-which-you-turn-around'),
(1751, 5, 1742, N'Another with a Middle Blow', N'3.28v.1', 9, 'Another-with-a-Middle-Blow'),
(1752, 5, 1742, N'Pulling the Thrusts 1', N'3.28v.2', 10, 'Pulling-the-Thrusts-1'),
(1753, 5, 1742, N'Pulling the Thrusts 2', N'3.29r.1', 11, 'Pulling-the-Thrusts-2'),
(1754, 5, 1742, N'Pulling the Thrusts 3', N'3.29r.2', 12, 'Pulling-the-Thrusts-3'),
(1755, 5, 1742, N'Winding 1', N'3.29v.1', 13, 'Winding-1'),
(1756, 5, 1742, N'Winding 2', N'3.29v.2', 14, 'Winding-2'),
(1757, 5, 1742, N'Winding 3', N'3.30r.1', 15, 'Winding-3'),
(1758, 5, 1742, N'Winding 4', N'3.30r.2', 16, 'Winding-4'),
(1759, 5, 1742, N'A taking of the Staff', N'3.30r.3', 17, 'A-taking-of-the-Staff'),
(1760, 5, 1742, N'Driving 1', N'3.30v.1', 18, 'Driving-1'),
(1761, 5, 1742, N'Driving 2', N'3.30v.2', 19, 'Driving-2'),
(1762, 5, 1742, N'Another one in which you go through', N'3.31r.1', 20, 'Another-one-in-which-you-go-through')


;


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
