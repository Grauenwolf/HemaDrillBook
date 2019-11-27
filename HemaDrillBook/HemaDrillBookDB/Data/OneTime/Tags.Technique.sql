IF $(OneTimeLoad) = 1
BEGIN

DECLARE @Technique TABLE
(
    TechniqueKey INT PRIMARY KEY,
    TechniqueName NVARCHAR(100) NOT NULL,
    AlternateTechniqueName NVARCHAR(100) NULL
);

INSERT INTO @Technique
(
    TechniqueKey,
    TechniqueName,
    AlternateTechniqueName
)
VALUES
(1, N'Feint', NULL),
(10, N'Affondo', N'Thrust'),
(11, N'Allongiren', N'Lunge'),
(12, N'Allungo', N'Extension'),
(13, N'Arrebatar', N'Whip Away'),
(14, N'Ascendent', N'Ascending'),
(15, N'Assalto', N'Assault'),
(16, N'Battere', N'Beat'),
(17, N'Botta Dritta', N'Straight Blow'),
(18, N'Botte de paysan', N'Peasant Strike'),
(19, N'Contratempo', N'Counter-time'),
(20, N'Distesa', N'Stretch'),
(21, N'Draw cut', NULL),
(22, N'Stoccata Dritta', N'Straight Jab'),
(23, N'Estramacon', NULL),
(24, N'Falso', N'False'),
(25, N'Falso Dritto', N'False Straight'),
(26, N'Falso Manco', N'False handed'),
(27, N'Fendente', N'To the Teeth'),
(28, N'Foyne', NULL),
(29, N'Imbrocatta', N'Indirect Thrust'),
(30, N'Long Thrust', NULL),
(31, N'Fendente Discendente Dritto', N'Straight Descending Slash'),
(33, N'Discendente', N'Descending'),
(34, N'Fendente Ascendente Dritto', N'Straight Ascending Slash'),
(35, N'Sgualembrato Ascendente', NULL),
(36, N'Mandritto', N'Straight-Handed'),
(37, N'Mandritto Fendente', N'Straight-handed Slash'),
(38, N'Mandritto Squalembrato', NULL),
(39, N'Mandritto Tondo', N'Straight-handed Round'),
(40, N'Montante', N'Mast'),
(41, N'Mountanto', NULL),
(42, N'Pede Ferme', N'Fixed Foot'),
(43, N'Punta', N'Point'),
(44, N'Punta Diritta Ascendente', N'Straight, Ascending Point'),
(45, N'Punta Diritta Discendente', N'Straight, Descending Point'),
(46, N'Punta Ferma Diritta', N'Straight Firm Point'),
(47, N'Punta in Falso', N'False Point'),
(48, N'Punta Reversa', N'Reverse Point'),
(49, N'Punta Sopramano', N'Overhand Point'),
(50, N'Punta Sottomano', N'Underhand Point'),
(51, N'Punta Trivellata', N'Drilled Point'),
(52, N'Redoppio', N'Redouble'),
(53, N'Repose', N'Rest'),
(54, N'Repousseren', N'Fend Off'),
(55, N'Riposta', N'Response'),
(56, N'Roverso', N'Reverse'),
(57, N'Roverso Ascendente', N'Reverse Asscending'),
(58, N'Roverso Fendente', N'Reverse Slash'),
(59, N'Roverso Squalembrato', NULL),
(60, N'Roverso Tondo', N'Reverse Round'),
(61, N'Slope Stocke', NULL),
(62, N'Sotto Botta', N'Under Blow'),
(63, N'Sottomano', N'Under-hand'),
(64, N'Squalembrato', N'Diagonal'),
(65, N'Stocada', NULL),
(66, N'Stocatta', N'Thrust'),
(67, N'Stocatta Lunga', N'Long Thrust'),
(68, N'Stockada or Right Stock', NULL),
(69, N'Stop-Thrust', NULL),
(70, N'Stramazone', NULL),
(71, N'Stromacione', NULL),
(72, N'Taglio', N'Cut'),
(73, N'Thrust', NULL),
(74, N'Tondo', N'Round'),
(75, N'Tramazzone', N'Turn of the Wrist'),
(76, N'Alongate', NULL),
(77, N'Appelliren', NULL),
(78, N'Atajo', NULL),
(79, N'Attaquiren', NULL),
(80, N'Battiren', NULL),
(81, N'Battuta', N'Beat'),
(82, N'Beat', NULL),
(83, N'Bind', NULL),
(84, N'Block', NULL),
(85, N'Camineering', NULL),
(86, N'Cavatione', NULL),
(87, N'Cavazione', N'Disengage'),
(88, N'Cavazione de tempo', N'Disengage in Time'),
(89, N'Cave', NULL),
(90, N'Cavere', NULL),
(91, N'Caviren', NULL),
(93, N'Circuleren', N'Circulate'),
(94, N'Concave', NULL),
(95, N'Constrain', NULL),
(97, N'Contracavazione', N'Counter-disengage'),
(98, N'Contro-cavazione', N'Counter-Disengagement'),
(99, N'Coupe’', N'Cut-off'),
(100, N'Cover', NULL),
(101, N'Deflection', NULL),
(102, N'Desvio', N'Detour'),
(103, N'Disarmiren', NULL),
(104, N'Engage', NULL),
(105, N'Engagement', NULL),
(106, N'Engagiren', N'Engage'),
(107, N'Faintiren or Fainte', N'Feint'),
(108, N'Find the Sword', NULL),
(109, N'Finda', NULL),
(110, N'Finta', N'Feint'),
(112, N'Gaining the Blade', NULL),
(115, N'Invitation', NULL),
(116, N'Lanciare la Punta', N'Fling'),
(117, N'Ligeren', NULL),
(120, N'Mezza Cavazione ', N'Half Disengage'),
(121, N'Occupare la Spade', NULL),
(124, N'Parry', NULL),
(128, N'Redoublement', NULL),
(133, N'Ricavazione', N'Redisengage'),
(134, N'Riposte', NULL),
(135, N'Rispondere', N'Riposting'),
(136, N'Rumperen', NULL),
(137, N'Scandiaglio', NULL),
(138, N'Sessiren', NULL),
(139, N'Slip', NULL),
(140, N'Strengere or Attack', NULL),
(141, N'Stringere', N'Tighten'),
(142, N'Stringering', NULL),
(143, N'Stringiren', NULL),
(144, N'Toccata di Spada', N'Touch Sword'),
(145, N'Trovar di Spada', N'Finding the Sword'),
(146, N'Abdomen', N'Timing of Two'),
(147, N'Ablauffen', N'Running Off'),
(148, N'Abneme', N'Taking Away'),
(149, N'Abschneiden', N'Slicing Off'),
(151, N'Absetzen', N'Setting Off'),
(153, N'Abzug', N'Withdrawing Cuts'),
(154, N'Alber', NULL),
(155, N'Altibaxo', N'Up and Down'),
(156, N'Anbinden', N'Binding'),
(157, N'Ansetzen', N'Placing'),
(158, N'Apply Stickiness', NULL),
(159, N'Arrièremain', N'Backhand'),
(162, N'Ausreissen', N'Wrenching'),
(163, N'Außnemen mit Halber Schneid', N'Taking out with the Short Edge'),
(164, N'Außschlagen mit Hangender Kling', N'Striking Out with Hanging Blade'),
(165, N'Avant-Main', N'Forehand'),
(166, N'Backwards/back', NULL),
(167, N'Bandoleer Cut', NULL),
(169, N'Beating', NULL),
(170, N'Beating the Steel', NULL),
(171, N'Bleiben', N'Remaining'),
(173, N'Blendthauw', N'Blind Cut'),
(176, N'Bochhauw', N'Knocking Cut'),
(177, N'Bock Cut', NULL),
(178, N'Botonazo', N'Insistence'),
(179, N'Bow Foin', N'Bowed Point'),
(180, N'Bow thrust', NULL),
(181, N'Breaking Through', NULL),
(182, N'Broken', NULL),
(183, N'Brummerhauw', N'Roarer Cut'),
(184, N'Buzzer Cut', NULL),
(185, N'Canillazo', NULL),
(187, N'Colpi', N'Strikes'),
(188, N'Colpi Fendente', N'Downward Strike'),
(189, N'Colpi Mezzani', N'Middle/Horizontal Strike'),
(190, N'Colpi Sottani', N'Upward Strike'),
(191, N'Colpo di Punta D’Arresto', N'Stop-Thrust'),
(192, N'Colpo di Villano', N'Villain’s Strike'),
(193, N'Continuous Cut', NULL),
(194, N'Cornada', N'Goring'),
(195, N'Cortacodo', N'Cut to the Elbow'),
(196, N'Corvazo', N'Blow to the Hamstring'),
(197, N'Counter-Time', NULL),
(198, N'Coverta', N'Cover'),
(199, N'Creizhaw', N'Crossing Strike'),
(200, N'Cross Rake', NULL),
(201, N'Cuchillada a las Piernas', N'Cut to the Legs'),
(202, N'Cuff Cut, Inside', NULL),
(203, N'Cuff Cut, Outside', NULL),
(204, N'Cuff Cut, Reverse', NULL),
(205, N'Cut and Slash', NULL),
(206, N'Defendida', N'Defender'),
(208, N'Dempffen', N'Suppressing'),
(209, N'Dempffhauw', N'Suppressing Cut'),
(210, N'Dérober', N'Hide'),
(211, N'Derribarse', N'Falling'),
(212, N'Desjarretadera', N'Hamstringer'),
(213, N'Desplante', N'Snub or Uproot'),
(214, N'Disengaging', NULL),
(215, N'Diversion', NULL),
(216, N'Doplieren', N'Doubling'),
(217, N'Doppel Rundstreich', N'Double Round Strike'),
(218, N'Doppel Stich', N'Double Thrust'),
(219, N'Doppelhauw', N'Double Cut'),
(220, N'Double', NULL),
(221, N'Double Feint', NULL),
(222, N'Double Hits', NULL),
(223, N'Downright stroke', NULL),
(224, N'Dritto Traversato', N'Straight Crossed Over'),
(225, N'Durchgehn', N'Going Through'),
(226, N'Durchtritt', N'Step-through'),
(227, N'Durchwechslen', N'Changing Through'),
(228, N'Durchwinden', N'Winding Through'),
(229, N'Durchzucken', N'Pulling Through'),
(230, N'dz Redel', N'Little Wheel'),
(231, N'Einfachen Sturtz', N'Open Drop'),
(232, N'Eingelegt', N'Placed'),
(233, N'Einlauffen', N'Running In'),
(234, N'El Codazo', N'Poke'),
(235, N'El Quiebro', N'Bend'),
(236, N'Elza e Fugie', N'??? and Flee'),
(237, N'Elza e Tira', N'??? and Pull'),
(238, N'Enarcada', N'Curving'),
(239, N'Engavilanada', N'Crossguarded'),
(240, N'Entrüsthau', N'Disarming Stroke'),
(241, N'Entrüsthauw', N'Anger Cut'),
(242, N'Espinillazo', N'Blow to the Shin'),
(243, N'Estoc', N'Thrust'),
(244, N'Estocada a la Mano', N'Thrust to the Hand'),
(245, N'Estocada de Puño', N'Punching the Point'),
(246, N'Falling stroke ', NULL),
(248, N'Falso Impuntanto', NULL),
(250, N'Falso Traversato', N'False Crossed'),
(251, N'Fehien', N'Failing'),
(252, N'Fehlhauw', N'Failing Cut'),
(256, N'Fifth Approach', NULL),
(259, N'Fire and Stones Cut ', NULL),
(260, N'First Approach', NULL),
(261, N'First Point', NULL),
(262, N'Five Approaches', NULL),
(263, N'Flank Cut, Inside', NULL),
(264, N'Flank Cut, Outside', NULL),
(265, N'Flechstreich', N'Flat strike'),
(266, N'Fliegender Stich', N'Flying Thrust'),
(267, N'Flinching', NULL),
(268, N'Flowing Water Cut ', NULL),
(269, N'Flügelhau', N'Winging Strike'),
(270, N'Forwards/fore', NULL),
(271, N'Fourth Approach', NULL),
(273, N'Fugge e Cruove', N'Flee and Cross'),
(274, N'Fühlen', N'Feeling'),
(276, N'Full stroke', NULL),
(277, N'Fußhauw', N'Foot Cut'),
(278, N'Ganancia y Reganancia', N'Gaining  and Regaining'),
(279, N'Garatusa', N'Scrawl'),
(280, N'Gefehrhauw', N'Danger Cut'),
(281, N'Geferhau', N'Endangering Stroke'),
(282, N'Gemechtsich', N'Groin Thrust'),
(283, N'Gesichtich', N'Face Thrust'),
(284, N'Glancing Cut', NULL),
(285, N'Glützhauw', N'Clashing Cut'),
(286, N'Gripping the Sword', NULL),
(287, N'Gschlossen Sturtz', N'Closed Drop'),
(288, N'Gurgelstich', N'Throat Thrust'),
(289, N'Halbhaw', N'Half-strike'),
(290, N'Half Blow', NULL),
(291, N'Half Hauke', NULL),
(292, N'Halßhauw', N'Neck Cut'),
(293, N'Handtarbeit', N'Handwork'),
(294, N'Handthauw', N'Hand Cut'),
(295, N'Harassing cuts', NULL),
(296, N'Head Cut', NULL),
(297, N'Hendtrucken', N'Pressing Hands'),
(298, N'Hengen', N'Hanging'),
(299, N'Herzstich', N'Heart Thrust'),
(300, N'Hew', N'Cut'),
(301, N'High Cut', NULL),
(302, N'Hüffthauw', N'Hip Cut'),
(304, N'Imbroccata Riversa', NULL),
(305, N'Imbronccade', NULL),
(306, N'Impuntare/Impuntanto', N'Stumble or Trip'),
(307, N'Kniecheihauw', N'Wrist Cut'),
(308, N'Kreizhaw', NULL),
(309, N'Kreutzhauw', N'Cross Cut'),
(310, N'Krieghau', N'War Strike'),
(311, N'Kron', N'Crown'),
(312, N'Kronhauw', N'Crown Cut'),
(313, N'Krump', N'Crooked'),
(314, N'Krumphau', N'Crooked Cut'),
(315, N'Kurtzhauw', N'Short Cut'),
(316, N'Lang Zornort', N'Long Point of Wrath'),
(317, N'Ligadura di Sotto', NULL),
(318, N'Ligadura Mezana', NULL),
(319, N'Ligadura Soprana', NULL),
(320, N'Maindroit', N'Right-Hand'),
(322, N'Mandritto Sotano', NULL),
(323, N'Medio Reves', NULL),
(324, N'Medio Tajo', NULL),
(325, N'Meisterhau', N'Master Strikes'),
(326, N'Meza Mella', N'Half-Blade'),
(327, N'Meza Spada', N'Half-Sword'),
(328, N'Mezza Volta', N'Half Turn'),
(329, N'Mezzano', NULL),
(330, N'Mezzo', N'Half'),
(331, N'Mezzo Mandritti', N'Half Straight'),
(333, N'Mezzo Volta di Mano', N'Half-turn of the Hand'),
(334, N'Middlecut', NULL),
(335, N'Mittel', N'Middle Cut'),
(339, N'Mittlehauw', N'Middle Cut'),
(340, N'Molinello', N'Spinning Wheel'),
(341, N'Molinetto', NULL),
(343, N'Moulinet', NULL),
(344, N'Move the Shade', NULL),
(345, N'Mutieren', N'Mutate'),
(346, N'Mutuare', N'Mutation'),
(347, N'Nachreisen', N'Following After'),
(348, N'Nehmen', N'Taking or Displacing'),
(350, N'Oberhau', N'High Cut'),
(351, N'Oberhauw', N'High Cut'),
(352, N'Oberhauw Schlims', N'Diagonal High Cut'),
(353, N'Ochs and Pflug', NULL),
(354, N'Over-Bind', NULL),
(355, N'Parade', N'Parry'),
(356, N'Parere', NULL),
(358, N'Point', NULL),
(359, N'Ponta', N'Thrust'),
(360, N'Prellhauw', N'Rebound Cut'),
(361, N'Prese', NULL),
(362, N'Proffer and Rake', NULL),
(363, N'Pummel', NULL),
(364, N'Punta de Aremeso', N'Throw the Point'),
(365, N'Punta de Punho', N'Punching Thrust'),
(366, N'Punta Riversa', N'Reverse Point'),
(368, N'Punte/Punta/Punto', N'Point'),
(369, N'Quarter Blow', NULL),
(370, N'Quebrarse', N'Bending'),
(371, N'Quick Cut', NULL),
(372, N'Rake', NULL),
(373, N'Rasgar', N'Ripping'),
(374, N'Rebattere', N'Beat'),
(375, N'Red Leaves Cut', NULL),
(376, N'Redoubling', NULL),
(377, N'Reitzen', N'Provoking Cuts'),
(378, N'Renvers', N'Reverse'),
(379, N'Requebrarse', N'Leaning'),
(380, N'Romper', N'Breaking'),
(381, N'Rosen', N'Rose'),
(382, N'Rosenhauw', N'Rose Cut'),
(384, N'Rota', N'Rotation or Wheel'),
(385, N'Round', NULL),
(386, N'Roverso di Gamba Levata', NULL),
(387, N'Roverso Sotano', NULL),
(388, N'Rundstreich', N'Round Strike'),
(389, N'Rüsthauw', N'Armor Cut'),
(390, N'Reves', NULL),
(391, N'Revés Ascendente', NULL),
(392, N'Revés orizontal ', NULL),
(393, N'Revez', N'Reverse'),
(394, N'Ridoppio', N'Redouble'),
(395, N'Ridoppio Falso Manco', N'Redoubled False Hand'),
(396, N'Rinde', N'Looping'),
(398, N'Riverso', N'Reverse'),
(399, N'Riverso Spinto', N'Pushed Reverse'),
(400, N'Schedelhauw', N'Scalp Cut'),
(401, N'Scheibe', N'Slice'),
(402, N'Scheitelhauw', N'Scalp Cut'),
(403, N'Schielhauw', N'Squinting Cut'),
(405, N'Schiltslach', N'Shield Strike'),
(406, N'Schlaudern', N'Slinging'),
(407, N'Schneiden', N'Slicing'),
(408, N'Schneller', N'Flick'),
(409, N'Schnellhauw', N'Flicking Cut'),
(410, N'Schnitt', N'Slice'),
(411, N'Second Approach', NULL),
(412, N'Second Point', NULL),
(413, N'Sfalsata', N'Offset'),
(414, N'Short Sword Chopping', NULL),
(416, N'Smacking Parry ', NULL),
(417, N'Sotano', NULL),
(418, N'Sottani', N'Under Strokes'),
(419, N'Sperren', N'Barring'),
(421, N'Stich', N'Thrust'),
(422, N'Stichslach', N'Thrust Strike'),
(423, N'Stoccata', N'Thrust'),
(424, N'Stoccata Riversa', N'Reverse Thrust'),
(425, N'Stomping the steel', NULL),
(426, N'Stop Hit', NULL),
(427, N'Straight Parrying', NULL),
(428, N'Stramazzone', NULL),
(429, N'Streich', N'Slash'),
(430, N'Streithauw', N'Strife Cut'),
(431, N'Sturtzhauw', N'Plunge Cut'),
(432, N'Swinger Cut', NULL),
(433, N'Tagli', NULL),
(434, N'Tajo', NULL),
(435, N'Tajo Ascendente ', NULL),
(436, N'Tajo Orizontal', NULL),
(437, N'Tajo y reves al brazo', N'Cut and Reverse Cut to the Arm'),
(438, N'Talho', N'Slash'),
(439, N'Thigh Cut, Inside', NULL),
(440, N'Thigh Cut, Outside', NULL),
(441, N'Third Approach', NULL),
(442, N'Third Point', NULL),
(443, N'Three Wounders', NULL),
(445, N'Thrusting Feints', NULL),
(446, N'Tira e Intra', N'Pull and ???'),
(448, N'Tramazzoncello', NULL),
(450, N'Traversing Strike', NULL),
(451, N'Trivalatto', NULL),
(452, N'Tutta Volta', N'Full Turn'),
(453, N'Ubergreiffen', N'Gripping Over'),
(454, N'Überlauffen', N'Overreach'),
(455, N'Überzwerch', NULL),
(456, N'Überzwerchhauw', NULL),
(457, N'Umbschlagen', N'Striking Around'),
(458, N'Umbschnappen', N'Snapping Around'),
(459, N'Under Stop Thrust', NULL),
(460, N'Under-Bind', NULL),
(461, N'Undercut', NULL),
(462, N'Underhauw', N'Under Cut'),
(463, N'Vatterstreich', N'Father'),
(464, N'Verfierte Stich', N'Deceitful Thrust'),
(465, N'Verfliegen', N'Flitting'),
(466, N'Verführen', N'Deceiving'),
(467, N'Verhengen', N'Hanging'),
(468, N'Verkehren', N'Reversing'),
(469, N'Verkehrter Stich', N'Reversed Thrust'),
(470, N'Verschieben', N'Sliding'),
(471, N'Versetzen', N'Parrying'),
(472, N'Verstüllen', N'Blocking'),
(473, N'Verzukten Haw', N'Whipping Away Strike'),
(474, N'Vokerer', NULL),
(475, N'Volta Intera', N'Full Turn'),
(476, N'Volta Stabile', N'Stable Turn'),
(477, N'Voltani', NULL),
(478, N'Wechselhauw', N'Change Cut'),
(479, N'Wechseln', N'Changing'),
(480, N'Weckerhau', N'Awakening Stroke'),
(481, N'Weckerhauw', N'Waker Cut'),
(482, N'Winden', N'Winding, Turning'),
(483, N'Windthauw', N'Winding Cut'),
(484, N'Wrathcut', NULL),
(485, N'Wrist Blow', NULL),
(486, N'Zambullida', N'Plunging'),
(487, N'Zeckrur', N'Tag-Hit'),
(488, N'Zirckel', N'Circle'),
(489, N'Zornhuaw', N'Wrath Cut'),
(490, N'Zornlini', N'Wrath Line'),
(491, N'Zornort', N'Wrath Point'),
(492, N'Zucken', N'Pulling or Twitching'),
(493, N'Zwerch', N'Thwart'),
(494, N'Zwerchlini', N'Thwart Line'),
(495, N'Zwingerhau', N'Constraining Stroke'),
(496, N'Zwingerhauw', N'Constrainer Cut'),
(497, N'Lateral Falso', NULL),
(498, N'Feint Montante', NULL),
(499, N'Feint Mandritto', NULL),
(500, N'Feint Riverso', NULL),
(501, N'Buckler defends head', NULL),
(502, N'Attack', NULL),
(503, N'Feint Stramazone', NULL),
(504, N'Void', NULL),
(505, N'Sword under Buckler', NULL),
(506, N'Half Mandritto', NULL),
(507, N'Off-hand Parry', NULL),
(508, N'Cut', NULL),
(509, N'Mutate', NULL),
(510, N'Einschiessen', N'Shooting In'),
(511, N'Long Edge Cut', NULL),
(512, N'Short Edge Cut, Uncrossed Arms', NULL),
(513, N'Short Edge Cut, Crossed Arms', NULL),
(514, N'Flat Strike, Outside', NULL),
(516, N'Flat Strike, Inside', NULL),
(519, N'Parry with Falso', NULL),
(520, N'Slice', NULL),
(521, N'Join Sword and Buckler', NULL),
(522, N'Sideways Riverso', NULL),
(524, N'Short Edge Cut', NULL),
(525, N'Pull up for a stroke', NULL),
(526, N'Schielhauw, Crossed Arms', N'Squinting Cut'),
(527, N'Parry with Outside Flat', NULL);

SET IDENTITY_INSERT Tags.Technique ON;

MERGE INTO Tags.Technique t
USING @Technique s
ON t.TechniqueKey = s.TechniqueKey
WHEN NOT MATCHED THEN
    INSERT
    (
        TechniqueKey,
        TechniqueName,
        AlternateTechniqueName
    )
    VALUES
    (s.TechniqueKey, s.TechniqueName, s.AlternateTechniqueName)
WHEN MATCHED THEN
    UPDATE SET TechniqueName = s.TechniqueName,
               AlternateTechniqueName = s.AlternateTechniqueName;

SET IDENTITY_INSERT Tags.Technique OFF;


END
GO