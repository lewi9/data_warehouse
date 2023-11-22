-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-11-22 20:34:46.804

-- tables
-- Table: DiMCarrier
CREATE TABLE DiMCarrier (
    CarrierKey int  NOT NULL,
    carrier_id int  NOT NULL,
    carrier_name varchar(4)  NOT NULL,
    address Varchar(48_  NOT NULL,
    tax_id int  NOT NULL,
    contact_person varchar(19)  NOT NULL,
    start_date datetime2  NOT NULL,
    end_date datetime2  NOT NULL,
    CONSTRAINT DiMCarrier_pk PRIMARY KEY  (CarrierKey)
);

-- Table: DiMCustomers
CREATE TABLE DiMCustomers (
    CustomerKey int  NOT NULL,
    id int  NOT NULL,
    first_name varchar(11)  NOT NULL,
    last_name varchar(15)  NOT NULL,
    street varchar(31)  NOT NULL,
    city varchar(27)  NOT NULL,
    state varchar(25)  NOT NULL,
    country varchar(13)  NOT NULL,
    phone varchar(12)  NOT NULL,
    email varchar(35)  NOT NULL,
    start_date datetime2  NOT NULL,
    end_date datetime2  NOT NULL,
    CONSTRAINT DiMCustomers_pk PRIMARY KEY  (CustomerKey)
);

-- Table: DiMDate
CREATE TABLE DiMDate (
    DateKey int  NOT NULL,
    Date date  NOT NULL,
    Year int  NOT NULL,
    Quater int  NOT NULL,
    Month int  NOT NULL,
    Week int  NOT NULL,
    Day int  NOT NULL,
    DayOfWeek int  NOT NULL,
    DayOfYear int  NOT NULL,
    IsWeekend bit  NOT NULL,
    IsHoliday bit  NOT NULL,
    CONSTRAINT DiMDate_pk PRIMARY KEY  (DateKey)
);

-- Table: DiMPizzas
CREATE TABLE DiMPizzas (
    PizzaKey int  NOT NULL,
    pizza_type_id varchar(12)  NOT NULL,
    name varchar(42)  NOT NULL,
    category varchar(7)  NOT NULL,
    ingredients varchar(200)  NOT NULL,
    pizza_id varchar(14)  NOT NULL,
    size varchar(3)  NOT NULL,
    price money  NOT NULL,
    start_date datetime2  NOT NULL,
    end_date datetime2  NOT NULL,
    CONSTRAINT DiMPizzas_pk PRIMARY KEY  (PizzaKey)
);

-- Table: FactSales
CREATE TABLE FactSales (
    UniqueID int  NOT NULL,
    TimestampTransaction datetime2  NOT NULL,
    AmountTransaction decimal(2,16)  NOT NULL,
    DiMPizzas_PizzaKey int  NOT NULL,
    DiMCarrier_CarrierKey int  NOT NULL,
    DiMCustomers_CustomerKey int  NOT NULL,
    DiMDate_Date_Key int  NOT NULL,
    CONSTRAINT FactSales_pk PRIMARY KEY  (UniqueID)
);

-- foreign keys
-- Reference: FactSales_DiMCarrier (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DiMCarrier
    FOREIGN KEY (DiMCarrier_CarrierKey)
    REFERENCES DiMCarrier (CarrierKey);

-- Reference: FactSales_DiMCustomers (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DiMCustomers
    FOREIGN KEY (DiMCustomers_CustomerKey)
    REFERENCES DiMCustomers (CustomerKey);

-- Reference: FactSales_DiMDate (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DiMDate
    FOREIGN KEY (DiMDate_Date_Key)
    REFERENCES DiMDate (DateKey);

-- Reference: FactSales_DiMPizzas (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DiMPizzas
    FOREIGN KEY (DiMPizzas_PizzaKey)
    REFERENCES DiMPizzas (PizzaKey);

-- sequences
-- Sequence: DiMCarrier_seq
CREATE SEQUENCE DiMCarrier_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DiMCustomers_seq
CREATE SEQUENCE DiMCustomers_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DiMPizzas_seq
CREATE SEQUENCE DiMPizzas_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FactSales_seq
CREATE SEQUENCE FactSales_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

