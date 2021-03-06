IF $(OneTimeLoad) = 1
BEGIN

DECLARE @Footwork TABLE
(
    FootworkKey INT NOT NULL PRIMARY KEY,
    FootworkName NVARCHAR(100) NOT NULL,
    AlternateFootworkName NVARCHAR(100) NULL
);

INSERT INTO @Footwork
(
    FootworkKey,
    FootworkName,
    AlternateFootworkName
)
VALUES
(1, N'Pass left foot forward', NULL),
(2, N'Pass right foot forward', NULL),
(3, N'Accrescimento', N'Increase'),
(4, N'Advancing Step', NULL),
(5, N'Appel', NULL),
(6, N'Cacciata', N'Expulsion'),
(7, N'Cambio di Piedi', N'Foot Swap'),
(8, N'Cavalcata', N'Ride?'),
(9, N'Changing Step', NULL),
(10, N'Chasing Step', NULL),
(11, N'Circling', NULL),
(12, N'Circular Step', NULL),
(13, N'Compass Step', NULL),
(14, N'Crossing Step', NULL),
(15, N'Decrescimento', NULL),
(16, N'Disengaging', NULL),
(17, N'Escampavita', N'Escaping'),
(18, N'Escapar el Cuerpo', N'Escaping the Body'),
(19, N'Gathering Step', NULL),
(21, N'Gran Paso', N'Big Step'),
(22, N'Gran Passata', NULL),
(23, N'Great Step', NULL),
(24, N'Incartata', NULL),
(25, N'Increase Right Foot', NULL),
(26, N'Increase Left Foot', NULL),
(27, N'L’uno piede cacci l’altro avanti', NULL),
(28, N'Levare uno piede', NULL),
(29, N'Librar', N'Freeing'),
(31, N'Librar el Cuerpo', N'Freeing the Body'),
(32, N'Mezzo Paso', N'Half Step'),
(33, N'Mezzo passo', NULL),
(35, N'Orbiting', NULL),
(36, N'Paso', N'Simple Step'),
(37, N'Passare di traverso', NULL),
(38, N'Passare di triangulo', NULL),
(39, N'Passata', N'Passed'),
(41, N'Passere', NULL),
(42, N'Passo de Roda', N'Wheeling Step'),
(43, N'Passo intiero', NULL),
(44, N'Passo Traverso', N'Oblique Pass'),
(45, N'Pie de Roda', N'Wheeling Step'),
(46, N'Push Step', NULL),
(47, N'Raddoppio', N'Redoubling'),
(48, N'Retreat', NULL),
(49, N'Ricresere di passi', NULL),
(52, N'Ripresa di Piedi', NULL),
(53, N'Salto', N'Jump'),
(54, N'Schifata', N'Lateral Dodge'),
(55, N'Side Step', NULL),
(56, N'Slope-step', NULL),
(57, N'Torneada', N'Turning'),
(59, N'Trapassare', N'Multiple pass'),
(62, N'Void', NULL),
(63, N'Voiding the Foot', NULL),
(64, N'Volte', NULL),
(65, N'Abtritt', N'Back Step'),
(67, N'Ausspringen', N'Springing Out'),
(68, N'Broken Step', NULL),
(74, N'Concordant Step', NULL),
(76, N'Discordant Step', NULL),
(77, N'Durchlauffen', N'Run Through'),
(78, N'Full spring ', NULL),
(81, N'Gebrochen Tritt', N'Broken Step'),
(82, N'Mezza Volta', N'Half Turn'),
(83, N'Oblique Pass', NULL),
(85, N'Passing Step', NULL),
(87, N'Schritt', N'Stride'),
(88, N'Setting', NULL),
(89, N'Short spring', NULL),
(91, N'Spring', NULL),
(92, N'Stolen Step', NULL),
(93, N'Trapassata', N'Passing Through'),
(94, N'Tutta Volta', N'Full Turn'),
(95, N'Uberlauffen', N'Running Over'),
(97, N'Volta Stabile', N'Stable Turn'),
(98, N'verstolen Tritt', N'Stolen Step'),
(99, N'Zwifach Tritt', N'Double Step'),
(101, N'Advance', NULL),
(102, N'Commanding', NULL),
(103, N'First Position', NULL),
(104, N'Floating Foot', NULL),
(105, N'Glue and Lacquer Emulsion Body', NULL),
(106, N'Half-Volte', NULL),
(107, N'Jumping Foot', NULL),
(108, N'Lunge', NULL),
(109, N'Pass', NULL),
(111, N'Retire', NULL),
(112, N'Second Position', NULL),
(113, N'Shifting', NULL),
(114, N'Slipping', NULL),
(115, N'Springing Step', NULL),
(116, N'Third Position', NULL),
(117, N'Traverse', NULL),
(118, N'Treading Foot', NULL),
(120, N'Volte, Left or Outside', NULL),
(121, N'Volte, Right or Inside', NULL),
(122, N'Yin-Yang Foot', NULL),
(123, N'Pass left foot to his right', NULL),
(124, N'Pass right foot to his left', NULL),
(125, N'Pass left foot to his left', NULL),
(126, N'Pass right foot to his right', NULL),
(127, N'Pass left foot to his right with right foot following behind', NULL),
(128, N'Pass right foot to his left with left foot following behind', NULL),
(129, N'Pass left foot backward', NULL),
(130, N'Pass right foot backward', NULL),
(131, N'Step forward with right foot', NULL),
(132, N'Step forward with left foot', NULL),
(133, N'Transverse Step', NULL),
(134, N'Pass to his body', NULL),
(135, N'Girata', NULL),
(136, N'Girata of the right foot', NULL),
(137, N'Girata of the left foot', NULL),
(138, N'Lunge with the right foot', NULL),
(139, N'Lunge with the left foot', NULL),
(140, N'Step', NULL),
(141, N'Gather right foot forward then pass left foot forward', NULL),
(142, N'Gather left foot forward then pass right foot forward', NULL),
(143, N'Recover back', NULL),
(144, N'Step wide with left foot', NULL),
(145, N'Step wide with right foot', NULL),
(146, N'Step back with left foot', NULL),
(147, N'Step back with right foot', NULL),
(148, N'Step Back', NULL),
(149, N'Step to opponent with left behind right', NULL),
(150, N'Back step left behind the right', NULL),
(151, N'Spring to opponent''s left', NULL),
(152, N'Withdraw', NULL),
(153, N'Step to Opponent''s Left', NULL),
(154, N'Step to Opponent''s Right', NULL);

SET IDENTITY_INSERT Tags.Footwork ON;

MERGE INTO Tags.Footwork t
USING @Footwork s
ON t.FootworkKey = s.FootworkKey
WHEN NOT MATCHED THEN
    INSERT
    (
        FootworkKey,
        FootworkName,
        AlternateFootworkName
    )
    VALUES
    (s.FootworkKey, s.FootworkName, s.AlternateFootworkName)
WHEN MATCHED THEN
    UPDATE SET FootworkName = s.FootworkName,
               AlternateFootworkName = s.AlternateFootworkName;

SET IDENTITY_INSERT Tags.Footwork OFF;


END
GO
