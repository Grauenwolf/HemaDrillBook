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
(1620, 4, NULL, N'Oberhut (High Guard)', NULL, 1, 'Oberhut'),
(1621, 4, 1620, N'Oberhut 1', N'3.1r.1', 1, 'Oberhut-1'),
(1622, 4, 1620, N'Oberhut 2', N'3.2r.1', 2, 'Oberhut-2'),
(1623, 4, NULL, N'Underhut (Low Guard)', NULL, 2, 'Underhut'),
(1624, 4, 1623, N'Underhut 1', N'3.2v.1', 1, 'Underhut-1'),
(1625, 4, 1623, N'Underhut 2', N'3.2v.2', 2, 'Underhut-2'),
(1626, 4, NULL, N'Chief Parries', NULL, 3, 'Chief-Parries'),
(1627, 4, 1626, N'Parry 1', N'3.3r.1', 1, 'Parry-1'),
(1628, 4, 1626, N'Parry 2', N'3.3r.2', 2, 'Parry-2'),
(1629, 4, 1626, N'Parry 3', N'3.3r.3', 3, 'Parry-3'),
(1630, 4, NULL, N'Kreutzhut (Cross Guard)', NULL, 4, 'Kreutzhut'),
(1631, 4, 1630, N'Kreutzhut 1', N'3.4r.1', 1, 'Kreutzhut-1'),
(1632, 4, 1630, N'Kreutzhut 2', N'3.4r.2', 2, 'Kreutzhut-2'),
(1633, 4, 1630, N'Kreutzhut 3', N'3.4r.3', 3, 'Kreutzhut-3'),
(1634, 4, 1630, N'Kreutzhut 4', N'3.4v.1', 4, 'Kreutzhut-4'),
(1635, 4, 1630, N'Kreutzhut 5', N'3.4v.2', 5, 'Kreutzhut-5'),
(1636, 4, 1630, N'Kreutzhut 6', N'3.4v.3	', 6, 'Kreutzhut-6'),
(1637, 4, NULL, N'Casting (Throwing)', NULL, 5, 'Casting'),
(1638, 4, 1637, N'Casting 1', N'3.5v.1', 1, 'Casting-1'),
(1639, 4, NULL, N'Disarms', NULL, 6, 'Disarms'),
(1640, 4, 1639, N'Disarm 1', N'3.5v.2', 1, 'Disarm-1'),
(1641, 4, 1639, N'Disarm 2', N'3.5v.3', 2, 'Disarm-2'),
(1642, 4, 1639, N'Disarm 3', N'3.5v.4', 3, 'Disarm-3'),
(1643, 4, 1639, N'Disarm 4 Counter', N'3.6r.1', 4, 'Disarm-4'),
(1644, 4, 1639, N'Disarm 5', N'3.6r.2', 5, 'Disarm-5'),
(1645, 4, 1639, N'Disarm 6', N'3.6r.3', 6, 'Disarm-6'),
(1646, 4, 1639, N'Disarm 7', N'3.6v.1', 7, 'Disarm-7'),
(1647, 4, NULL, N'Aussreissen (Wrenching)', NULL, 7, 'Aussreissen'),
(1648, 4, 1647, N'Aussreissen 1', N'3.6v.2', 1, 'Aussreissen-1'),
(1649, 4, 1647, N'Aussreissen 2', N'3.6v.3', 2, 'Aussreissen-2'),
(1650, 4, 1647, N'Aussreissen 3', N'3.7r.1', 3, 'Aussreissen-3'),
(1651, 4, 1647, N'Aussreissen 4', N'3.7r.2', 4, 'Aussreissen-4'),
(1886, 4, 1647, N'Aussreissen 5', N'3.7r.3', 4.5, 'Aussreissen-5'),
(1652, 4, 1647, N'Aussreissen 6', N'3.8r.1', 5, 'Aussreissen-6'),
(1653, 4, 1647, N'Aussreissen 7', N'3.8r.2', 6, 'Aussreissen-7'),
(1654, 4, 1647, N'Aussreissen 8 Counter', N'3.8r.3', 7, 'Aussreissen-8'),
(1655, 4, 1647, N'Aussreissen 9 Another', N'3.8v.1', 8, 'Aussreissen-9'),
(1656, 4, 1647, N'Aussreissen 10', N'3.8v.2', 9, 'Aussreissen-10'),
(1657, 4, 1647, N'Aussreissen 11', N'3.8v.3', 10, 'Aussreissen-11'),
(1658, 4, 1647, N'Aussreissen 12', N'3.8v.4', 11, 'Aussreissen-12'),
(1659, 4, 1647, N'Aussreissen 13', N'3.9r.1', 12, 'Aussreissen-13'),
(1660, 4, 1647, N'Aussreissen 14', N'3.9r.2', 13, 'Aussreissen-14'),
(1661, 4, 1647, N'Aussreissen 15', N'3.9r.3', 14, 'Aussreissen-15'),
(1662, 4, 1647, N'Aussreissen 16', N'3.9r.4', 15, 'Aussreissen-16'),
(1663, 4, NULL, N'A Counter Against the Deceit', NULL, 8, 'Counter-Deceit'),
(1664, 4, 1663, N'Deceit 1', NULL, 1, 'Deceit-1'),
(1665, 4, 1663, N'Deceit 2', N'3.9v.2', 2, 'Deceit-2'),
(1666, 4, 1663, N'Deceit 3', N'3.9v.3', 3, 'Deceit-3'),
(1667, 4, 1663, N'Deceit 4', N'3.9v.4', 4, 'Deceit-4'),
(1668, 4, NULL, N'A device in which you go through', NULL, 9, 'Change-Through'),
(1669, 4, 1668, N'Change Through 1', N'3.10r.1', 1, 'Change-Through-1'),
(1670, 4, 1668, N'Change Through 2', N'3.10r.2', 2, 'Change-Through-2'),
(1671, 4, 1668, N'Hinder', N'3.10r.3', 3, 'Hinder'),
(1672, 4, NULL, N'Grappling', NULL, 10, 'Grappling'),
(1673, 4, 1672, N'Grappling 1', N'3.10v.1', 1, 'Grappling-1'),
(1674, 4, 1672, N'Grappling 2', N'3.10v.2', 2, 'Grappling-2'),
(1675, 4, 1672, N'Grappling 3', N'3.11r.1', 3, 'Grappling-3'),
(1676, 4, 1672, N'Grappling 4 (Variant of Grappling 3)', N'3.11r.2', 4, 'Grappling-4'),
(1677, 4, NULL, N'Precepts', NULL, 11, 'Precepts'),
(1887, 4, 1677, N'Precept 1', NULL, 1, 'Precept-1'),
(1678, 4, 1887, N'Precept 1 Example 1', N'3.11r.3', 1, 'Precept-1-Example-1'),
(1679, 4, 1887, N'Precept 1 Example 2', N'3.12r.1', 2, 'Precept-1-Example-2'),
(1888, 4, 1677, N'Precept 2', NULL, 2, 'Precept-2'),
(1680, 4, 1888, N'Precept 2 Example 1', N'3.12r.2', 3, 'Precept-2-Example-1'),
(1681, 4, 1888, N'Precept 2 Example 2', N'3.12v.1', 4, 'Precept-2-Example-2'),
(1889, 4, 1677, N'Precept 3', NULL, 3, 'Precept-3'),
(1890, 4, 1677, N'Precept 4', NULL, 4, 'Precept-4'),
(1682, 4, 1890, N'Precept 4 Example 1', N'3.12v.2', 5, 'Precept-4-Example-1'),
(1683, 4, 1890, N'Precept 4 Example 2', N'3.13r.1', 6, 'Precept-4-Example-2'),
(1891, 4, 1677, N'Precept 5', NULL, 5, 'Precept-5'),
(1684, 4, 1891, N'Precept 5 Example 1', N'3.13r.2', 7, 'Precept-5-Example-1'),
(1685, 4, 1891, N'Precept 5 Example 2', N'3.13r.3', 8, 'Precept-5-Example-2'),
(1686, 4, 1891, N'Precept 5 Example 3', N'3.13v.1', 9, 'Precept-5-Example-3'),
(1894, 4, NULL, N'Wrestling', NULL, 2, 'Wrestling'),
(1687, 4, 1894, N'Wrestling 1', N'3.13v.2', 10, 'Wrestling-1'),
(1688, 4, 1894, N'Wrestling 2', N'3.13v.3', 11, 'Wrestling-2'),
(1689, 4, 1894, N'Wrestling 3', N'3.13v.4', 12, 'Wrestling-3'),
(1690, 4, 1894, N'Wrestling 4', N'3.13v.5', 13, 'Wrestling-4'),
(1691, 4, 1894, N'Wrestling 5', N'3.14r.1', 14, 'Wrestling-5'),
(1692, 4, 1894, N'Wrestling 6', N'3.14r.2', 15, 'Wrestling-6'),
(1693, 4, 1894, N'Wrestling 7', N'3.14r.3', 16, 'Wrestling-7'),
(1694, 4, 1894, N'Wrestling 8', N'3.14r.4', 17, 'Wrestling-8'),
(1695, 4, 1894, N'Wrestling 9', N'3.14r.5', 18, 'Wrestling-9'),
(1696, 4, 1894, N'Wrestling 10', N'3.14r.6', 19, 'Wrestling-10'),
(1697, 4, 1894, N'Wrestling 11', N'3.14r.7', 20, 'Wrestling-11'),
(1698, 4, 1894, N'Wrestling 12', N'3.14v.1', 21, 'Wrestling-12'),
(1699, 4, 1894, N'Wrestling 13', N'3.14v.2', 22, 'Wrestling-13'),
(1700, 4, 1894, N'Wrestling 14', N'3.14v.3', 23, 'Wrestling-14'),
(1701, 4, 1894, N'Wrestling 15', N'3.14v.4', 24, 'Wrestling-15'),
(1702, 4, 1894, N'Wrestling 16', N'3.14v.5', 25, 'Wrestling-16'),
(1703, 4, 1894, N'Wrestling 17', N'3.15v.1', 26, 'Wrestling-17');


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
