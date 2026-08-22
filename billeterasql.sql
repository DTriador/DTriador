-- Creación de Tablas con PK integradas para mejor visualización en DER
CREATE TABLE type_of_transactions (
    tpe_id INTEGER PRIMARY KEY,
    tpe_name VARCHAR(45) NOT NULL
);

CREATE TABLE users (
    user_id       INTEGER PRIMARY KEY,
    user_name     VARCHAR(45) NOT NULL,
    user_last_name VARCHAR(45) NOT NULL,
    user_email     VARCHAR(45) NOT NULL,
    user_password  VARCHAR(45) NOT NULL
);

CREATE TABLE wallets (
    wallet_id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE companies (
    companies_id              INTEGER PRIMARY KEY,
    companies_holder_name      VARCHAR(45) NOT NULL,
    companies_number           VARCHAR(20),
    companies_company_name     VARCHAR(45) NOT NULL,
    companies_api_key          VARCHAR(45) NOT NULL,
    companies_expiration_date  DATE NOT NULL,
    wallet_id                  INTEGER NOT NULL,
    FOREIGN KEY (wallet_id) REFERENCES wallets (wallet_id)
);

CREATE TABLE contacts (
    contacts_id    INTEGER PRIMARY KEY,
    contacts_name  VARCHAR(45) NOT NULL,
    contacts_email VARCHAR(45) NOT NULL,
    wallet_id      INTEGER NOT NULL,
    FOREIGN KEY (wallet_id) REFERENCES wallets (wallet_id)
);

CREATE TABLE transactions (
    transactions_id INTEGER PRIMARY KEY,
    transactions_amount DECIMAL(11,2) NOT NULL,
    transactions_signe VARCHAR(45) NOT NULL,
    transactions_date DATE NOT NULL,
    transactions_description VARCHAR(45) NOT NULL,
    transactions_tracking VARCHAR(45) NOT NULL,
    tpe_id INTEGER NOT NULL,
    wallet_id INTEGER NOT NULL,
    companies_id INTEGER,
    FOREIGN KEY (companies_id) REFERENCES companies (companies_id),
    FOREIGN KEY (tpe_id) REFERENCES type_of_transactions (tpe_id), 
    FOREIGN KEY (wallet_id) REFERENCES wallets (wallet_id)
);

-- Datos de ejemplo (Sintaxis estándar)
INSERT INTO users (user_id, user_name, user_last_name, user_email, user_password) 
VALUES (1, 'Daniela','Triador', 'danielatriador@gmail.com', '36965115');

INSERT INTO wallets (wallet_id, user_id) VALUES (1, 1);

INSERT INTO type_of_transactions (tpe_id, tpe_name) VALUES (1, 'CASH'), (2, 'CARD'), (3, 'INVOICE'), (4, 'TRANSFER');

INSERT INTO companies (companies_id, companies_holder_name, companies_number, companies_company_name, companies_api_key, companies_expiration_date, wallet_id) 
VALUES (1, 'DANIELA TRIADOR', '4140001234567899', 'Visa', 'api visa', '2026-12-31', 1);

INSERT INTO transactions (transactions_id, transactions_amount, transactions_signe, transactions_date, transactions_description, transactions_tracking, tpe_id, wallet_id, companies_id)
VALUES (1, 10000, '+', '2026-04-15', 'RAPIPAGO', '12311', 1, 1, NULL);