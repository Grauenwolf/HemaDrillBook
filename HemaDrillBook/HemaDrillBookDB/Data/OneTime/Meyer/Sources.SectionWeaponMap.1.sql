IF $(OneTimeLoad) = 1
BEGIN

    DECLARE @SectionWeaponMap TABLE
    (
        SectionWeaponMapKey INT NOT NULL PRIMARY KEY,
        SectionKey INT NOT NULL,
        PrimaryWeaponKey INT NOT NULL,
        SecondaryWeaponKey INT NULL
    );

    INSERT INTO @SectionWeaponMap
    (
        SectionWeaponMapKey,
        SectionKey,
        PrimaryWeaponKey,
        SecondaryWeaponKey
    )
    VALUES
    (2, 1002, 4, NULL),
    (3, 1018, 4, NULL),
    (4, 1037, 4, NULL),
    (5, 1067, 4, NULL),
    (6, 1069, 4, NULL),
    (7, 1072, 4, NULL),
    (8, 1087, 4, NULL),
    (9, 1869, 4, NULL),
    (10, 1870, 4, NULL),
    (11, 1871, 4, NULL),
    (12, 1872, 4, NULL),
    (13, 1875, 4, NULL),
    (14, 1149, 4, NULL),
    (15, 1151, 4, NULL),
    (16, 1154, 4, NULL),
    (17, 1157, 4, NULL),
    (18, 1159, 4, NULL),
    (19, 1161, 4, NULL),
    (20, 1166, 4, NULL),
    (21, 1169, 4, NULL),
    (22, 1172, 4, NULL),
    (23, 1175, 4, NULL),
    (24, 1177, 4, NULL),
    (25, 1181, 4, NULL),
    (26, 1184, 4, NULL),
    (27, 1187, 4, NULL),
    (28, 1189, 4, NULL),
    (29, 1192, 4, NULL),
    (30, 1198, 4, NULL),
    (31, 1201, 4, NULL),
    (32, 1206, 4, NULL),
    (33, 1212, 4, NULL),
    (34, 1215, 4, NULL),
    (35, 1217, 4, NULL),
    (36, 1221, 4, NULL),
    (37, 1224, 4, NULL),
    (38, 1226, 4, NULL),
    (39, 1229, 4, NULL),
    (40, 1231, 4, NULL),
    (41, 1237, 4, NULL),
    (42, 1239, 4, NULL),
    (43, 1245, 4, NULL),
    (44, 1251, 4, NULL),
    (45, 1252, 4, NULL),
    (46, 1246, 4, NULL),
    (47, 1247, 4, NULL),
    (48, 1248, 4, NULL),
    (49, 1249, 4, NULL),
    (50, 1250, 4, NULL),
    (51, 1240, 4, NULL),
    (52, 1241, 4, NULL),
    (53, 1242, 4, NULL),
    (54, 1243, 4, NULL),
    (55, 1244, 4, NULL),
    (56, 1238, 4, NULL),
    (57, 1232, 4, NULL),
    (58, 1233, 4, NULL),
    (59, 1234, 4, NULL),
    (60, 1235, 4, NULL),
    (61, 1236, 4, NULL),
    (62, 1874, 4, NULL),
    (63, 1230, 4, NULL),
    (64, 1227, 4, NULL),
    (65, 1228, 4, NULL),
    (66, 1225, 4, NULL),
    (67, 1222, 4, NULL),
    (68, 1223, 4, NULL),
    (69, 1873, 4, NULL),
    (70, 1218, 4, NULL),
    (71, 1219, 4, NULL),
    (72, 1220, 4, NULL),
    (73, 1216, 4, NULL),
    (74, 1213, 4, NULL),
    (75, 1214, 4, NULL),
    (76, 1207, 4, NULL),
    (77, 1208, 4, NULL),
    (78, 1209, 4, NULL),
    (79, 1210, 4, NULL),
    (80, 1211, 4, NULL),
    (81, 1202, 4, NULL),
    (82, 1203, 4, NULL),
    (83, 1204, 4, NULL),
    (84, 1205, 4, NULL),
    (85, 1199, 4, NULL),
    (86, 1200, 4, NULL),
    (87, 1193, 4, NULL),
    (88, 1194, 4, NULL),
    (89, 1195, 4, NULL),
    (90, 1196, 4, NULL),
    (91, 1197, 4, NULL),
    (92, 1190, 4, NULL),
    (93, 1191, 4, NULL),
    (94, 1188, 4, NULL),
    (95, 1185, 4, NULL),
    (96, 1186, 4, NULL),
    (97, 1182, 4, NULL),
    (98, 1183, 4, NULL),
    (99, 1178, 4, NULL),
    (100, 1179, 4, NULL),
    (101, 1176, 4, NULL),
    (102, 1173, 4, NULL),
    (103, 1174, 4, NULL),
    (104, 1170, 4, NULL),
    (105, 1171, 4, NULL),
    (106, 1167, 4, NULL),
    (107, 1168, 4, NULL),
    (108, 1162, 4, NULL),
    (109, 1163, 4, NULL),
    (110, 1164, 4, NULL),
    (111, 1165, 4, NULL),
    (112, 1160, 4, NULL),
    (113, 1158, 4, NULL),
    (114, 1155, 4, NULL),
    (115, 1156, 4, NULL),
    (116, 1152, 4, NULL),
    (117, 1153, 4, NULL),
    (118, 1150, 4, NULL),
    (119, 1088, 4, NULL),
    (120, 1097, 4, NULL),
    (121, 1104, 4, NULL),
    (122, 1107, 4, NULL),
    (123, 1112, 4, NULL),
    (124, 1115, 4, NULL),
    (125, 1119, 4, NULL),
    (126, 1124, 4, NULL),
    (127, 1126, 4, NULL),
    (128, 1130, 4, NULL),
    (129, 1139, 4, NULL),
    (130, 1142, 4, NULL),
    (131, 1143, 4, NULL),
    (132, 1144, 4, NULL),
    (133, 1145, 4, NULL),
    (134, 1146, 4, NULL),
    (135, 1147, 4, NULL),
    (136, 1148, 4, NULL),
    (137, 1140, 4, NULL),
    (138, 1141, 4, NULL),
    (139, 1131, 4, NULL),
    (140, 1132, 4, NULL),
    (141, 1133, 4, NULL),
    (142, 1134, 4, NULL),
    (143, 1135, 4, NULL),
    (144, 1136, 4, NULL),
    (145, 1137, 4, NULL),
    (146, 1138, 4, NULL),
    (147, 1127, 4, NULL),
    (148, 1128, 4, NULL),
    (149, 1129, 4, NULL),
    (150, 1125, 4, NULL),
    (151, 1120, 4, NULL),
    (152, 1121, 4, NULL),
    (153, 1122, 4, NULL),
    (154, 1123, 4, NULL),
    (155, 1116, 4, NULL),
    (156, 1117, 4, NULL),
    (157, 1118, 4, NULL),
    (158, 1113, 4, NULL),
    (159, 1114, 4, NULL),
    (160, 1108, 4, NULL),
    (161, 1109, 4, NULL),
    (162, 1110, 4, NULL),
    (163, 1111, 4, NULL),
    (164, 1105, 4, NULL),
    (165, 1106, 4, NULL),
    (166, 1098, 4, NULL),
    (167, 1099, 4, NULL),
    (168, 1100, 4, NULL),
    (169, 1101, 4, NULL),
    (170, 1102, 4, NULL),
    (171, 1103, 4, NULL),
    (172, 1868, 4, NULL),
    (173, 1089, 4, NULL),
    (174, 1090, 4, NULL),
    (175, 1091, 4, NULL),
    (176, 1092, 4, NULL),
    (177, 1093, 4, NULL),
    (178, 1094, 4, NULL),
    (179, 1095, 4, NULL),
    (180, 1096, 4, NULL),
    (181, 1073, 4, NULL),
    (184, 1076, 4, NULL),
    (185, 1077, 4, NULL),
    (186, 1078, 4, NULL),
    (187, 1079, 4, NULL),
    (188, 1080, 4, NULL),
    (189, 1081, 4, NULL),
    (190, 1082, 4, NULL),
    (191, 1083, 4, NULL),
    (192, 1084, 4, NULL),
    (193, 1085, 4, NULL),
    (194, 1086, 4, NULL),
    (195, 1070, 4, NULL),
    (196, 1071, 4, NULL),
    (197, 1068, 4, NULL),
    (198, 1038, 4, NULL),
    (199, 1039, 4, NULL),
    (200, 1040, 4, NULL),
    (201, 1041, 4, NULL),
    (202, 1042, 4, NULL),
    (203, 1043, 4, NULL),
    (204, 1044, 4, NULL),
    (205, 1045, 4, NULL),
    (206, 1046, 4, NULL),
    (207, 1047, 4, NULL),
    (208, 1048, 4, NULL),
    (209, 1049, 4, NULL),
    (210, 1050, 4, NULL),
    (211, 1051, 4, NULL),
    (212, 1052, 4, NULL),
    (213, 1053, 4, NULL),
    (214, 1054, 4, NULL),
    (215, 1055, 4, NULL),
    (216, 1056, 4, NULL),
    (217, 1057, 4, NULL),
    (218, 1058, 4, NULL),
    (219, 1059, 4, NULL),
    (220, 1060, 4, NULL),
    (221, 1061, 4, NULL),
    (222, 1062, 4, NULL),
    (223, 1063, 4, NULL),
    (224, 1064, 4, NULL),
    (225, 1065, 4, NULL),
    (226, 1066, 4, NULL),
    (227, 1866, 4, NULL),
    (228, 1867, 4, NULL),
    (229, 1019, 4, NULL),
    (230, 1020, 4, NULL),
    (231, 1021, 4, NULL),
    (232, 1022, 4, NULL),
    (233, 1023, 4, NULL),
    (234, 1024, 4, NULL),
    (235, 1025, 4, NULL),
    (236, 1026, 4, NULL),
    (237, 1027, 4, NULL),
    (238, 1028, 4, NULL),
    (239, 1029, 4, NULL),
    (240, 1030, 4, NULL),
    (241, 1031, 4, NULL),
    (242, 1032, 4, NULL),
    (243, 1033, 4, NULL),
    (244, 1034, 4, NULL),
    (245, 1035, 4, NULL),
    (246, 1036, 4, NULL),
    (247, 1003, 4, NULL),
    (248, 1004, 4, NULL),
    (249, 1005, 4, NULL),
    (250, 1006, 4, NULL),
    (251, 1007, 4, NULL),
    (252, 1008, 4, NULL),
    (253, 1009, 4, NULL),
    (254, 1010, 4, NULL),
    (255, 1011, 4, NULL),
    (256, 1012, 4, NULL),
    (257, 1013, 4, NULL),
    (258, 1014, 4, NULL),
    (259, 1015, 4, NULL),
    (260, 1016, 4, NULL),
    (261, 1017, 4, NULL),
    (263, 1254, 16, NULL),
    (264, 1255, 16, NULL),
    (265, 1256, 16, NULL),
    (266, 1257, 16, NULL),
    (267, 1258, 16, NULL),
    (268, 1259, 16, NULL),
    (269, 1260, 16, NULL),
    (270, 1261, 16, NULL),
    (271, 1262, 16, NULL),
    (272, 1263, 16, NULL),
    (273, 1264, 16, NULL),
    (274, 1265, 16, NULL),
    (275, 1266, 16, NULL),
    (276, 1267, 16, NULL),
    (277, 1268, 16, NULL),
    (278, 1269, 16, NULL),
    (279, 1270, 16, NULL),
    (280, 1271, 16, NULL),
    (281, 1272, 16, NULL),
    (282, 1273, 16, NULL),
    (283, 1274, 16, NULL),
    (284, 1275, 16, NULL),
    (285, 1276, 16, NULL),
    (286, 1277, 16, NULL),
    (287, 1278, 16, NULL),
    (288, 1279, 16, NULL),
    (289, 1280, 16, NULL),
    (290, 1281, 16, NULL),
    (291, 1282, 16, NULL),
    (292, 1283, 16, NULL),
    (293, 1284, 16, NULL),
    (294, 1285, 16, NULL),
    (295, 1286, 16, NULL),
    (296, 1287, 16, NULL),
    (297, 1288, 16, NULL),
    (298, 1289, 16, NULL),
    (299, 1290, 16, NULL),
    (300, 1291, 16, NULL),
    (301, 1292, 16, NULL),
    (302, 1293, 16, NULL),
    (303, 1294, 16, NULL),
    (304, 1295, 16, NULL),
    (305, 1296, 16, NULL),
    (306, 1297, 16, NULL),
    (307, 1298, 16, NULL),
    (308, 1299, 16, NULL),
    (309, 1300, 16, NULL),
    (310, 1301, 16, NULL),
    (311, 1302, 16, NULL),
    (312, 1303, 16, NULL),
    (313, 1304, 16, NULL),
    (314, 1305, 16, NULL),
    (315, 1306, 16, NULL),
    (316, 1307, 16, NULL),
    (317, 1308, 16, NULL),
    (318, 1309, 16, NULL),
    (319, 1310, 16, NULL),
    (320, 1311, 16, NULL),
    (321, 1312, 16, NULL),
    (322, 1313, 16, NULL),
    (323, 1314, 16, NULL),
    (324, 1315, 16, NULL),
    (325, 1316, 16, NULL),
    (326, 1317, 16, NULL),
    (327, 1318, 16, NULL),
    (328, 1319, 16, NULL),
    (329, 1320, 16, NULL),
    (330, 1321, 16, NULL),
    (331, 1322, 16, NULL),
    (332, 1323, 16, NULL),
    (333, 1324, 16, NULL),
    (334, 1325, 16, NULL),
    (335, 1326, 16, NULL),
    (336, 1327, 16, NULL),
    (337, 1328, 16, NULL),
    (338, 1329, 16, NULL),
    (339, 1330, 16, NULL),
    (340, 1331, 16, NULL),
    (341, 1332, 16, NULL),
    (342, 1333, 16, NULL),
    (343, 1334, 16, NULL),
    (344, 1335, 16, NULL),
    (345, 1336, 16, NULL),
    (346, 1337, 16, NULL),
    (347, 1338, 16, NULL),
    (348, 1339, 16, NULL),
    (349, 1340, 16, NULL),
    (350, 1341, 16, NULL),
    (351, 1342, 16, NULL),
    (352, 1343, 16, NULL),
    (353, 1344, 16, NULL),
    (354, 1345, 16, NULL),
    (355, 1346, 16, NULL),
    (356, 1347, 16, NULL),
    (357, 1348, 16, NULL),
    (358, 1349, 16, NULL),
    (359, 1350, 16, NULL),
    (360, 1351, 16, NULL),
    (361, 1352, 16, NULL),
    (362, 1353, 16, NULL),
    (363, 1354, 16, NULL),
    (364, 1355, 16, NULL),
    (365, 1356, 16, NULL),
    (366, 1357, 16, NULL),
    (367, 1358, 16, NULL),
    (368, 1359, 16, NULL),
    (369, 1360, 16, NULL),
    (370, 1361, 16, NULL),
    (371, 1362, 16, NULL),
    (372, 1363, 16, NULL),
    (373, 1364, 16, NULL),
    (374, 1365, 16, NULL),
    (375, 1366, 16, NULL),
    (376, 1367, 16, NULL),
    (377, 1368, 16, NULL),
    (378, 1369, 16, NULL),
    (379, 1370, 16, NULL),
    (380, 1371, 16, NULL),
    (381, 1372, 16, NULL),
    (382, 1373, 16, NULL),
    (383, 1374, 16, NULL),
    (384, 1375, 16, NULL),
    (385, 1376, 16, NULL),
    (386, 1377, 16, NULL),
    (387, 1378, 16, NULL),
    (388, 1379, 16, NULL),
    (389, 1380, 16, NULL),
    (390, 1381, 16, NULL),
    (391, 1382, 16, NULL),
    (392, 1383, 16, NULL),
    (393, 1384, 16, NULL),
    (394, 1385, 16, NULL),
    (395, 1386, 16, NULL),
    (396, 1387, 16, NULL),
    (397, 1388, 16, NULL),
    (398, 1389, 16, NULL),
    (399, 1390, 16, NULL),
    (400, 1391, 16, NULL),
    (401, 1392, 16, NULL),
    (402, 1393, 16, NULL),
    (403, 1394, 16, NULL),
    (404, 1395, 16, NULL),
    (405, 1396, 16, NULL),
    (406, 1397, 16, NULL),
    (407, 1398, 16, NULL),
    (408, 1399, 16, NULL),
    (409, 1400, 16, NULL),
    (410, 1401, 16, NULL),
    (411, 1402, 16, NULL),
    (412, 1403, 16, NULL),
    (413, 1404, 16, NULL),
    (414, 1405, 16, NULL),
    (415, 1406, 16, NULL),
    (416, 1407, 16, NULL),
    (417, 1408, 16, NULL),
    (418, 1409, 16, NULL),
    (419, 1410, 16, NULL),
    (420, 1411, 16, NULL),
    (421, 1412, 16, NULL),
    (422, 1413, 16, NULL),
    (423, 1414, 16, NULL),
    (424, 1415, 16, NULL),
    (425, 1416, 16, NULL),
    (426, 1417, 16, NULL),
    (427, 1418, 16, NULL),
    (428, 1419, 16, NULL),
    (429, 1420, 16, NULL),
    (430, 1421, 16, NULL),
    (431, 1422, 16, NULL),
    (432, 1423, 16, NULL),
    (433, 1876, 16, NULL),
    (434, 1877, 16, NULL),
    (435, 1878, 16, NULL),
    (436, 1879, 16, NULL),
    (437, 1880, 16, NULL),
    (464, 1425, 2, NULL),
    (465, 1426, 2, NULL),
    (466, 1427, 2, NULL),
    (467, 1428, 2, NULL),
    (468, 1429, 2, NULL),
    (469, 1430, 2, NULL),
    (470, 1431, 2, NULL),
    (471, 1432, 2, NULL),
    (472, 1433, 2, NULL),
    (473, 1434, 2, NULL),
    (474, 1435, 2, NULL),
    (475, 1436, 2, NULL),
    (476, 1437, 2, NULL),
    (477, 1438, 2, NULL),
    (478, 1439, 2, NULL),
    (479, 1440, 2, NULL),
    (480, 1441, 2, NULL),
    (481, 1442, 2, NULL),
    (482, 1443, 2, NULL),
    (483, 1444, 2, NULL),
    (484, 1445, 2, NULL),
    (485, 1446, 2, NULL),
    (486, 1447, 2, NULL),
    (487, 1448, 2, NULL),
    (488, 1449, 2, NULL),
    (489, 1450, 2, NULL),
    (490, 1451, 2, NULL),
    (491, 1452, 2, NULL),
    (492, 1453, 2, NULL),
    (493, 1454, 2, NULL),
    (494, 1455, 2, NULL),
    (495, 1456, 2, NULL),
    (496, 1457, 2, NULL),
    (497, 1458, 2, NULL),
    (498, 1459, 2, NULL),
    (499, 1460, 2, NULL),
    (500, 1461, 2, NULL),
    (501, 1462, 2, NULL),
    (502, 1463, 2, NULL),
    (503, 1464, 2, NULL),
    (504, 1465, 2, NULL),
    (505, 1466, 2, NULL),
    (506, 1467, 2, NULL),
    (507, 1468, 2, NULL),
    (508, 1469, 2, NULL),
    (509, 1470, 2, NULL),
    (510, 1471, 2, NULL),
    (511, 1472, 2, NULL),
    (512, 1473, 2, NULL),
    (513, 1474, 2, NULL),
    (514, 1475, 2, NULL),
    (515, 1476, 2, NULL),
    (516, 1477, 2, NULL),
    (517, 1478, 2, NULL),
    (518, 1479, 2, NULL),
    (519, 1480, 2, NULL),
    (520, 1481, 2, NULL),
    (521, 1482, 2, NULL),
    (522, 1483, 2, NULL),
    (523, 1484, 2, NULL),
    (524, 1485, 2, NULL),
    (525, 1486, 2, NULL),
    (526, 1487, 2, NULL),
    (527, 1488, 2, NULL),
    (528, 1489, 2, NULL),
    (529, 1490, 2, NULL),
    (530, 1491, 2, NULL),
    (531, 1492, 2, NULL),
    (532, 1493, 2, NULL),
    (533, 1494, 2, NULL),
    (534, 1495, 2, NULL),
    (535, 1496, 2, NULL),
    (536, 1497, 2, NULL),
    (537, 1498, 2, NULL),
    (538, 1499, 2, NULL),
    (539, 1500, 2, NULL),
    (540, 1501, 2, NULL),
    (541, 1502, 2, NULL),
    (542, 1503, 2, NULL),
    (543, 1504, 2, NULL),
    (544, 1505, 2, NULL),
    (545, 1506, 2, NULL),
    (546, 1507, 2, NULL),
    (547, 1508, 2, NULL),
    (548, 1509, 2, NULL),
    (549, 1510, 2, NULL),
    (550, 1511, 2, NULL),
    (551, 1512, 2, NULL),
    (552, 1513, 2, NULL),
    (553, 1514, 2, NULL),
    (554, 1515, 2, NULL),
    (555, 1516, 2, NULL),
    (556, 1517, 2, NULL),
    (557, 1518, 2, NULL),
    (558, 1519, 2, NULL),
    (559, 1520, 2, NULL),
    (560, 1521, 2, NULL),
    (561, 1522, 2, NULL),
    (562, 1523, 2, NULL),
    (563, 1524, 2, NULL),
    (564, 1525, 2, NULL),
    (565, 1526, 2, NULL),
    (566, 1527, 2, NULL),
    (567, 1528, 2, NULL),
    (568, 1529, 2, NULL),
    (569, 1530, 2, NULL),
    (570, 1531, 2, NULL),
    (571, 1532, 2, NULL),
    (572, 1533, 2, NULL),
    (573, 1534, 2, NULL),
    (574, 1535, 2, NULL),
    (575, 1536, 2, NULL),
    (576, 1537, 2, NULL),
    (577, 1538, 2, NULL),
    (578, 1539, 2, NULL),
    (579, 1540, 2, NULL),
    (580, 1541, 2, NULL),
    (581, 1542, 2, NULL),
    (582, 1543, 2, NULL),
    (583, 1544, 2, NULL),
    (584, 1545, 2, NULL),
    (585, 1546, 2, NULL),
    (586, 1547, 2, NULL),
    (587, 1548, 2, NULL),
    (588, 1549, 2, NULL),
    (589, 1550, 2, NULL),
    (590, 1551, 2, NULL),
    (591, 1552, 2, NULL),
    (592, 1553, 2, NULL),
    (593, 1554, 2, NULL),
    (594, 1555, 2, NULL),
    (595, 1556, 2, NULL),
    (596, 1557, 2, NULL),
    (597, 1558, 2, NULL),
    (598, 1559, 2, NULL),
    (599, 1560, 2, NULL),
    (600, 1561, 2, NULL),
    (601, 1562, 2, NULL),
    (602, 1563, 2, NULL),
    (603, 1564, 2, NULL),
    (604, 1565, 2, NULL),
    (605, 1566, 2, NULL),
    (606, 1567, 2, NULL),
    (607, 1568, 2, NULL),
    (608, 1569, 2, NULL),
    (609, 1570, 2, NULL),
    (610, 1571, 2, NULL),
    (611, 1572, 2, NULL),
    (612, 1573, 2, NULL),
    (613, 1574, 2, NULL),
    (614, 1575, 2, NULL),
    (615, 1576, 2, NULL),
    (616, 1577, 2, NULL),
    (617, 1578, 2, NULL),
    (618, 1579, 2, NULL),
    (619, 1580, 2, NULL),
    (620, 1581, 2, NULL),
    (621, 1582, 2, NULL),
    (622, 1583, 2, NULL),
    (623, 1584, 2, NULL),
    (624, 1585, 2, NULL),
    (625, 1586, 2, NULL),
    (626, 1587, 2, NULL),
    (627, 1588, 2, NULL),
    (628, 1589, 2, NULL),
    (629, 1590, 2, NULL),
    (630, 1591, 2, NULL),
    (631, 1592, 2, NULL),
    (632, 1593, 2, NULL),
    (633, 1594, 2, NULL),
    (634, 1595, 2, NULL),
    (635, 1596, 2, NULL),
    (636, 1597, 2, NULL),
    (637, 1598, 2, NULL),
    (638, 1599, 2, NULL),
    (639, 1600, 2, NULL),
    (640, 1601, 2, NULL),
    (641, 1602, 2, NULL),
    (642, 1603, 2, NULL),
    (643, 1604, 2, NULL),
    (644, 1605, 2, NULL),
    (645, 1606, 2, NULL),
    (646, 1607, 2, NULL),
    (647, 1608, 2, NULL),
    (648, 1609, 2, NULL),
    (649, 1610, 2, NULL),
    (650, 1611, 2, NULL),
    (651, 1612, 2, NULL),
    (652, 1613, 2, NULL),
    (653, 1614, 2, NULL),
    (654, 1615, 2, NULL),
    (655, 1616, 2, NULL),
    (656, 1617, 2, NULL),
    (657, 1881, 2, NULL),
    (658, 1882, 2, NULL),
    (659, 1883, 2, NULL),
    (660, 1884, 2, NULL),
    (661, 1885, 2, NULL),
    (687, 1590, 12, NULL),
    (688, 1591, 12, NULL),
    (689, 1592, 12, NULL),
    (690, 1593, 12, NULL),
    (691, 1594, 12, NULL),
    (692, 1595, 12, NULL),
    (693, 1596, 12, NULL),
    (694, 1597, 12, NULL),
    (695, 1598, 12, NULL),
    (696, 1599, 12, NULL),
    (697, 1600, 12, NULL),
    (698, 1601, 12, NULL),
    (699, 1602, 12, NULL),
    (700, 1603, 12, NULL),
    (701, 1604, 12, NULL),
    (702, 1605, 12, NULL),
    (703, 1606, 12, NULL),
    (704, 1607, 12, NULL),
    (705, 1608, 12, NULL),
    (706, 1609, 12, NULL),
    (707, 1881, 12, NULL),
    (708, 1610, 18, NULL),
    (709, 1611, 18, NULL),
    (710, 1882, 18, NULL),
    (711, 1612, 2, 19),
    (712, 1613, 2, 19),
    (713, 1614, 2, 19),
    (714, 1615, 2, 19),
    (715, 1616, 2, 19),
    (716, 1883, 2, 19),
    (718, 1620, 8, NULL),
    (719, 1621, 8, NULL),
    (720, 1622, 8, NULL),
    (721, 1623, 8, NULL),
    (722, 1624, 8, NULL),
    (723, 1625, 8, NULL),
    (724, 1626, 8, NULL),
    (725, 1627, 8, NULL),
    (726, 1628, 8, NULL),
    (727, 1629, 8, NULL),
    (728, 1630, 8, NULL),
    (729, 1631, 8, NULL),
    (730, 1632, 8, NULL),
    (731, 1633, 8, NULL),
    (732, 1634, 8, NULL),
    (733, 1635, 8, NULL),
    (734, 1636, 8, NULL),
    (735, 1637, 8, NULL),
    (736, 1638, 8, NULL),
    (737, 1639, 8, NULL),
    (738, 1640, 8, NULL),
    (739, 1641, 8, NULL),
    (740, 1642, 8, NULL),
    (741, 1643, 8, NULL),
    (742, 1644, 8, NULL),
    (743, 1645, 8, NULL),
    (744, 1646, 8, NULL),
    (745, 1647, 8, NULL),
    (746, 1648, 8, NULL),
    (747, 1649, 8, NULL),
    (748, 1650, 8, NULL),
    (749, 1651, 8, NULL),
    (750, 1652, 8, NULL),
    (751, 1653, 8, NULL),
    (752, 1654, 8, NULL),
    (753, 1655, 8, NULL),
    (754, 1656, 8, NULL),
    (755, 1657, 8, NULL),
    (756, 1658, 8, NULL),
    (757, 1659, 8, NULL),
    (758, 1660, 8, NULL),
    (759, 1661, 8, NULL),
    (760, 1662, 8, NULL),
    (761, 1663, 8, NULL),
    (762, 1664, 8, NULL),
    (763, 1665, 8, NULL),
    (764, 1666, 8, NULL),
    (765, 1667, 8, NULL),
    (766, 1668, 8, NULL),
    (767, 1669, 8, NULL),
    (768, 1670, 8, NULL),
    (769, 1671, 8, NULL),
    (770, 1672, 8, NULL),
    (771, 1673, 8, NULL),
    (772, 1674, 8, NULL),
    (773, 1675, 8, NULL),
    (774, 1676, 8, NULL),
    (775, 1677, 8, NULL),
    (776, 1678, 8, NULL),
    (777, 1679, 8, NULL),
    (778, 1680, 8, NULL),
    (779, 1681, 8, NULL),
    (780, 1682, 8, NULL),
    (781, 1683, 8, NULL),
    (782, 1684, 8, NULL),
    (783, 1685, 8, NULL),
    (784, 1686, 8, NULL),
    (785, 1687, 8, NULL),
    (786, 1688, 8, NULL),
    (787, 1689, 8, NULL),
    (788, 1690, 8, NULL),
    (789, 1691, 8, NULL),
    (790, 1692, 8, NULL),
    (791, 1693, 8, NULL),
    (792, 1694, 8, NULL),
    (793, 1695, 8, NULL),
    (794, 1696, 8, NULL),
    (795, 1697, 8, NULL),
    (796, 1698, 8, NULL),
    (797, 1699, 8, NULL),
    (798, 1700, 8, NULL),
    (799, 1701, 8, NULL),
    (800, 1702, 8, NULL),
    (801, 1703, 8, NULL),
    (802, 1886, 8, NULL),
    (803, 1887, 8, NULL),
    (804, 1888, 8, NULL),
    (805, 1889, 8, NULL),
    (806, 1890, 8, NULL),
    (807, 1891, 8, NULL),
    (841, 1894, 9, NULL),
    (847, 1706, 15, NULL),
    (848, 1713, 15, NULL),
    (849, 1718, 15, NULL),
    (850, 1726, 15, NULL),
    (851, 1730, 15, NULL),
    (852, 1742, 15, NULL),
    (853, 1743, 15, NULL),
    (854, 1744, 15, NULL),
    (855, 1745, 15, NULL),
    (856, 1746, 15, NULL),
    (857, 1747, 15, NULL),
    (858, 1748, 15, NULL),
    (859, 1749, 15, NULL),
    (860, 1750, 15, NULL),
    (861, 1751, 15, NULL),
    (862, 1752, 15, NULL),
    (863, 1753, 15, NULL),
    (864, 1754, 15, NULL),
    (865, 1755, 15, NULL),
    (866, 1756, 15, NULL),
    (867, 1757, 15, NULL),
    (868, 1758, 15, NULL),
    (869, 1759, 15, NULL),
    (870, 1760, 15, NULL),
    (871, 1761, 15, NULL),
    (872, 1762, 15, NULL),
    (873, 1731, 15, NULL),
    (874, 1732, 15, NULL),
    (875, 1733, 15, NULL),
    (876, 1734, 15, NULL),
    (877, 1735, 15, NULL),
    (878, 1736, 15, NULL),
    (879, 1737, 15, NULL),
    (880, 1738, 15, NULL),
    (881, 1739, 15, NULL),
    (882, 1740, 15, NULL),
    (883, 1741, 15, NULL),
    (884, 1727, 15, NULL),
    (885, 1728, 15, NULL),
    (886, 1729, 15, NULL),
    (887, 1719, 15, NULL),
    (888, 1720, 15, NULL),
    (889, 1721, 15, NULL),
    (890, 1722, 15, NULL),
    (891, 1723, 15, NULL),
    (892, 1724, 15, NULL),
    (893, 1725, 15, NULL),
    (894, 1714, 15, NULL),
    (895, 1715, 15, NULL),
    (896, 1716, 15, NULL),
    (897, 1717, 15, NULL),
    (898, 1707, 15, NULL),
    (899, 1708, 15, NULL),
    (900, 1709, 15, NULL),
    (901, 1710, 15, NULL),
    (902, 1711, 15, NULL),
    (903, 1712, 15, NULL),
    (905, 1763, 14, NULL),
    (906, 1764, 14, NULL),
    (907, 1765, 14, NULL),
    (908, 1766, 14, NULL),
    (909, 1767, 14, NULL),
    (910, 1771, 14, NULL),
    (911, 1775, 14, NULL),
    (912, 1782, 14, NULL),
    (913, 1791, 14, NULL),
    (914, 1800, 14, NULL),
    (915, 1801, 14, NULL),
    (916, 1802, 14, NULL),
    (917, 1803, 14, NULL),
    (918, 1792, 14, NULL),
    (919, 1793, 14, NULL),
    (920, 1794, 14, NULL),
    (921, 1795, 14, NULL),
    (922, 1796, 14, NULL),
    (923, 1797, 14, NULL),
    (924, 1798, 14, NULL),
    (925, 1799, 14, NULL),
    (926, 1783, 14, NULL),
    (927, 1784, 14, NULL),
    (928, 1785, 14, NULL),
    (929, 1786, 14, NULL),
    (930, 1787, 14, NULL),
    (931, 1788, 14, NULL),
    (932, 1789, 14, NULL),
    (933, 1790, 14, NULL),
    (934, 1776, 14, NULL),
    (935, 1777, 14, NULL),
    (936, 1778, 14, NULL),
    (937, 1779, 14, NULL),
    (938, 1780, 14, NULL),
    (939, 1781, 14, NULL),
    (940, 1772, 14, NULL),
    (941, 1773, 14, NULL),
    (942, 1774, 14, NULL),
    (943, 1768, 14, NULL),
    (944, 1769, 14, NULL),
    (945, 1770, 14, NULL),
    (947, 1804, 13, NULL),
    (948, 1813, 13, NULL),
    (949, 1816, 13, NULL),
    (950, 1819, 13, NULL),
    (951, 1821, 13, NULL),
    (952, 1825, 13, NULL),
    (953, 1829, 13, NULL),
    (954, 1833, 13, NULL),
    (955, 1838, 13, NULL),
    (956, 1845, 13, NULL),
    (957, 1852, 13, NULL),
    (958, 1858, 13, NULL),
    (959, 1861, 13, NULL),
    (960, 1862, 13, NULL),
    (961, 1863, 13, NULL),
    (962, 1864, 13, NULL),
    (963, 1865, 13, NULL),
    (964, 1859, 13, NULL),
    (965, 1860, 13, NULL),
    (966, 1853, 13, NULL),
    (967, 1854, 13, NULL),
    (968, 1855, 13, NULL),
    (969, 1856, 13, NULL),
    (970, 1857, 13, NULL),
    (971, 1846, 13, NULL),
    (972, 1847, 13, NULL),
    (973, 1848, 13, NULL),
    (974, 1849, 13, NULL),
    (975, 1850, 13, NULL),
    (976, 1851, 13, NULL),
    (977, 1839, 13, NULL),
    (978, 1840, 13, NULL),
    (979, 1841, 13, NULL),
    (980, 1842, 13, NULL),
    (981, 1843, 13, NULL),
    (982, 1844, 13, NULL),
    (983, 1834, 13, NULL),
    (984, 1835, 13, NULL),
    (985, 1836, 13, NULL),
    (986, 1837, 13, NULL),
    (987, 1830, 13, NULL),
    (988, 1831, 13, NULL),
    (989, 1832, 13, NULL),
    (990, 1826, 13, NULL),
    (991, 1827, 13, NULL),
    (992, 1828, 13, NULL),
    (993, 1822, 13, NULL),
    (994, 1823, 13, NULL),
    (995, 1824, 13, NULL),
    (996, 1820, 13, NULL),
    (997, 1817, 13, NULL),
    (998, 1818, 13, NULL),
    (999, 1814, 13, NULL),
    (1000, 1815, 13, NULL),
    (1001, 1805, 13, NULL),
    (1002, 1806, 13, NULL),
    (1003, 1807, 13, NULL),
    (1004, 1808, 13, NULL),
    (1005, 1809, 13, NULL),
    (1006, 1810, 13, NULL),
    (1007, 1811, 13, NULL),
    (1008, 1812, 13, NULL),
    (1286, 1687, 9, NULL),
    (1287, 1688, 9, NULL),
    (1288, 1689, 9, NULL),
    (1289, 1690, 9, NULL),
    (1290, 1691, 9, NULL),
    (1291, 1692, 9, NULL),
    (1292, 1693, 9, NULL),
    (1293, 1694, 9, NULL),
    (1294, 1695, 9, NULL),
    (1295, 1696, 9, NULL),
    (1296, 1697, 9, NULL),
    (1297, 1698, 9, NULL),
    (1298, 1699, 9, NULL),
    (1299, 1700, 9, NULL),
    (1300, 1701, 9, NULL),
    (1301, 1702, 9, NULL),
    (1302, 1703, 9, NULL);

    SET IDENTITY_INSERT Sources.SectionWeaponMap ON;


    MERGE INTO Sources.SectionWeaponMap t
    USING @SectionWeaponMap s
    ON t.SectionWeaponMapKey = s.SectionWeaponMapKey
    WHEN NOT MATCHED THEN
        INSERT
        (
            SectionWeaponMapKey,
            SectionKey,
            PrimaryWeaponKey,
            SecondaryWeaponKey
        )
        VALUES
        (s.SectionWeaponMapKey, s.SectionKey, s.PrimaryWeaponKey, s.SecondaryWeaponKey)
    WHEN MATCHED THEN
        UPDATE SET t.SectionKey = s.SectionKey,
                   t.PrimaryWeaponKey = s.PrimaryWeaponKey,
                   t.SecondaryWeaponKey = s.SecondaryWeaponKey;

    SET IDENTITY_INSERT Sources.SectionWeaponMap OFF;

END;
GO
