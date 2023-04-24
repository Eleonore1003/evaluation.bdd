--Créer table cinema
DROP TABLE IF EXISTS 'cinema';
CREATE TABLE cinema (
    id_cinema INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR (100) NOT NULL,
    adresse VARCHAR (500) NOT NULL,
    FOREIGN KEY (administrateur_id) REFERENCES administrateur(id),
    FOREIGN KEY (seance_id) REFERENCES seance(id),
    FOREIGN KEY (film_id) REFERENCES film(id),
)
ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--Valeurs cinema 
INSERT INTO cinema 
VALUES 
    ('1', 'Cinéma La Clef', '34 Rue Daubenton', '75005', 'Paris'),
    ('2', 'Les 5 Caumartin', '101 Rue Saint-Lazare', '75009', 'Paris'),
    ('3', 'Les Pionniers Du Cinéma', '36 Rue Godefroy Cavaignac', '75011', 'Paris'),
    ('4', 'Pathé Alésia', '73 Av. du Général Leclerc', '75014', 'Paris')


--Créer table seance
DROP TABLE IF EXISTS 'seance';
CREATE TABLE seance (
    id_seance INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    horaire DATETIME NOT NULL,
    FOREIGN KEY (cinema_id) REFERENCES cinema(id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(id),
    FOREIGN KEY (salle_id) REFERENCES salle(id),
    FOREIGN KEY (film_id) REFERENCES film(id),
    FOREIGN KEY (administrateur_id) REFERENCES administateur(id)
)
ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--Valeurs seance
INSERT INTO seance 
VALUES
    ('1', '2023-06-17 16:45:00'),
    ('2', '2023-05-23 13:15:00'),
    ('3', '2023-04-12 15:30:00'),
    ('4', '2023-04-30 20:45:00'),
    ('5', '2023-06-03 11:15:00'),
    ('6', '2023-03-10 17:30:00'),
    ('7', '2023-06-21 14:45:00');

--Trier par ordre croissant 
SELECT *
FROM seance 
ORDER BY horaire ASC


--Créer table salle 
DROP TABLE IF EXISTS 'salle';
CREATE TABLE salle (
    id_salle INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    place INT(5) NOT NULL,
    numSalle INT(5) NOT NULL,
    FOREIGN KEY (seance_id) REFERENCES seance(id)
)
ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--Valeurs salle 
INSERT INTO salle 
VALUES 
    ('1', '300', 'n°10'),
    ('2', '250', 'n°03'),
    ('3', '125', 'n°05'),
    ('4', '105', 'n°15'),
    ('5', '350', 'n°08'),
    ('6', '215', 'n°06'),
    ('7', '175', 'n°12');


--Créer table film 
DROP TABLE IF EXISTS 'film';
CREATE TABLE film (
    id_film INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR (100) NOT NULL,
    duree TIME DEFAULT NULL,
    FOREIGN KEY (cinema_id) REFERENCES cinema(id),
    FOREIGN KEY (seance_id) REFERENCES seance(id),
    FOREIGN KEY (administateur_id) REFERENCES administrateur(id)
)
ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--Valeurs film
INSERT INTO film 
VALUES 
    ('1', 'Athena', '01:39:00'),
    ('2', 'Mascarade', '02:22:00'),
    ('3', 'Luther : Soleil déchu', '02:09:00'),
    ('4', 'Smile', '01:55:00'),
    ('5', 'Tetris', '01:58:00'),
    ('6', 'Jumeaux mais pas trop', '01:38:00'),
    ('7', 'Finch', '01:55:00');


--Créer table adminnistrateur 
DROP TABLE IF EXISTS 'administrateur';
CREATE TABLE administrateur (
    id_administrateur INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR (75) NOT NULL,
    FOREIGN KEY (cinema_id) REFERENCES cinema(id),
    FOREIGN KEY (film_id) REFERENCES film(id),
    FOREIGN KEY (seance_id) REFERENCES seance(id)
)
ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--Valeurs administrateur 
INSERT INTO administrateur 
VALUES 
    ('1', 'Martin', 'Robert'),
    ('2', 'Lefebvre', 'Michel'),
    ('3', 'Roux', 'Louis'),
    ('4', 'Dupuis', 'Hugo');


--Créer table réservation 
DROP TABLE IF EXISTS 'reservation';
CREATE TABLE reservation (
    id_reservation INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    paiement VARCHAR (100) NOT NULL,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id),
    FOREIGN KEY (prix_id) REFERENCES prix(id),
    FOREIGN KEY (seance_id) REFERENCES seance(id)
)
ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--Valeurs réservation 
INSERT INTO reservation 
VALUES 
    ('1', 'CB'),
    ('2', 'CB'),
    ('3', 'CB'),
    ('4', 'CB');

