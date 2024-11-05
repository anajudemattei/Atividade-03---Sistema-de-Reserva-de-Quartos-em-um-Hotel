CREATE DATABASE reservas_hotel;

\c reservas_hotel;

CREATE TABLE hospedes (
id_hospede SERIAL PRIMARY KEY,
nome VARCHAR (100) NOT NULL,
email VARCHAR (200) UNIQUE NOT NULL,
data_nascimento DATE NOT NULL
);

SELECT * FROM hospedes;

CREATE TABLE quartos (
id_quarto SERIAL PRIMARY KEY,
andar NUMERIC UNIQUE NOT NULL,
numero_quarto  NUMERIC UNIQUE NOT NULL,
disponivel BOOLEAN NOT NULL
);

SELECT * FROM quartos;


CREATE TABLE reservas (
id_reserva SERIAL PRIMARY KEY,
data_entrada DATE NOT NULL,
data_saida DATE NOT NULL,
horario_reserva TIME NOT NULL,
id_hospede INT NOT NULL,
id_quarto INT NOT NULL,
CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes (id_hospede),
CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos (id_quarto)
);

SELECT * FROM reservas;

INSERT INTO hospedes (nome, email, data_nascimento) 
VALUES
('Flavia Mendes', 'flaflamendes@gmail.com', '2008-03-17'),
('Amanda Mechi', 'ameinda019@gmail.com', '2008-03-27' ),
('Julia Neves', 'jujunevou@gmail.com ',  '2008-10-17'),
('Giovanna', 'gigica321@gmail.com' ,  '2008-04-28'),
('Kevin Lima', 'nino2345@gmail.com',  '2008-10-16');

SELECT * FROM hospedes;

INSERT INTO quartos (andar, numero_quarto, disponivel)
VALUES
(10, 154, TRUE),
(2,106, TRUE),
(14, 150, TRUE),
(5, 115, FALSE),
(1, 7, FALSE);

SELECT * FROM quartos;

INSERT INTO reservas (data_entrada, data_saida, horario_reserva, id_hospede, id_quarto) VALUES
('2025-03-17', '2025-03-21', '10:00', 1, 4), 
('2024-11-15', '2024-11-16', '23:00', 2, 5),
('2024-12-30', '2025-01-02', '21:00', 3, 6),
('2024-09-23', '2024-09-30', '12:30', 4, 7),
('2026-04-10', '2024-05-10', '00:30', 5, 8);

SELECT * FROM reservas;



