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

SELECT 
    h.nome AS hospedes,
    q.numero_quarto AS quarto,
    r.data_entrada,
    r.data_saida
FROM 
    hospedes h
JOIN 
    reservas r ON h.id_hospede = r.id_hospede
JOIN 
    quartos q ON r.id_quarto = q.id_quarto
WHERE
    r.data_entrada BETWEEN '2024-12-30' AND '2025-01-02';

INSERT INTO hospedes (nome, email, data_nascimento) 
VALUES
('Lucca Demattei', 'lucca@gmail.com', '2024-10-31'),
('Ana Julia', 'naju237@gmail.com', '2008-04-26');

INSERT INTO quartos (andar, numero_quarto, disponivel)
VALUES
(65, 708, NULL),
(78, 909, NULL);

INSERT INTO reservas (data_entrada, data_saida, horario_reserva, id_hospede, id_quarto) VALUES
('2024-11-04', '2024-11-07', '10:00', 1, 4), 
('2024-11-04', '2024-11-07', '10:10', 2, 5);


ALTER TABLE quartos ALTER COLUMN disponivel DROP NOT NULL;

SELECT 
    h.nome AS hospedes,
    q.numero_quarto AS quarto,
    q.disponivel
FROM 
    reservas r
JOIN 
    hospedes h ON r.id_hospede = h.id_hospede
JOIN 
    quartos q ON r.id_quarto = q.id_quarto


SELECT 
    h.id_hospede,
    h.nome,
    h.email, 
    h.data_nascimento,
    q.id_quarto,
    q.andar,
    q.numero_quarto,
    q.disponivel,
    r.id_reserva,
    r.data_entrada,
    r.data_saida,
    r.horario_reserva
FROM 
    reservas r
JOIN 
    hospedes h ON r.id_hospede = h.id_hospede
JOIN 
    quartos q ON r.id_quarto = q.id_quarto;


SELECT 
    q.numero_quarto AS quarto,
    q.disponivel
FROM 
    reservas r
JOIN 
    hospedes h ON r.id_hospede = h.id_hospede
JOIN 
    quartos q ON r.id_quarto = q.id_quarto
WHERE
    q.disponivel IS TRUE;