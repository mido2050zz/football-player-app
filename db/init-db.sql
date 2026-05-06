-- Drop table if exists
DROP TABLE IF EXISTS squad;

-- Create Table
CREATE TABLE squad (
    id SERIAL PRIMARY KEY,
    player_name VARCHAR(100) NOT NULL,
    kit_number INT NOT NULL,
    age INT NOT NULL CHECK (age > 15),
    team VARCHAR(50) NOT NULL,
    CONSTRAINT unique_team_kit UNIQUE (team, kit_number)
);

-- ========================
-- Inter Milan
-- ========================
INSERT INTO squad (player_name, kit_number, age, team) VALUES
('Yann Sommer', 1, 35, 'Inter Milan'),
('Denzel Dumfries', 2, 28, 'Inter Milan'),
('Stefan de Vrij', 6, 32, 'Inter Milan'),
('Marko Arnautovic', 8, 35, 'Inter Milan'),
('Marcus Thuram', 9, 26, 'Inter Milan'),
('Lautaro Martinez', 10, 26, 'Inter Milan'),
('Francesco Acerbi', 15, 36, 'Inter Milan'),
('Davide Frattesi', 16, 25, 'Inter Milan'),
('Hakan Calhanoglu', 20, 30, 'Inter Milan'),
('Kristjan Asllani', 21, 22, 'Inter Milan'),
('Henrikh Mkhitaryan', 22, 35, 'Inter Milan'),
('Nicolo Barella', 23, 27, 'Inter Milan'),
('Benjamin Pavard', 28, 28, 'Inter Milan'),
('Carlos Augusto', 30, 25, 'Inter Milan'),
('Federico Dimarco', 32, 26, 'Inter Milan'),
('Matteo Darmian', 36, 34, 'Inter Milan'),
('Alexis Sanchez', 70, 35, 'Inter Milan'),
('Emil Audero', 77, 27, 'Inter Milan'),
('Alessandro Bastoni', 95, 25, 'Inter Milan');

-- ========================
-- AC Milan
-- ========================
INSERT INTO squad (player_name, kit_number, age, team) VALUES
('Mike Maignan', 16, 29, 'AC Milan'),
('Marco Sportiello', 57, 32, 'AC Milan'),
('Davide Calabria', 2, 27, 'AC Milan'),
('Fikayo Tomori', 23, 26, 'AC Milan'),
('Malick Thiaw', 28, 23, 'AC Milan'),
('Simon Kjaer', 24, 35, 'AC Milan'),
('Theo Hernandez', 19, 26, 'AC Milan'),
('Alessandro Florenzi', 25, 33, 'AC Milan'),
('Ruben Loftus-Cheek', 8, 28, 'AC Milan'),
('Ismael Bennacer', 4, 26, 'AC Milan'),
('Yunus Musah', 80, 21, 'AC Milan'),
('Tijjani Reijnders', 14, 25, 'AC Milan'),
('Rafael Leao', 10, 25, 'AC Milan'),
('Christian Pulisic', 11, 26, 'AC Milan'),
('Samuel Chukwueze', 21, 25, 'AC Milan'),
('Olivier Giroud', 9, 37, 'AC Milan'),
('Noah Okafor', 17, 24, 'AC Milan'),
('Luka Jovic', 15, 26, 'AC Milan');

-- ========================
-- Napoli
-- ========================
INSERT INTO squad (player_name, kit_number, age, team) VALUES
('Alex Meret', 1, 27, 'Napoli'),
('Pierluigi Gollini', 95, 29, 'Napoli'),
('Giovanni Di Lorenzo', 22, 30, 'Napoli'),
('Amir Rrahmani', 13, 30, 'Napoli'),
('Juan Jesus', 5, 33, 'Napoli'),
('Leo Ostigard', 55, 25, 'Napoli'),
('Mathias Olivera', 17, 27, 'Napoli'),
('Mario Rui', 6, 33, 'Napoli'),
('Stanislav Lobotka', 68, 30, 'Napoli'),
('Andre-Frank Zambo Anguissa', 99, 28, 'Napoli'),
('Piotr Zielinski', 20, 30, 'Napoli'),
('Jens Cajuste', 24, 25, 'Napoli'),
('Khvicha Kvaratskhelia', 77, 23, 'Napoli'),
('Victor Osimhen', 9, 25, 'Napoli'),
('Matteo Politano', 21, 30, 'Napoli'),
('Giacomo Raspadori', 81, 24, 'Napoli'),
('Giovanni Simeone', 18, 29, 'Napoli');

-- ========================
-- Lazio
-- ========================
INSERT INTO squad (player_name, kit_number, age, team) VALUES
('Ivan Provedel', 94, 30, 'Lazio'),
('Luigi Sepe', 33, 33, 'Lazio'),
('Manuel Lazzari', 29, 30, 'Lazio'),
('Alessio Romagnoli', 13, 29, 'Lazio'),
('Patric', 4, 31, 'Lazio'),
('Adam Marusic', 77, 31, 'Lazio'),
('Elseid Hysaj', 23, 30, 'Lazio'),
('Danilo Cataldi', 32, 30, 'Lazio'),
('Matias Vecino', 5, 33, 'Lazio'),
('Luis Alberto', 10, 31, 'Lazio'),
('Daichi Kamada', 6, 28, 'Lazio'),
('Mattia Zaccagni', 20, 29, 'Lazio'),
('Ciro Immobile', 17, 34, 'Lazio'),
('Felipe Anderson', 7, 31, 'Lazio'),
('Pedro', 9, 36, 'Lazio');
