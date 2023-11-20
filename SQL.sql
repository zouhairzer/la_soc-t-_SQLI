CREATE DATABASE  la société SQLI

                                             -- CREATION DES TABLEAUX --
++++++++++++++++++++++++++++++++++++++++++++++++++++  user story 2 ++++++++++++++++++++++++++++++++++++++++

-- tableau d'utilisateur
CREATE TABLE Utilisateur(
    nom VARCHAR(49), 
    email VARCHAR(49),
    user_id int AUTO_INCREMENT,
    PRIMARY KEY(user_id),
    squad_id int,
    Foreign Key (squad_id) REFERENCES squad(squad_id)
    )

-- add column 
ALTER TABLE utilisateur 
ADD COLUMN squad_id int

ALTER TABLE utilisateur ADD Leader_member varchar(49)

-- Make it a Foreign Key
ALTER TABLE utilisateur 
ADD CONSTRAINT s_quad_id 
FOREIGN KEY (squad_id) REFERENCES squad(squad_id)

-- INSERT INTO TABLE 
INSERT INTO utilisateur(nom, email, leader_member) VALUES("zouhair", "curvasud@email.com", "leader")
INSERT INTO utilisateur(nom, email,leader_member) VALUES("morad", "morad@email.com","member")
INSERT INTO utilisateur(nom, email,leader_member) VALUES("azzedin", "azzedin@email.com","member")
INSERT INTO utilisateur(nom, email,leader_member) VALUES("azzedin", "nabil@email.com","member")

INSERT INTO utilisateur(nom, email, leader_member) VALUES("khalid", "khalid@email.com", "leader")
INSERT INTO utilisateur(nom, email,leader_member) VALUES("ali",    "ali@email.com","member")
INSERT INTO utilisateur(nom, email,leader_member) VALUES("ayoub",  "ayoub@email.com","member")
INSERT INTO utilisateur(nom, email,leader_member) VALUES("mohamed",  "mohamed@email.com","member")

+++++++++++++++++++++++++++++++++++++++++++++ user story 2 +++++++++++++++++++++++++++++++++++++++++++++++++


-- tableau de squad
CREATE TABLE squad(
    nom VARCHAR(49), 
    squad_id int AUTO_INCREMENT,
    PRIMARY KEY(squad_id),
    leader_id int ,
    Foreign Key (leader_id) REFERENCES utilisateur (user_id)
    )
-- Add columns
ALTER TABLE squad ADD projet_id int

-- FOREIGN KEY
ALTER TABLE squad ADD 
CONSTRAINT p_rojet_id 
FOREIGN KEY (projet_id) REFERENCES projet(projet_id);

-- INSERT INTO 
INSERT INTO squad(nom) VALUE("Eagles")
UPDATE squad SET leader_id = 2

-- CHANGE FOREIGN KEY 
ALTER TABLE squad
CHANGE COLUMN leader_id user_id INT;


+++++++++++++++++++++++++++++++++++++++++++++ user story 3 +++++++++++++++++++++++++++++++++++++++++++++++++




-- tableau de Projet
CREATE TABLE projet(nom varchar(49), 
    description varchar(49), 
    date_debut date, 
    date_fin date,
    projet_id int AUTO_INCREMENT, 
    PRIMARY KEY(projet_id))

-- Insert into 

INSERT into projet(nom, description, date_debut, date_fin) VALUES("amazon1", "site web ecommerce", "2023-10-01", "2023-10-07")
INSERT into projet(nom, description, date_debut, date_fin) VALUES("photo_master", "site web ecommerce", "2023-10-08", "2023-10-16")
INSERT into projet(nom, description, date_debut, date_fin) VALUES("scrum_board", "site pour gestion des taches", "2023-10-17", "2023-10-27")
INSERT into projet(nom, description, date_debut, date_fin) VALUES("amazon2", "site web ecommerce", "2023-10-11", "2023-10-07")


+++++++++++++++++++++++++++++++++++++++++++++ user story 4 +++++++++++++++++++++++++++++++++++++++++++++++++


SELECT projet.*
FROM projet
JOIN Squad ON projet.Projet_id = Squad.Projet_id
WHERE Squad.Squad_id = 2; 

+++++++++++++++++++++++++++++++++++++++++++++ user story 5 +++++++++++++++++++++++++++++++++++++++++++++++++


-- tableau de Ressource
CREATE TABLE ressource (
    ressource_id INT PRIMARY KEY auto increment,
    projet_id INT,
    squad_id INT,
    Foreign Key (projet_id) REFERENCES Projet(projet_id),
    Foreign Key (squad_id) REFERENCES Squad(squad_id)
)

-- ADD COLUMN
ALTER TABLE ressource ADD COLUMN category_id int;
ALTER TABLE ressource ADD COLUMN subcategory_id int

-- INSERT INTO 
INSERT INTO ressource(projet_id, squad_id, category_id, subcategory_id) VALUES (1,2,2,3)
INSERT INTO ressource(projet_id, squad_id, category_id, subcategory_id) VALUES (2,1,1,3)
INSERT INTO ressource(projet_id, squad_id, category_id, subcategory_id) VALUES (3,2,1,2)
INSERT INTO ressource(projet_id, squad_id, category_id, subcategory_id) VALUES (1,1,1,1)


+++++++++++++++++++++++++++++++++++++++++++++ user story 6 +++++++++++++++++++++++++++++++++++++++++++++++++

-- UPDATE 
UPDATE utilisateur SET squad_id = 1,nom = "zouhair"


+++++++++++++++++++++++++++++++++++++++++++++ user story 7 +++++++++++++++++++++++++++++++++++++++++++++++++



-- tableau de category 
CREATE TABLE category(
    nom varchar(49),
    category_id int AUTO_INCREMENT,
    PRIMARY KEY(category_id)
)

-- INSERT into
INSERT INTO category(nom) VALUE("format_fichier")
INSERT INTO category(nom) VALUE("Media")
INSERT INTO category(nom) VALUE("Media")



-- tableau de sub-category with foreign key 
CREATE TABLE sub_category(nom varchar(49), 
    subcategory_id int AUTO_INCREMENT,
    PRIMARY KEY(subcategory_id),
    category_id int,
    FOREIGN KEY(category_id) REFERENCES category(category_id))

-- INSERT into sub_category table
INSERT INTO sub_category(nom, category_id) VALUES ("PDF", 1)
INSERT INTO sub_category(nom, category_id) VALUES ("Audio", 2)
INSERT INTO sub_category(nom, category_id) VALUES ("video", 3)

--Add FOREIGN KEY (sub_category et category)
ALTER TABLE ressource ADD 
CONSTRAINT c_ategory_id 
FOREIGN KEY (category_id) REFERENCES category(category_id);

ALTER TABLE ressource ADD 
CONSTRAINT sub_ategory_id 
FOREIGN KEY (subcategory_id) REFERENCES sub_category(subcategory_id);

