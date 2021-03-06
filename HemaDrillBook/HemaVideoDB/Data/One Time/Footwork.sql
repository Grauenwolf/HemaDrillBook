﻿DECLARE @Footwork TABLE
(
    FootworkKey INT NOT NULL,
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
(1, 'Pass left foot forward', NULL),
(2, 'Pass right foot forward', NULL),
(3,'Accrescimento', 'Increase'),
(4,'Advancing Step', NULL),
(5,'Appel', NULL),
(6,'Cacciata', 'Expulsion'),
(7,'Cambio di Piedi', 'Foot Swap'),
(8,'Cavalcata', 'Ride?'),
(9,'Changing Step', NULL),
(10,'Chasing Step', NULL),
(11,'Circling', NULL),
(12,'Circular Step', NULL),
(13,'Compass Step', NULL),
(14,'Crossing Step', NULL),
(15,'Decrescimento', NULL),
(16,'Disengaging', NULL),
(17,'Escampavita', 'Escaping'),
(18,'Escapar el Cuerpo', 'Escaping the Body'),
(19,'Gathering Step', NULL),
(21,'Gran Paso', 'Big Step'),
(22,'Gran Passata', NULL),
(23,'Great Step', NULL),
(24,'Incartata', NULL),
(25,'Increase Right Foot', NULL),
(26,'Increase Left Foot', NULL),
(27,'L’uno piede cacci l’altro avanti', NULL),
(28,'Levare uno piede', NULL),
(29,'Librar', 'Freeing'),
(31,'Librar el Cuerpo', 'Freeing the Body'),
(32,'Mezzo Paso', 'Half Step'),
(33,'Mezzo passo', NULL),
(35,'Orbiting', NULL),
(36,'Paso', 'Simple Step'),
(37,'Passare di traverso', NULL),
(38,'Passare di triangulo', NULL),
(39,'Passata', 'Passed'),
(41,'Passere', NULL),
(42,'Passo de Roda', 'Wheeling Step'),
(43,'Passo intiero', NULL),
(44,'Passo Traverso', 'Oblique Pass'),
(45,'Pie de Roda', 'Wheeling Step'),
(46,'Push Step', NULL),
(47,'Raddoppio', 'Redoubling'),
(48,'Retreat', NULL),
(49,'Ricresere di passi', NULL),
(52,'Ripresa di Piedi', NULL),
(53,'Salto', 'Jump'),
(54,'Schifata', 'Lateral Dodge'),
(55,'Side Step', NULL),
(56,'Slope-step', NULL),
(57,'Torneada', 'Turning'),
(59,'Trapassare', 'Multiple pass'),
(62,'Void', NULL),
(63,'Voiding the Foot', NULL),
(64,'Volte', NULL),
(65,'Abtritt', 'Back Step'),
(67,'Ausspringen', 'Springing Out'),
(68,'Broken Step', NULL),
(74,'Concordant Step', NULL),
(76,'Discordant Step', NULL),
(77,'Durchlauffen', 'Run Through'),
(78,'Full spring ', NULL),
(81,'Gebrochen Tritt', 'Broken Step'),
(82,'Mezza Volta', 'Half Turn'),
(83,'Oblique Pass', NULL),
(85,'Passing Step', NULL),
(87,'Schritt', 'Stride'),
(88,'Setting', NULL),
(89,'Short spring', NULL),
(91,'Spring', NULL),
(92,'Stolen Step', NULL),
(93,'Trapassata', 'Passing Through'),
(94,'Tutta Volta', 'Full Turn'),
(95,'Uberlauffen', 'Running Over'),
(97,'Volta Stabile', 'Stable Turn'),
(98,'verstolen Tritt', 'Stolen Step'),
(99,'Zwifach Tritt', 'Double Step'),
(101,'Advance', NULL),
(102,'Commanding', NULL),
(103,'First Position', NULL),
(104,'Floating Foot', NULL),
(105,'Glue and Lacquer Emulsion Body', NULL),
(106,'Half-Volte', NULL),
(107,'Jumping Foot', NULL),
(108,'Lunge', NULL),
(109,'Pass', NULL),
(111,'Retire', NULL),
(112,'Second Position', NULL),
(113,'Shifting', NULL),
(114,'Slipping', NULL),
(115,'Springing Step', NULL),
(116,'Third Position', NULL),
(117,'Traverse', NULL),
(118,'Treading Foot', NULL),
(120,'Volte, Left or Outside', NULL),
(121,'Volte, Right or Inside', NULL),
(122,'Yin-Yang Foot', NULL),
(123, 'Pass left foot to his right', NULL),
(124, 'Pass right foot to his left', NULL),
(125, 'Pass left foot to his left', NULL),
(126, 'Pass right foot to his right', NULL),
(127, 'Pass left foot to his right with right foot following behind', NULL),
(128, 'Pass right foot to his left with left foot following behind', NULL),
(129, 'Pass left foot backward', NULL),
(130, 'Pass right foot backward', NULL),
(131, 'Step forward with right foot', NULL),
(132, 'Step forward with left foot', NULL),
(133, 'Transverse Step', NULL),
(134, 'Pass to his body', NULL),
(135, 'Girata', NULL),
(136, 'Girata of the right foot', NULL),
(137, 'Girata of the left foot', NULL),
(138, 'Lunge with the right foot', NULL),
(139, 'Lunge with the left foot', NULL),
(140, 'Step', NULL);

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
WHEN MATCHED AND t.FootworkName != s.FootworkName OR t.AlternateFootworkName != s.AlternateFootworkName THEN
    UPDATE SET t.FootworkName = s.FootworkName, t.AlternateFootworkName=s.AlternateFootworkName
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;
