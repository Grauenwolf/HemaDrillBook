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
SectionSlug varchar(50) NULL

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

(1254, 2, NULL, N'Chapter 3', NULL, 3, 'Chapter-3'),
(1255, 2, 1254, N'Drill 1 Example 1', N'2.4v.1', 1, 'Drill-1-Example-1'),
(1256, 2, 1254, N'Drill 1 Example 2', N'2.5v.1', 2, 'Drill-1-Example-2'),
(1257, 2, 1254, N'Drill 1 Example 3', N'2.5v.2', 3, 'Drill-1-Example-3'),
(1258, 2, 1254, N'Dussack Drill 2', N'2.6r.1', 4, 'Dussack-Drill-2'),
(1259, 2, 1254, N'Dussack Drill 3 Example 1', N'2.6v.1', 5, 'Dussack-Drill-3-Example-1'),
(1260, 2, 1254, N'Dussack Drill 3 Example 2', N'2.6v.2', 6, 'Dussack-Drill-3-Example-2'),
(1261, 2, 1254, N'Dussack Drill 3 Example 3', N'2.6v.3', 7, 'Dussack-Drill-3-Example-3'),
(1262, 2, 1254, N'Dussack Drill 4 Example 1', N'2.6v.4', 8, 'Dussack-Drill-4-Example-1'),
(1263, 2, 1254, N'Dussack Drill 4 Example 2', N'2.7v.1', 9, 'Dussack-Drill-4-Example-2'),
(1264, 2, 1254, N'Six Cuts', N'2.7v.2', 10, 'Six-Cuts'),
(1265, 2, 1254, N'Cross Change 1', N'2.8r.1', 11, 'Cross-Change-1'),
(1266, 2, 1254, N'Cross Change 2', N'2.8r.2', 12, 'Cross-Change-2'),
(1876, 2, NULL, N'Chapter 1', NULL, 1, 'Chapter-1'),
(1877, 2, NULL, N'Chapter 2', NULL, 2, 'Chapter-2'),
(1267, 2, NULL, N'Chapter 4', NULL, 4, 'Chapter-4'),
(1268, 2, 1267, N'Sturzhauw (Plunge Cut)', N'2.9r.1', 1, 'Sturzhauw'),
(1269, 2, 1267, N'Krumphauw (Crooked Cut)', NULL, 2, 'Krumphauw'),
(1270, 2, 1267, N'Kurtzhauw (Short Cut)', N'2.9v.1', 3, 'Kurtzhauw'),
(1271, 2, 1267, N'Zwingerhauw (Constrainer Cut)', N'2.10r.1', 4, 'Zwingerhauw'),
(1272, 2, 1267, N'Brummerhauw (Roarer Cut)', N'2.10r.2', 5, 'Brummerhauw'),
(1273, 2, 1267, N'Weckerhauw (Waker Cut)', N'2.11r.1', 6, 'Weckerhauw'),
(1274, 2, 1267, N'Rosenhauw (Rose Cut)', N'2.11r.2', 7, 'Rosenhauw'),
(1275, 2, 1267, N'Gefehrhauw (Danger Cut)', N'2.11v.1', 8, 'Gefehrhauw'),
(1276, 2, 1267, N'Entrusthauw (Anger Cut) 1', N'2.11v.2', 9, 'Entrusthauw-1'),
(1277, 2, 1267, N'Entrusthauw (Anger Cut) 2', N'2.11v.3', 10, 'Entrusthauw-2'),
(1278, 2, 1267, N'Fehlhauw (Failing Cut)', N'2.12v.1', 11, 'Fehlhauw'),
(1279, 2, 1267, N'Blendthauw (Blind Cut)', N'2.12v.12', 12, 'Blendthauw'),
(1280, 2, 1267, N'Schnellhauw (Flicking Cut)', N'2.13v.1', 13, 'Schnellhauw'),
(1281, 2, 1267, N'Windthauw (Winding Cut)', N'2.13v.3', 14, 'Windthauw'),
(1282, 2, 1267, N'Bochhauw (Knocking Cut)', N'2.13v.4', 15, 'Bochhauw'),
(1284, 2, 1267, N'Wechselhauw (Change Cut)', NULL, 16, 'Wechselhauw'),
(1283, 2, 1267, N'Kreutzhauw (Cross Cut)', N'2.14r.1', 17, 'Kreutzhauw'),
(1285, 2, NULL, N'Chapter 5', NULL, 5, 'Chapter-5'),
(1286, 2, 1285, N'Opening 1', N'2.15v.1', 1, 'Opening-1'),
(1287, 2, 1285, N'Opening 2', N'2.15v.2', 2, 'Opening-2'),
(1288, 2, 1285, N'Opening 3', N'2.15v.3', 3, 'Opening-3'),
(1289, 2, 1285, N'Opening 4', N'2.16r.1', 4, 'Opening-4'),
(1290, 2, 1285, N'Opening 5', N'2.16r.2', 5, 'Opening-5'),
(1291, 2, 1285, N'Opening 6', N'2.16r.3', 6, 'Opening-6'),
(1292, 2, NULL, N'Chapter 6', NULL, 6, 'Chapter-6'),
(1293, 2, 1292, N'Parrying 1', N'2.17r.1', 1, 'Parrying-1'),
(1294, 2, 1292, N'Parrying 2', N'2.17r.2', 2, 'Parrying-2'),
(1295, 2, 1292, N'Parrying 3', N'2.17r.3', 3, 'Parrying-3'),
(1296, 2, 1292, N'Parrying 4', N'2.17r.4', 4, 'Parrying-4'),
(1297, 2, 1292, N'Parrying 5', N'2.18r.1', 5, 'Parrying-5'),
(1298, 2, 1292, N'Parrying 6', N'2.18r.2', 6, 'Parrying-6'),
(1878, 2, NULL, N'Chapter 7', NULL, 7, 'Chapter-7'),
(1299, 2, NULL, N'Chapter 8 Wacht (Watch)', NULL, 8, 'Chapter-8'),
(1300, 2, 1299, N'Watch Device 1', N'2.20r.1', 1, 'Watch-1'),
(1301, 2, 1299, N'Watch Device 2', N'2.20v.1', 2, 'Watch-2'),
(1879, 2, 1299, N'Watch Precept', NULL, 3, 'Watch-Precept'),
(1302, 2, 1299, N'Watch Device 3', N'2.21r.1', 4, 'Watch-3'),
(1303, 2, 1299, N'Watch Device 4', N'2.21r.2', 5, 'Watch-4'),
(1304, 2, 1299, N'Watch Device 5', N'2.21v.1', 6, 'Watch-5'),
(1305, 2, 1299, N'Watch Device 6', N'2.21v.2', 7, 'Watch-6'),
(1306, 2, NULL, N'Chapter 9', NULL, 9, 'Chapter-9'),
(1307, 2, 1306, N'Stier Device 1 First', N'2.23r.1', 1, 'Stier-1'),
(1308, 2, 1306, N'Stier Device 2 Second', N'2.23r.2', 2, 'Stier-2'),
(1309, 2, 1306, N'Stier Device 3 Third', N'2.23v.1', 3, 'Stier-3'),
(1310, 2, 1306, N'Stier Device 4 Fourth', N'2.24r.1', 4, 'Stier-4'),
(1311, 2, 1306, N'Stier Device 5 Won''t Strike', N'2.24r.2', 5, 'Stier-5'),
(1312, 2, 1306, N'Stier Device 6 Too High', N'2.24v.1', 6, 'Stier-6'),
(1313, 2, 1306, N'Stier Device 7 Too Low', N'2.24v.2', 7, 'Stier-7'),
(1314, 2, 1306, N'Stier Device 8 Goad', N'2.25r.1', 8, 'Stier-8'),
(1315, 2, 1306, N'Stier Device 9 Forcefully 1', N'2.25v.1', 9, 'Stier-9'),
(1316, 2, 1306, N'Stier Device 10 Forcefully 2', N'2.25v.2', 10, 'Stier-10'),
(1317, 2, 1306, N'Stier Device 11 Body Language', N'2.26r.1', 11, 'Stier-11'),
(1318, 2, 1306, N'Stier Device 12 Danger', N'2.27r.1', 12, 'Stier-12'),
(1319, 2, 1306, N'Stier Device 13 Waker', N'2.27r.2', 13, 'Stier-13'),
(1880, 2, 1306, N'Stier Device 14 Steer', N'2.27v.1', 14, 'Stier-14'),
(1320, 2, 1306, N'Stier Precept', NULL, 15, 'Stier-Precept'),
(1321, 2, NULL, N'Chapter 10', NULL, 10, 'Chapter-10'),
(1322, 2, 1321, N'Zornhut Device 1 First', N'2.29r.1', 1, 'Zornhut-1'),
(1323, 2, 1321, N'Zornhut Device 2 Second', N'2.29v.1', 2, 'Zornhut-2'),
(1324, 2, 1321, N'Zornhut Device 3 Point to Face 1', N'2.29v.2', 3, 'Zornhut-3'),
(1325, 2, 1321, N'Zornhut Device 4 Point to Face 2', N'2.30r.1', 4, 'Zornhut-4'),
(1326, 2, 1321, N'Zornhut Device 5 Sliding 1', N'2.30r.2', 5, 'Zornhut-5'),
(1327, 2, 1321, N'Zornhut Device 6 Sliding 2', N'2.30v.1', 6, 'Zornhut-6'),
(1328, 2, 1321, N'Zornhut Device 7 Sliding 3', N'2.30v.2', 7, 'Zornhut-7'),
(1329, 2, 1321, N'Zornhut Device 8 Laying On', N'2.30v.3', 8, 'Zornhut-8'),
(1330, 2, 1321, N'Left Device 1 Left Wrath', N'2.31r.1', 9, 'Left-1'),
(1331, 2, 1321, N'Left Device 2', N'2.31r.2', 10, 'Left-2'),
(1332, 2, 1321, N'Left Device 3 Left Steer', N'2.31v.1', 11, 'Left-3'),
(1333, 2, 1321, N'Left Device 4 Left and Right Steer', N'2.32r.1', 12, 'Left-4'),
(1334, 2, 1321, N'Left Device 5 Precept', N'2.32r.2', 13, 'Left-5'),
(1335, 2, 1321, N'Left Device 6 Counter', N'2.32v.1', 14, 'Left-6'),
(1336, 2, NULL, N'Chapter 11', NULL, 11, 'Chapter-11'),
(1337, 2, 1336, N'Gerade Versatzung Device 1 Example', N'2.33v.1', 1, 'Gerade-Versatzung-1'),
(1338, 2, 1336, N'Gerade Versatzung Device 2', N'2.33v.2', 2, 'Gerade-Versatzung-2'),
(1339, 2, 1336, N'Gerade Versatzung Device 3 Another', N'2.33v.3', 3, 'Gerade-Versatzung-3'),
(1340, 2, 1336, N'Gerade Versatzung Device 4', N'2.34r.1', 4, 'Gerade-Versatzung-4'),
(1341, 2, 1336, N'Gerade Versatzung Device 5', N'2.34r.2', 5, 'Gerade-Versatzung-5'),
(1342, 2, 1336, N'Gerade Versatzung Device 6 Set off, hand in, and draw up', N'2.34r.3', 6, 'Gerade-Versatzung-6'),
(1343, 2, 1336, N'Gerade Versatzung Device 7 Set off, step out, and slice', N'2.34r.4', 7, 'Gerade-Versatzung-7'),
(1344, 2, 1336, N'Gerade Versatzung Device 8', N'2.34v.1', 8, 'Gerade-Versatzung-8'),
(1345, 2, 1336, N'Gerade Versatzung Device 9', N'2.34v.2', 9, 'Gerade-Versatzung-9'),
(1346, 2, 1336, N'Gerade Versatzung Device 10', N'2.34v.3', 10, 'Gerade-Versatzung-10'),
(1347, 2, 1336, N'Gerade Versatzung Device 11 Precept', N'2.35r.1', 11, 'Gerade-Versatzung-11'),
(1348, 2, 1336, N'Gerade Versatzung Device 12', N'2.35r.2', 12, 'Gerade-Versatzung-12'),
(1349, 2, 1336, N'Gerade Versatzung Device 13 Swift and Deceitful', N'2.35r.3', 13, 'Gerade-Versatzung-13'),
(1350, 2, 1336, N'Gerade Versatzung Device 14', N'2.35v.1', 14, 'Gerade-Versatzung-14'),
(1351, 2, NULL, N'Chapter 12', NULL, 12, 'Chapter-12'),
(1352, 2, 1351, N'Bogen Device 1', N'2.36v.1', 1, 'Bogen-1'),
(1353, 2, 1351, N'Bogen Device 2', N'2.36v.2', 2, 'Bogen-2'),
(1354, 2, 1351, N'Bogen Device 3', N'2.36v.3', 3, 'Bogen-3'),
(1355, 2, 1351, N'Bogen Device 4 Precept', N'2.37r.1', 4, 'Bogen-4'),
(1356, 2, 1351, N'Bogen Device 5', N'2.37r.2', 5, 'Bogen-5'),
(1357, 2, 1351, N'Bogen Device 6', N'2.37r.3', 6, 'Bogen-6'),
(1358, 2, 1351, N'Bogen Device 7', N'2.37v.1', 7, 'Bogen-7'),
(1359, 2, 1351, N'Bogen Device 8 Counter', N'2.37v.2', 8, 'Bogen-8'),
(1360, 2, 1351, N'Bogen Device 9', N'2.37v.3', 9, 'Bogen-9'),
(1361, 2, 1351, N'Bogen Device 10', N'2.37v.4', 10, 'Bogen-10'),
(1362, 2, 1351, N'Bogen Device 11 Flicking', N'2.37v.5', 11, 'Bogen-11'),
(1363, 2, 1351, N'Bogen Device 12', N'2.38r.1', 12, 'Bogen-12'),
(1364, 2, 1351, N'Bogen Device 13', N'2.38r.2', 13, 'Bogen-13'),
(1365, 2, 1351, N'Bogen Device 14 Middle', N'2.38r.3', 14, 'Bogen-14'),
(1366, 2, 1351, N'Bogen Device 15', N'2.38r.4', 15, 'Bogen-15'),
(1367, 2, 1351, N'Bogen Device 16 Change Through', N'2.38v.1', 16, 'Bogen-16'),
(1368, 2, 1351, N'Bogen Device 17 Turn Point Inwards', N'2.39v.1', 17, 'Bogen-17'),
(1369, 2, 1351, N'Bogen Device 18', N'2.39v.2', 18, 'Bogen-18'),
(1370, 2, 1351, N'Bogen Device 19', N'2.39v.3', 19, 'Bogen-19'),
(1371, 2, 1351, N'Bogen Device 20', N'2.39v.4', 20, 'Bogen-20'),
(1372, 2, 1351, N'Bogen Device 21', N'2.39v.5', 21, 'Bogen-21'),
(1373, 2, 1351, N'Bogen Device 22', N'2.39v.6', 22, 'Bogen-22'),
(1374, 2, 1351, N'Bogen Device 23 Slice Off', N'2.40v.1', 23, 'Bogen-23'),
(1375, 2, 1351, N'Bogen Device 24 Precept', N'2.40v.2', 24, 'Bogen-24'),
(1376, 2, 1351, N'Bogen Device 25', N'2.40r.3', 25, 'Bogen-25'),
(1377, 2, 1351, N'Bogen Device 26', N'2.40r.4', 26, 'Bogen-26'),
(1378, 2, 1351, N'Bogen Device 27 Chasing', N'2.41r.1', 27, 'Bogen-27'),
(1379, 2, 1351, N'Bogen Device 28', N'2.41r.2', 28, 'Bogen-28'),
(1380, 2, 1351, N'Bogen Device 29', N'2.41r.3', 29, 'Bogen-29'),
(1381, 2, NULL, N'Chapter 13', NULL, 13, 'Chapter-13'),
(1382, 2, 1381, N'Eber Device 1', N'2.42r.1', 1, 'Eber-1'),
(1383, 2, 1381, N'Eber Device 2', N'2.42r.2', 2, 'Eber-2'),
(1384, 2, 1381, N'Eber Device 3', N'2.42r.3', 3, 'Eber-3'),
(1385, 2, 1381, N'Eber Device 4', N'2.42v.1', 4, 'Eber-4'),
(1386, 2, 1381, N'Eber Device 5', N'2.42v.2', 5, 'Eber-5'),
(1387, 2, 1381, N'Eber Device 6', N'2.42v.3', 6, 'Eber-6'),
(1388, 2, 1381, N'Eber Device 7', N'2.42v.4', 7, 'Eber-7'),
(1389, 2, 1381, N'Eber Device 8', N'2.43r.1', 8, 'Eber-8'),
(1390, 2, NULL, N'Chapter 14', NULL, 14, 'Chapter-14'),
(1391, 2, 1390, N'Mittelhut Device 1', N'2.44r.1', 1, 'Mittelhut-1'),
(1392, 2, 1390, N'Mittelhut Device 2', N'2.44r.2', 2, 'Mittelhut-2'),
(1393, 2, 1390, N'Mittelhut Device 3', N'2.44v.1', 3, 'Mittelhut-3'),
(1394, 2, 1390, N'Mittelhut Device 4', N'2.44v.2', 4, 'Mittelhut-4'),
(1395, 2, 1390, N'Mittelhut Device 5', N'2.44v.3', 5, 'Mittelhut-5'),
(1396, 2, 1390, N'Mittelhut Device 6', N'2.45r.1', 6, 'Mittelhut-6'),
(1397, 2, 1390, N'Mittelhut Device 7', N'2.45r.2', 7, 'Mittelhut-7'),
(1398, 2, 1390, N'Mittelhut Device 8', N'2.45r.3', 8, 'Mittelhut-8'),
(1399, 2, 1390, N'Mittelhut Device 9', N'2.45v.1', 9, 'Mittelhut-9'),
(1400, 2, NULL, N'Chapter 15', NULL, 15, 'Chapter-15'),
(1401, 2, 1400, N'Weschel Device 1', N'2.45v.2', 1, 'Weschel-1'),
(1402, 2, 1400, N'Weschel Device 2', N'2.46r.1', 2, 'Weschel-2'),
(1403, 2, 1400, N'Weschel Device 3', N'2.46r.2', 3, 'Weschel-3'),
(1404, 2, 1400, N'Weschel Device 4', N'2.47r.1', 4, 'Weschel-4'),
(1405, 2, 1400, N'Weschel Device 5', N'2.47r.2', 5, 'Weschel-5'),
(1406, 2, 1400, N'Weschel Device 6', N'2.47r.3', 6, 'Weschel-6'),
(1407, 2, 1400, N'Weschel Device 7', N'2.47v.1', 7, 'Weschel-7'),
(1408, 2, 1400, N'Weschel Device 8', N'2.47v.2', 8, 'Weschel-8'),
(1409, 2, 1400, N'Weschel Device 9', N'2.47v.3', 9, 'Weschel-9'),
(1410, 2, NULL, N'Chapter 16', NULL, 16, 'Chapter-16'),
(1411, 2, NULL, N'Chapter 17', NULL, 17, 'Chapter-17'),
(1412, 2, 1411, N'Grappling Device 1', N'2.47v.4', 1, 'Grappling-1'),
(1413, 2, 1411, N'Grappling Device 2', N'2.48r.1', 2, 'Grappling-2'),
(1414, 2, 1411, N'Grappling Device 3', N'2.48r.2', 3, 'Grappling-3'),
(1415, 2, 1411, N'Grappling Device 4', N'2.48r.3', 4, 'Grappling-4'),
(1416, 2, 1411, N'Grappling Device 5', N'2.48r.4', 5, 'Grappling-5'),
(1417, 2, 1411, N'Grappling Device 6', N'2.48v.1', 6, 'Grappling-6'),
(1418, 2, 1411, N'Grappling Device 7', N'2.48v.2', 7, 'Grappling-7'),
(1419, 2, 1411, N'Grappling Device 8', N'2.49r.1', 8, 'Grappling-8'),
(1420, 2, 1411, N'Grappling Device 9', N'2.49r.2', 9, 'Grappling-9'),
(1421, 2, NULL, N'Conclusion', NULL, 18, 'Conclusion'),
(1422, 2, 1421, N'Conclusion Device 1', N'2.49v.1', 1, 'Conclusion-1'),
(1423, 2, 1421, N'Conclusion Device 2', N'2.49v.2', 2, 'Conclusion-2')

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
