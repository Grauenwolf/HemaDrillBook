UPDATE Sources.Book SET WiktenauerUrl ='http://wiktenauer.com/wiki/Joachim_Meyer' WHERE BookKey = 1; --A Thorough Description of the Art of Fencing
UPDATE Sources.Book SET WiktenauerUrl ='http://wiktenauer.com/wiki/Walpurgis_Fechtbuch_(MS_I.33)' WHERE BookKey = 2; --MS I.33
UPDATE Sources.Book SET WiktenauerUrl ='http://wiktenauer.com/wiki/Diogo_Gomes_de_Figueyredo' WHERE BookKey = 3; --Memorial Da Prattica do Montante
UPDATE Sources.Book SET WiktenauerUrl ='http://wiktenauer.com/wiki/Antonio_Manciolino' WHERE BookKey = 5; --Opera Nova
UPDATE Sources.Book SET WiktenauerUrl ='http://wiktenauer.com/wiki/Giovanni_dall%27Agocchie' WHERE BookKey = 6; --Dell'Arte di Scrima Libri Tre
UPDATE Sources.Book SET WiktenauerUrl ='http://wiktenauer.com/wiki/Salvator_Fabris' WHERE BookKey = 7; --Lo Schermo, overo Scienza d’Arme

SET IDENTITY_INSERT Translations.Translator ON;
INSERT INTO Translations.Translator
(
    TranslatorKey,
    TranslatorName,
    CreatedByUserKey,
    ModifiedByUserKey
)
VALUES
(2, N'Jeffrey Forgeng', -1, -1),
(3, 'Joey  Nitti', -1, -1),
(4, 'Tom Leoni', -1, -1);
SET IDENTITY_INSERT Translations.Translator OFF;

INSERT INTO Translations.Translation
(
    BookKey,
    TranslatorKey,
    TranslationTitle,
    TranslationUrl,
    CreatedByUserKey,
    ModifiedByUserKey
)
VALUES
(1, 2, N'The Art of Combat: A German Martial Arts Treatise of 1570',
 N'https://www.amazon.com/Art-Combat-German-Martial-Treatise/dp/1848327781', -1, -1),
(2, 2, 'The Medieval Art of Swordsmanship: Royal Armouries MS I.33',
 'https://www.amazon.com/Medieval-Art-Swordsmanship-Royal-Armouries/dp/0948092858', -1, -1),
(2, 3, 'Royal  Armouries Ms.  I.33', 'https://hemastudy.wordpress.com/2016/05/05/new-translation-of-ms-i-33/', -1, -1),
(5, 4, 'The Complete Renaissance Swordsman: A Guide to the Use of All Manner of Weapons: Antonio Manciolino''s Opera Nova (1531)', 'https://www.amazon.com/Complete-Renaissance-Swordsman-Weapons-Manciolinos/dp/0982591136', -1, -1),
(7, 4, 'Fabris', 'http://www.lulu.com/shop/tom-leoni/fabris/paperback/product-23607565.html', -1, -1),
(9, 4, 'Fiore de'' Liberi''s Fior di Battaglia', 'http://www.lulu.com/shop/tom-leoni/fiore-de-liberis-fior-di-battaglia/paperback/product-5364635.html', -1, -1)
;



