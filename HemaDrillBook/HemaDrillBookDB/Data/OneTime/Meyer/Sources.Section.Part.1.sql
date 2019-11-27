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
(1869, 1, NULL, N'Chapter 1', NULL, 1, 'Chapter-1'),
(1870, 1, NULL, N'Chapter 2', NULL, 1.2, 'Chapter-2'),
(1002, 1, NULL, N'Chapter 3', NULL, 1.3, 'Chapter-3'),
(1003, 1, 1002, N'Ochs (Ox)', NULL, 1, 'Ochs'),
(1004, 1, 1002, N'Pflug (Plow)', NULL, 2, 'Pflug'),
(1005, 1, 1002, N'Tag (Day or Roof)', NULL, 3, 'Tag'),
(1006, 1, 1002, N'Olber (Fool)', NULL, 4, 'Olber'),
(1007, 1, 1002, N'Zornhut (Wrath Guard)', NULL, 5, 'Zornhut'),
(1008, 1, 1002, N'Langort (Longpoint)', NULL, 6, 'Langort'),
(1009, 1, 1002, N'Wechsel (Changer)', NULL, 7, 'Wechsel'),
(1010, 1, 1002, N'Nebenhut (Side Guard)', NULL, 8, 'Nebenhut'),
(1011, 1, 1002, N'Eisenport (Iron Gate) 1', NULL, 9, 'Eisenport-1'),
(1012, 1, 1002, N'Eisenport (Iron Gate) 2', NULL, 10, 'Eisenport-2'),
(1013, 1, 1002, N'Hangetort (Hanging Point)', NULL, 11, 'Hangetort'),
(1014, 1, 1002, N'Schlüssel (Key)', NULL, 12, 'Schlüssel'),
(1015, 1, 1002, N'Eynhorn (Unicorn)', NULL, 13, 'Eynhorn'),
(1016, 1, 1002, N'Flügel (Winging)', NULL, 14, 'Flügel'),
(1017, 1, 1002, N'Cutting Patterns', NULL, 15, 'Cutting-Patterns'),
(1018, 1, NULL, N'Chapter 4', NULL, 2, 'Chapter-4'),
(1019, 1, 1018, N'Oberhauw (High Cut)', NULL, 1, 'Oberhauw'),
(1020, 1, 1018, N'Zornhauw (Wrath Cut)', NULL, 2, 'Zornhauw'),
(1021, 1, 1018, N'Mittelhauw (Middle Cut)', NULL, 3, 'Mittelhauw'),
(1022, 1, 1018, N'Underhauw (Low Cut)', NULL, 4, 'Underhauw'),
(1023, 1, 1018, N'Schielhauw (Squinting Cut)', N'1.11v.2', 5, 'Schielhauw'),
(1024, 1, 1018, N'Krumphauw (Crooked Cut)', N'1.12v.1', 6, 'Krumphauw'),
(1025, 1, 1018, N'Zwerch (Thwart)', NULL, 7, 'Zwerch'),
(1026, 1, 1018, N'Kurtzhauw (Short Cut)', N'1.12v.3', 8, 'Kurtzhauw'),
(1027, 1, 1018, N'Glützhauw (Clashing Cut)', NULL, 9, 'Glützhauw'),
(1028, 1, 1018, N'Prellhauw (Rebound Cut) 1', N'1.13r.2', 10, 'Prellhauw-1'),
(1029, 1, 1018, N'Prellhauw (Rebound Cut) 2', N'1.13r.3', 11, 'Prellhauw-2'),
(1030, 1, 1018, N'Blendthauw (Blind Cut)', N'1.14r.1', 12, 'Blendthauw'),
(1031, 1, 1018, N'Windthauw (Winding Cut)', N'1.14r.2', 13, 'Windthauw'),
(1032, 1, 1018, N'Kronhauw (Crown Cut)', N'1.14r.3', 14, 'Kronhauw'),
(1033, 1, 1018, N'Kniechelhauw (Wrist Cut)', N'1.14v.1', 15, 'Kniechelhauw'),
(1034, 1, 1018, N'Sturzhauw (Plunge Cut)', NULL, 16, 'Sturzhauw'),
(1035, 1, 1018, N'Wechselhauw (Change Cut)', NULL, 17, 'Wechselhauw'),
(1036, 1, 1018, N'Schneller oder Zeckrur (Flick or Tag-Hit)', NULL, 18, 'Schneller-oder-Zeckrur'),
(1037, 1, NULL, N'Chapter 5', NULL, 3, 'Chapter-5'),
(1038, 1, 1037, N'Nachreisen (Chasing or Following After) 1', N'1.17v.1', 1, 'Nachreisen-1'),
(1866, 1, 1037, N'Some Useful Advice about Parrying (Versetzen)', N'1.16v.1', 1, 'Some-Useful-Advice-about-Parrying'),
(1039, 1, 1037, N'Nachreisen (Chasing or Following After) 2', N'1.18r.1', 2, 'Nachreisen-2'),
(1040, 1, 1037, N'Schneiden (Slicing)', N'1.18r.2', 3, 'Schneiden'),
(1041, 1, 1037, N'Umbschlagen (Striking Around)', N'1.18r.3', 4, 'Umbschlagen'),
(1042, 1, 1037, N'Ablauffen (Running Off)', N'1.18r.4', 5, 'Ablauffen'),
(1043, 1, 1037, N'Verfuhren (Deceiving)', NULL, 6, 'Verfuhren'),
(1044, 1, 1037, N'Verfliegen (Flitting)', NULL, 7, 'Verfliegen'),
(1045, 1, 1037, N'Absetzen (Setting Off)', N'1.18v.1', 8, 'Absetzen'),
(1046, 1, 1037, N'Schlaudern (Slinging)', N'1.19r.1', 9, 'Schlaudern'),
(1047, 1, 1037, N'Zucken (Pulling)', N'1.19r.2', 10, 'Zucken'),
(1048, 1, 1037, N'Doplieren (Doubling)', N'1.19r.3', 11, 'Doplieren'),
(1049, 1, 1037, N'Verkehren (Reversing)', N'1.19v.1', 12, 'Verkehren'),
(1050, 1, 1037, N'Umbschnappen (Snapping Around) 1', N'1.19v.2', 13, 'Umbschnappen-1'),
(1051, 1, 1037, N'Umbschnappen (Snapping Around) 2', N'1.19v.3', 14, 'Umbschnappen-2'),
(1052, 1, 1037, N'Fehlen (Failing)', N'1.19v.4', 15, 'Fehlen'),
(1053, 1, 1037, N'Zirckel (Circle)', N'1.20v.1', 16, 'Zirckel'),
(1054, 1, 1037, N'Rinde (Looping)', NULL, 17, 'Rinde'),
(1055, 1, 1037, N'Winden (Winding)', N'1.20r.1', 18, 'Winden'),
(1056, 1, 1037, N'Durchwinden (Winding Through)', NULL, 19, 'Durchwinden'),
(1057, 1, 1037, N'Wechseln (Changing) 1', N'1.21r.3', 20, 'Wechseln-1'),
(1867, 1, 1037, N'Wechseln (Changing) 2', N'1.21v.1', 20, 'Wechseln-2'),
(1058, 1, 1037, N'Abschneiden (Slicing Off)', N'1.21v.2', 21, 'Abschneiden'),
(1059, 1, 1037, N'Hendtrucken (Pressing Hands)', N'1.21v.3', 22, 'Hendtrucken'),
(1060, 1, 1037, N'Verschieben (Sliding)', N'1.22r.1', 23, 'Verschieben'),
(1061, 1, 1037, N'Hengen (Hanging)', N'1.22r.2', 24, 'Hengen'),
(1062, 1, 1037, N'Aussreissen (Wrenching)', N'1.22r.3', 25, 'Aussreissen'),
(1063, 1, 1037, N'Sperren (Barring)', N'1.22v.1', 26, 'Sperren'),
(1064, 1, 1037, N'Verstullen (Blocking)', NULL, 27, 'Verstullen'),
(1065, 1, 1037, N'Ubergreiffen (Gripping Over)', N'1.22v.3', 28, 'Ubergreiffen'),
(1066, 1, 1037, N'Einlauffen (Running In)', NULL, 29, 'Einlauffen'),
(1871, 1, NULL, N'Chapter 6', NULL, 3.9, 'Chapter-6'),
(1067, 1, NULL, N'Chapter 7', NULL, 4, 'Chapter-7'),
(1068, 1, 1067, N'Three Forms of Stepping', NULL, 1, 'Stepping'),
(1875, 1, NULL, N'Chapter 8', NULL, 4.5, 'Chapter-8'),
(1069, 1, NULL, N'Chapter 9', NULL, 5, 'Chapter-9'),
(1070, 1, 1069, N'Example Device 1', N'1.26r.1', 1, 'Example-Device-1'),
(1071, 1, 1069, N'Example Device 2', N'1.26v.1', 2, 'Example-Device-2'),
(1072, 1, NULL, N'Chapter 10', NULL, 6, 'Chapter-10'),
(1073, 1, 1072, N'Pattern 1', N'1.27v.1', 1, 'Pattern-1'),
(1074, 1, 1072, N'Pattern 1 with the Short Edge', NULL, 2, 'Pattern-1-Short-Edge'),
(1075, 1, 1072, N'Pattern 1 with the Flats', NULL, 3, 'Pattern-1-Flats'),
(1076, 1, 1072, N'Pattern 2', N'1.28v.1', 4, 'Pattern-2'),
(1077, 1, 1072, N'Pattern 3', N'1.28v.2', 5, 'Pattern-3'),
(1078, 1, 1072, N'Pattern 4', N'1.29r.1', 6, 'Pattern-4'),
(1079, 1, 1072, N'Pattern 5', N'1.29r.2', 7, 'Pattern-5'),
(1080, 1, 1072, N'Pattern 6', N'1.29r.3', 8, 'Pattern-6'),
(1081, 1, 1072, N'Pattern 7', N'1.29v.1', 9, 'Pattern-7'),
(1082, 1, 1072, N'Pattern 8', N'1.29v.2', 10, 'Pattern-8'),
(1083, 1, 1072, N'Pattern 9', N'1.29v.3', 11, 'Pattern-9'),
(1084, 1, 1072, N'Pattern 10', N'1.29v.4', 12, 'Pattern-10'),
(1085, 1, 1072, N'Pattern 11', N'1.30r.1', 13, 'Pattern-11'),
(1086, 1, 1072, N'Pattern 12', N'1.30r.2', 14, 'Pattern-12'),
(1087, 1, NULL, N'Chapter 11', NULL, 7, 'Chapter-11'),
(1088, 1, 1087, N'Tag (Day)', NULL, 1, 'Ch11-Tag'),
(1089, 1, 1088, N'Tag Device 1', N'1.31v.1', 1, 'Tag-Device-1'),
(1090, 1, 1088, N'Tag Device 2', N'1.31v.2', 2, 'Tag-Device-2'),
(1091, 1, 1088, N'Tag Device 3', N'1.32r.1', 3, 'Tag-Device-3'),
(1092, 1, 1088, N'Tag Device 4', N'1.32r.2', 4, 'Tag-Device-4'),
(1093, 1, 1088, N'Tag Device 5 Variant of 4', N'1.33r.1', 5, 'Tag-Device-5'),
(1094, 1, 1088, N'Tag Device 6 Another', N'1.33r.2', 6, 'Tag-Device-6'),
(1095, 1, 1088, N'Tag Device 7 Counter', N'1.33v.1', 7, 'Tag-Device-7'),
(1096, 1, 1088, N'Tag Device 8', N'1.33v.2', 8, 'Tag-Device-8'),
(1097, 1, 1087, N'Zornhut (Wrath Guard)', NULL, 2, 'Ch11-Zornhut'),
(1098, 1, 1097, N'Zornhut Device 1', N'1.34v.1', 1, 'Zornhut-Device-1'),
(1099, 1, 1097, N'Zornhut Device 2', N'1.34v.2', 2, 'Zornhut-Device-2'),
(1100, 1, 1097, N'Zornhut Device 3', N'1.35r.1', 3, 'Zornhut-Device-3'),
(1101, 1, 1097, N'Zornhut Device 4', N'1.35r.2', 4, 'Zornhut-Device-4'),
(1868, 1, 1097, N'Zornhut Device 5', N'1.35r.3', 4, 'Zornhut-Device-5'),
(1102, 1, 1097, N'Zornhut Precept', N'1.35v.1', 5, 'Zornhut-Precept'),
(1103, 1, 1097, N'Zornhut Left Side', N'1.35v.2', 6, 'Zornhut-Left-Side'),
(1104, 1, 1087, N'Ochs (Ox)', NULL, 3, 'Ch11-Ochs'),
(1105, 1, 1104, N'Ochs Device 1', N'1.36r.1', 1, 'Ochs-Device-1'),
(1106, 1, 1104, N'Ochs Device 2', N'1.36v.1', 2, 'Ochs-Device-2'),
(1107, 1, 1087, N'Einhorn (Unicorn)', NULL, 4, 'Ch11-Einhorn'),
(1108, 1, 1107, N'Eynhorn Device 1', N'1.37v.1', 1, 'Eynhorn-Device-1'),
(1109, 1, 1107, N'Eynhorn Device 2', N'1.37v.2', 2, 'Eynhorn-Device-2'),
(1110, 1, 1107, N'Eynhorn Device 3', N'1.38r.1', 3, 'Eynhorn-Device-3'),
(1111, 1, 1107, N'Eynhorn Device 4', N'1.38r.2', 4, 'Eynhorn-Device-4'),
(1112, 1, 1087, N'Schlussel (Key)', NULL, 5, 'Ch11-Schlussel'),
(1113, 1, 1112, N'Schlüssel Device 1', N'1.38v.1', 1, 'Schlüssel-Device-1'),
(1114, 1, 1112, N'Schlüssel Device 2', N'1.38v.2', 2, 'Schlüssel-Device-2'),
(1115, 1, 1087, N'Hangetort (Hanging Point)', NULL, 6, 'Ch11-Hangetort'),
(1116, 1, 1115, N'Hangetort Device 1', N'1.39v.1', 1, 'Hangetort-Device-1'),
(1117, 1, 1115, N'Hangetort Device 2', N'1.39v.2', 2, 'Hangetort-Device-2'),
(1118, 1, 1115, N'Hangetort Device 3', N'1.39v.3', 3, 'Hangetort-Device-3'),
(1119, 1, 1087, N'Eisenport (Iron Gate)', NULL, 7, 'Ch11-Eisenport'),
(1120, 1, 1119, N'Eisenport (actually Schrankhut) Device 1', N'1.40r.1', 1, 'Eisenport-Device-1'),
(1121, 1, 1119, N'Eisenport (actually Schrankhut) Device 2', N'1.40r.2', 2, 'Eisenport-Device-2'),
(1122, 1, 1119, N'Eisenport (actually Schrankhut) Device 3', N'1.40r.3', 3, 'Eisenport-Device-3'),
(1123, 1, 1119, N'Eisenport (actually Schrankhut) Device 4', N'1.40r.4', 4, 'Eisenport-Device-4'),
(1124, 1, 1087, N'Nebenhut (Side Guard)', NULL, 8, 'Ch11-Nebenhut'),
(1125, 1, 1124, N'Nebenhut Device 1', N'1.40r.5', 1, 'Nebenhut-Device-1'),
(1126, 1, 1087, N'Mittelhut (Middle Guard)', NULL, 9, 'Ch11-Mittelhut'),
(1127, 1, 1126, N'Mittelhut Device 1', N'1.40v.1', 1, 'Mittelhut-Device-1'),
(1128, 1, 1126, N'Mittelhut Device 2 a.k.a. Rose 1', N'1.40v.2', 2, 'Mittelhut-Device-2'),
(1129, 1, 1126, N'Mittelhut Device 3', N'1.40v.3', 3, 'Mittelhut-Device-3'),
(1130, 1, 1087, N'Langort (Long Point)', NULL, 10, 'Ch11-Langort'),
(1131, 1, 1130, N'Langort Device 1', N'1.41r.1', 1, 'Langort-Device-1'),
(1132, 1, 1130, N'Langort Device 2 a.k.a. Rose 2', N'1.41r.2', 2, 'Langort-Device-2'),
(1133, 1, 1130, N'Langort Device 3 a.k.a. Rose 3', N'1.41r.3', 3, 'Langort-Device-3'),
(1134, 1, 1130, N'Langort Device 4 a.k.a. Rose 4', N'1.41r.4', 4, 'Langort-Device-4'),
(1135, 1, 1130, N'Langort Device 5', N'1.41r.5', 5, 'Langort-Device-5'),
(1136, 1, 1130, N'Langort Device 6', N'1.42r.1', 6, 'Langort-Device-6'),
(1137, 1, 1130, N'Langort Device 7 a.k.a. Rose 5', N'1.42r.2', 7, 'Langort-Device-7'),
(1138, 1, 1130, N'Langort Device 8 a.k.a. Rose 5 alternate ending', N'1.42r.3', 8, 'Langort-Device-8'),
(1139, 1, 1087, N'Wechsel (Changer)', NULL, 11, 'Ch11-Wechsel'),
(1140, 1, 1139, N'Wechsel Device 1', N'1.42r.4', 1, 'Wechsel-Device-1'),
(1141, 1, 1139, N'Wechsel Device 2', N'1.42v.1', 2, 'Wechsel-Device-2'),
(1142, 1, 1087, N'Brechfenster (Break Window)', NULL, 12, 'Ch11-Brechfenster'),
(1143, 1, 1142, N'Brechfenster Device 1', N'1.42v.2', 1, 'Brechfenster-Device-1'),
(1144, 1, 1142, N'Brechfenster Device 2', N'1.42v.3', 2, 'Brechfenster-Device-2'),
(1145, 1, 1142, N'Brechfenster Device 3', N'1.43r.1', 3, 'Brechfenster-Device-3'),
(1146, 1, 1142, N'Brechfenster Device 4', N'1.43r.2', 4, 'Brechfenster-Device-4'),
(1147, 1, 1142, N'Brechfenster Device 5', N'1.43r.3', 5, 'Brechfenster-Device-5'),
(1148, 1, 1142, N'Brechfenster Device 6', N'1.43r.4', 6, 'Brechfenster-Device-6'),
(1872, 1, NULL, N'Part 3', NULL, 8, 'Part-3'),
(1149, 1, 1872, N'Zornhut (Wrath Guard)', NULL, 13, 'Ch12-Zornhut'),
(1150, 1, 1149, N'Zornhut 1', N'1.46r.1', 1, 'Zornhut-1'),
(1151, 1, 1872, N'Krumphauw (Crooked Strike)', NULL, 14, 'Ch12-Krumphauw-a'),
(1152, 1, 1151, N'Krumphauw 1', N'1.47r.1', 1, 'Krumphauw-1'),
(1153, 1, 1151, N'Krumphauw 2', N'1.47v.1', 2, 'Krumphauw-2'),
(1154, 1, 1872, N'Zirckel (Circle)', NULL, 15, 'Ch12-Zirckel'),
(1155, 1, 1154, N'Zirckel 1', N'1.47v.2', 1, 'Zirckel-1'),
(1156, 1, 1154, N'Zirckel 2 (A Good Device with the Circle)', N'1.47v.3', 2, 'Zirckel-2'),
(1157, 1, 1872, N'Verkehren (Reversing)', NULL, 16, 'Ch12-Verkehren'),
(1158, 1, 1157, N'Verkehren 1 with Counter (A Fine Device with Reversing)', N'1.48v.1', 1, 'Verkehren-1'),
(1159, 1, 1872, N'Krumphauw (Crooked Strike cont.)', NULL, 17, 'Ch12-Krumphauw-b'),
(1160, 1, 1159, N'Krumphauw 3 with Counter', N'1.48v.3', 1, 'Krumphauw-3'),
(1161, 1, 1872, N'Zucken (Pulling)', NULL, 18, 'Ch12-Zucken'),
(1162, 1, 1161, N'Zucken 1', N'1.49v.2', 1, 'Zucken-1'),
(1163, 1, 1161, N'Zucken 2', N'1.49v.3', 2, 'Zucken-2'),
(1164, 1, 1161, N'Zucken 3', N'1.49v.4', 3, 'Zucken-3'),
(1165, 1, 1161, N'Zucken 4', N'1.49v.5', 4, 'Zucken-4'),
(1166, 1, 1872, N'Durchwinden (Winding Through)', NULL, 19, 'Ch12-Durchwinden'),
(1167, 1, 1166, N'Durchwinden 1', N'1.50r.1', 1, 'Durchwinden-1'),
(1168, 1, 1166, N'Durchwinden 2', N'1.50r.2', 2, 'Durchwinden-2'),
(1169, 1, 1872, N'Zeckrur (Tag Hit)', NULL, 20, 'Ch12-Zeckrur'),
(1170, 1, 1169, N'Zeckrur 1', N'1.50r.3', 1, 'Zeckrur-1'),
(1171, 1, 1169, N'Zeckrur 2', N'1.50r.4', 2, 'Zeckrur-2'),
(1172, 1, 1872, N'Durchschiessen (Shooting Through)', NULL, 21, 'Ch12-Durchschiessen'),
(1173, 1, 1172, N'Durchschiessen 1', N'1.50v.1', 1, 'Durchschiessen-1'),
(1174, 1, 1172, N'Durchschiessen 2', N'1.50v.2', 2, 'Durchschiessen-2'),
(1175, 1, 1872, N'Krumphauw (Crooked Strike revisted)', NULL, 22, 'Ch12-Krumphauw-c'),
(1176, 1, 1175, N'Krumphauw 4', N'1.51r.1', 1, 'Krumphauw-4'),
(1177, 1, 1872, N'Schneller (Flicking)', NULL, 23, 'Ch12-Schneller'),
(1178, 1, 1177, N'Schneller 1', N'1.51r.2', 1, 'Schneller-1'),
(1179, 1, 1177, N'Schneller 2', N'1.51v.1', 2, 'Schneller-2'),
(1181, 1, 1872, N'Brutes', NULL, 24, 'Ch12-Brutes'),
(1182, 1, 1181, N'Brute 1 (Another)', N'1.51v.2', 1, 'Brute-1'),
(1183, 1, 1181, N'Brute 2', N'1.52v.1', 2, 'Brute-2'),
(1184, 1, 1872, N'Schielhauw (Squinter)', NULL, 25, 'Ch12-Schielhauw-a'),
(1185, 1, 1184, N'Schielhauw 1 (Counter against the Squinter)', N'1.52v.2', 1, 'Schielhauw-1'),
(1186, 1, 1184, N'Schielhauw 2', N'1.53r.1', 2, 'Schielhauw-2'),
(1187, 1, 1872, N'Pflug (Plow)', NULL, 26, 'Ch12-Pflug'),
(1188, 1, 1187, N'Pflug 1 (Counter against Plow)', N'1.53r.2', 1, 'Pflug-1'),
(1189, 1, 1872, N'Langort (Longpoint)', NULL, 27, 'Ch12-Langort'),
(1190, 1, 1189, N'Langort 1 (Counter against Longpoint)', N'1.53r.3', 1, 'Langort-1'),
(1191, 1, 1189, N'Langort 2', N'1.53v.1', 2, 'Langort-2'),
(1192, 1, 1872, N'Schielhauw (Squinter cont.)', NULL, 28, 'Ch12-Schielhauw-b'),
(1193, 1, 1192, N'Schielhauw 3 (Another Device with the Squinter)', N'1.53v.2', 1, 'Schielhauw-3'),
(1194, 1, 1192, N'Schielhauw 4 (Doubling the Squinter)', N'1.54r.1', 2, 'Schielhauw-4'),
(1195, 1, 1192, N'Schielhauw 5', N'1.54r.2', 3, 'Schielhauw-5'),
(1196, 1, 1192, N'Schielhauw 6 (The Third Squinter is a Deceit with the Face)', N'1.54r.3', 4, 'Schielhauw-6'),
(1197, 1, 1192, N'Schielhauw 7 (Note a Deft Device with the Squinter)', N'1.54r.4', 5, 'Schielhauw-7'),
(1198, 1, 1872, N'Wechseln (Changing Through)', NULL, 29, 'Ch12-Wechseln'),
(1199, 1, 1198, N'Wechseln 1 (Concerning Changing Through)', N'Item 1', 1, 'Ch12-Wechseln-1'),
(1200, 1, 1198, N'Wechseln 2', N'Item 2', 2, 'Ch12-Wechseln-2'),
(1201, 1, 1872, N'Zwerch (Thwart)', NULL, 30, 'Ch12-Zwerch-a'),
(1202, 1, 1201, N'Zwerch 1', N'1.55r.1', 1, 'Zwerch-1'),
(1203, 1, 1201, N'Zwerch 2', N'1.55v.1', 2, 'Zwerch-2'),
(1204, 1, 1201, N'Zwerch 3', N'1.56v.1', 3, 'Zwerch-3'),
(1205, 1, 1201, N'Zwerch 4', N'1.56v.2', 4, 'Zwerch-4'),
(1206, 1, 1872, N'Fehlen (Feint or Failing)', NULL, 31, 'Ch12-Fehlen'),
(1207, 1, 1206, N'Fehlen 1', N'1.57r.1', 1, 'Fehlen-1'),
(1208, 1, 1206, N'Fehlen 2', N'1.57r.2', 2, 'Fehlen-2'),
(1209, 1, 1206, N'Fehlen 3 (A Failer with a False Step)', N'1.57r.3', 3, 'Fehlen-3'),
(1210, 1, 1206, N'Fehlen 4 (Twofold or Double Failing)', N'1.57r.4', 4, 'Fehlen-4'),
(1211, 1, 1206, N'Fehlen 5 (Another with the Double Failer)', N'1.58r.1', 5, 'Fehlen-5'),
(1212, 1, 1872, N'Zwerch (Thwart cont.)', NULL, 32, 'Ch12-Zwerch-b'),
(1213, 1, 1212, N'Zwerch 5 (Counter against the Thwart)', N'1.58r.2', 1, 'Zwerch-5'),
(1214, 1, 1212, N'Zwerch 6', N'1.58r.3', 2, 'Zwerch-6'),
(1215, 1, 1872, N'On Stepping', NULL, 33, 'On-Stepping'),
(1216, 1, 1215, N'Stepping 1', N'1.59r.1', 1, 'Stepping-1'),
(1217, 1, 1872, N'Schneiden (Slicing)', NULL, 34, 'Ch12-Schneiden'),
(1218, 1, 1217, N'Schneiden 1 (...through the mouth)', N'Item', 1, 'Schneiden-1'),
(1219, 1, 1217, N'Schneiden 2', N'1.59r.2', 2, 'Schneiden-2'),
(1220, 1, 1217, N'Schneiden 3', N'1.59r.3', 3, 'Schneiden-3'),
(1221, 1, 1872, N'Nachreisen (Chasing)', NULL, 35, 'Ch12-Nachreisen'),
(1222, 1, 1221, N'Nachreisen 1', N'1.59v.1', 1, 'Ch12-Nachreisen-1'),
(1223, 1, 1221, N'Nachreisen 2', N'1.59v.2', 2, 'Ch12-Nachreisen-2'),
(1873, 1, 1221, N'Nachreisen 3', N'1.59v.3', 3, 'Ch12-Nachreisen-3'),
(1224, 1, 1872, N'Kron (Crown)', NULL, 36, 'Ch12-Kron'),
(1225, 1, 1224, N'Kron 1', N'1.60v.1', 1, 'Kron-1'),
(1226, 1, 1872, N'Streich (Slash)', NULL, 37, 'Ch12-Streich'),
(1227, 1, 1226, N'Streich 1', N'1.60v.2', 1, 'Streich-1'),
(1228, 1, 1226, N'Streich 2', N'1.61r.1', 2, 'Streich-2'),
(1229, 1, 1872, N'Blendthauw (Blind Cut)', NULL, 38, 'Ch12-Blendthauw'),
(1230, 1, 1229, N'Blendthauw 1', N'1.61r.2', 1, 'Blendthauw-1'),
(1231, 1, 1872, N'Grappling', NULL, 39, 'Ch12-Grappling'),
(1232, 1, 1231, N'Grappling 1 with Counter (Concerning this grappling and wrestling...)', N'1.61v.1', 1,
 'Grappling-1'),
