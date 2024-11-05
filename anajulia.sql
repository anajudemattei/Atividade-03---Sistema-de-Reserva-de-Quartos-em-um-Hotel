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
