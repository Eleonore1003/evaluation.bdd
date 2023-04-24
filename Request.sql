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

