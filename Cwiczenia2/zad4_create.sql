-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-11-01 17:26:02.288

-- tables
-- Table: DimClients
CREATE TABLE DimClients (
    ID_client int  NOT NULL,
    tax_identification_number char(10)  NOT NULL,
    name varchar(64)  NOT NULL,
    adress varchar(256)  NOT NULL,
    CONSTRAINT DimClients_pk PRIMARY KEY  (ID_client)
);

-- Table: DimDates
CREATE TABLE DimDates (
    ID_date int  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    hour int  NOT NULL,
    CONSTRAINT DimDates_pk PRIMARY KEY  (ID_date)
);

-- Table: DimFruitCategory
CREATE TABLE DimFruitCategory (
    ID_fruit_category int  NOT NULL,
    name varchar(32)  NOT NULL,
    CONSTRAINT DimFruitCategory_pk PRIMARY KEY  (ID_fruit_category)
);

-- Table: DimFruits
CREATE TABLE DimFruits (
    ID_fruit int  NOT NULL,
    ID_fruit_category int  NOT NULL,
    price_kg money  NOT NULL,
    CONSTRAINT DimFruits_pk PRIMARY KEY  (ID_fruit)
);

-- Table: FactTransactions
CREATE TABLE FactTransactions (
    ID_transaction int  NOT NULL,
    ID_date int  NOT NULL,
    ID_fruit int  NOT NULL,
    ID_client int  NOT NULL,
    quantity int  NOT NULL,
    place int  NOT NULL,
    price money  NOT NULL,
    CONSTRAINT FactTransactions_pk PRIMARY KEY  (ID_transaction)
);

-- foreign keys
-- Reference: DimFruits_DimFruitCategory (table: DimFruits)
ALTER TABLE DimFruits ADD CONSTRAINT DimFruits_DimFruitCategory
    FOREIGN KEY (ID_fruit_category)
    REFERENCES DimFruitCategory (ID_fruit_category);

-- Reference: FactTransactions_DimClients (table: FactTransactions)
ALTER TABLE FactTransactions ADD CONSTRAINT FactTransactions_DimClients
    FOREIGN KEY (ID_client)
    REFERENCES DimClients (ID_client);

-- Reference: FactTransactions_DimDates (table: FactTransactions)
ALTER TABLE FactTransactions ADD CONSTRAINT FactTransactions_DimDates
    FOREIGN KEY (ID_date)
    REFERENCES DimDates (ID_date);

-- Reference: FactTransactions_DimFruits (table: FactTransactions)
ALTER TABLE FactTransactions ADD CONSTRAINT FactTransactions_DimFruits
    FOREIGN KEY (ID_fruit)
    REFERENCES DimFruits (ID_fruit);

-- sequences
-- Sequence: DimClients_seq
CREATE SEQUENCE DimClients_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DimDates_seq
CREATE SEQUENCE DimDates_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DimFruitCategory_seq
CREATE SEQUENCE DimFruitCategory_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DimFruits_seq
CREATE SEQUENCE DimFruits_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FactTransactions_seq
CREATE SEQUENCE FactTransactions_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

