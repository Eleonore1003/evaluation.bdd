--Créer table cinema
DROP TABLE IF EXISTS 'cinema';
CREATE TABLE cinema (
    id_cinema INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR (100) NOT NULL,
    adresse VARCHAR (500) NOT NULL,
    FOREIGN KEY (administrateur_id) REFERENCES administrateur(id)
    FOREIGN KEY (seance_id) REFERENCES seance(id)
    FOREIGN KEY (film_id) REFERENCES film(id)
    
)
ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--Valeurs cinema 
INSERT INTO cinema 
VALUES 
    ('1', 'Cinéma La Clef', '34 Rue Daubenton', '75005', 'Paris'),
    ('2', 'Les 5 Caumartin', '101 Rue Saint-Lazare', '75009', 'Paris'),
    ('3', 'Les Pionniers Du Cinéma', '36 Rue Godefroy Cavaignac', '75011', 'Paris'),
    ('4', 'Pathé Alésia', '73 Av. du Général Leclerc', '75014', 'Paris')

