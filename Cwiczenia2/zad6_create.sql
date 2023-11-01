-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-11-01 18:46:24.701

-- tables
-- Table: DimProduct
CREATE TABLE DimProduct (
    ID_product int  NOT NULL,
    name varchar(64)  NOT NULL,
    brand varchar(64)  NOT NULL,
    CONSTRAINT DimProduct_ak_1 UNIQUE (ID_product),
    CONSTRAINT DimProduct_pk PRIMARY KEY  (name,brand,ID_product)
);

-- Table: DimProductHistory
CREATE TABLE DimProductHistory (
    ID_product int  NOT NULL,
    name varchar(64)  NOT NULL,
    brand varchar(64)  NOT NULL,
    effective_date date  NOT NULL,
    "current" bit  NOT NULL,
    CONSTRAINT DimProductHistory_ak_1 UNIQUE (ID_product, name, brand),
    CONSTRAINT DimProductHistory_pk PRIMARY KEY  (name,brand,ID_product)
);

-- Table: DimStorage
CREATE TABLE DimStorage (
    ID_storage int  NOT NULL,
    adress varchar(256)  NOT NULL,
    country varchar(32)  NOT NULL,
    CONSTRAINT DimStorage_pk PRIMARY KEY  (ID_storage)
);

-- Table: FactStorageStatus
CREATE TABLE FactStorageStatus (
    date date  NOT NULL,
    ID_storage int  NOT NULL,
    ID_product int  NOT NULL,
    qunatity int  NOT NULL,
    CONSTRAINT FactStorageStatus_pk PRIMARY KEY  (date,ID_storage,ID_product)
);

-- foreign keys
-- Reference: DimProductHistory_DimProduct (table: DimProduct)
ALTER TABLE DimProduct ADD CONSTRAINT DimProductHistory_DimProduct
    FOREIGN KEY (ID_product,name,brand)
    REFERENCES DimProductHistory (ID_product,name,brand);

-- Reference: DimProduct_FactStorageStatus (table: FactStorageStatus)
ALTER TABLE FactStorageStatus ADD CONSTRAINT DimProduct_FactStorageStatus
    FOREIGN KEY (ID_product)
    REFERENCES DimProduct (ID_product);

-- Reference: FactStorageStatus_DimStorage (table: FactStorageStatus)
ALTER TABLE FactStorageStatus ADD CONSTRAINT FactStorageStatus_DimStorage
    FOREIGN KEY (ID_storage)
    REFERENCES DimStorage (ID_storage);

-- sequences
-- Sequence: DimProductHistory_seq
CREATE SEQUENCE DimProductHistory_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DimProduct_seq
CREATE SEQUENCE DimProduct_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DimStorage_seq
CREATE SEQUENCE DimStorage_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