(1233, 1, 1231, N'Grappling 2 (Another)', N'1.61v.2', 2, 'Grappling-2'),
(1234, 1, 1231, N'Grappling 3', N'1.62r.1', 3, 'Grappling-3'),
(1235, 1, 1231, N'Grappling 4', N'1.61r.2', 4, 'Grappling-4'),
(1236, 1, 1231, N'Grappling 5', N'1.62r.3', 5, 'Grappling-5'),
(1874, 1, 1231, N'Grappling 6 (Counter)', N'1.62v.1', 5, 'Grappling-6'),
(1237, 1, 1872, N'Einlauffen (Running In)', NULL, 40, 'Ch12-Einlauffen'),
(1238, 1, 1237, N'Einlauffen 1 (Another devices against running in)', N'1.62v.2', 1, 'Einlauffen-1'),
(1239, 1, 1872, N'Casting (Throwing)', NULL, 41, 'Ch12-Casting'),
(1240, 1, 1239, N'Casting 1', N'1.62v.3', 1, 'Casting-1'),
(1241, 1, 1239, N'Casting 2', N'1.62v.4', 2, 'Casting-2'),
(1242, 1, 1239, N'Casting 3', N'1.63r.1', 3, 'Casting-3'),
(1243, 1, 1239, N'Casting 4 (Another)', N'1.63r.2', 4, 'Casting-4'),
(1244, 1, 1239, N'Casting 5 (Another)', N'1.63r.3', 5, 'Casting-5'),
(1245, 1, 1872, N'Hengen (Hanging)', NULL, 42, 'Ch12-Hengen'),
(1246, 1, 1245, N'Hengen 1 (How you shall wind in and out of the low hanging)', N'1.63v.1', 1, 'Hengen-1'),
(1247, 1, 1245, N'Hengen 2', N'1.63v.2', 2, 'Hengen-2'),
(1248, 1, 1245, N'Hengen 3', N'1.64r.1', 3, 'Hengen-3'),
(1249, 1, 1245, N'Hengen 4 (How you shall carry out the inward hangings and windings from above in the work)',
 N'1.64r.2', 4, 'Hengen-4'),
(1250, 1, 1245, N'Hengen 5', N'1.64r.3', 5, 'Hengen-5'),
(1251, 1, 1872, N'Oberhauw (High Cut)', NULL, 43, 'Ch12-Oberhauw'),
(1252, 1, 1251, N'Oberhauw 1 (A Good Counter Against all High Cuts)', N'1.64v.1', 1, 'Oberhauw-1');


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