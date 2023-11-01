-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-11-01 17:14:20.785

-- tables
-- Table: DimBooks
CREATE TABLE DimBooks (
    ID_book int  NOT NULL,
    publisher varchar(64)  NOT NULL,
    isbn char(13)  NOT NULL,
    title varchar(64)  NOT NULL,
    author varchar(64)  NOT NULL,
    num_of_pages int  NOT NULL,
    CONSTRAINT DimBooks_pk PRIMARY KEY  (ID_book)
);

-- Table: DimClients
CREATE TABLE DimClients (
    ID_client int  NOT NULL,
    phone_number char(9)  NOT NULL,
    adress varchar(256)  NOT NULL,
    first_name varchar(32)  NOT NULL,
    last_name varchar(32)  NOT NULL,
    CONSTRAINT DimClients_pk PRIMARY KEY  (ID_client)
);

-- Table: DimDeliveryCompanies
CREATE TABLE DimDeliveryCompanies (
    ID_delivery_company int  NOT NULL,
    name varchar(64)  NOT NULL,
    tax_identification_number char(10)  NOT NULL,
    adress varchar(256)  NOT NULL,
    CONSTRAINT DimDeliveryCompanies_pk PRIMARY KEY  (ID_delivery_company)
);

-- Table: FactTransactions
CREATE TABLE FactTransactions (
    date_sale datetime  NOT NULL,
    ID_client int  NOT NULL,
    ID_delivery_company int  NOT NULL,
    ID_book int  NOT NULL,
    CONSTRAINT FactTransactions_pk PRIMARY KEY  (date_sale)
);

-- foreign keys
-- Reference: FactTransactions_DimBook (table: FactTransactions)
ALTER TABLE FactTransactions ADD CONSTRAINT FactTransactions_DimBook
    FOREIGN KEY (ID_book)
    REFERENCES DimBooks (ID_book);

-- Reference: FactTransactions_DimClients (table: FactTransactions)
ALTER TABLE FactTransactions ADD CONSTRAINT FactTransactions_DimClients
    FOREIGN KEY (ID_client)
    REFERENCES DimClients (ID_client);

-- Reference: transactions_delivery_companies (table: FactTransactions)
ALTER TABLE FactTransactions ADD CONSTRAINT transactions_delivery_companies
    FOREIGN KEY (ID_delivery_company)
    REFERENCES DimDeliveryCompanies (ID_delivery_company);

-- sequences
-- Sequence: DimBooks_seq
CREATE SEQUENCE DimBooks_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DimClients_seq
CREATE SEQUENCE DimClients_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DimDeliveryCompanies_seq
CREATE SEQUENCE DimDeliveryCompanies_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

