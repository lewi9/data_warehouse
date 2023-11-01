-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-11-01 18:34:26.486

-- tables
-- Table: DimEmployee
CREATE TABLE DimEmployee (
    ID_employee int  NOT NULL,
    pesel_number char(11)  NOT NULL,
    adress varchar(256)  NOT NULL,
    CONSTRAINT DimEmployee_pk PRIMARY KEY  (ID_employee)
);

-- Table: DimPerformanceEvaluation
CREATE TABLE DimPerformanceEvaluation (
    ID_employee int  NOT NULL,
    ID_performance_evaluation int  NOT NULL,
    performance_evaluation tinyint  NOT NULL,
    CONSTRAINT DimPerformanceEvaluation_pk PRIMARY KEY  (ID_employee)
);

-- Table: DimPerformanceEvaluationHistory
CREATE TABLE DimPerformanceEvaluationHistory (
    ID_employee int  NOT NULL,
    ID_performance_evaluation int  NOT NULL,
    performance_evaluation tinyint  NOT NULL,
    effective_day date  NOT NULL,
    "current" bit  NOT NULL,
    CONSTRAINT DimPerformanceEvaluationHistory_pk PRIMARY KEY  (ID_performance_evaluation)
);

-- Table: FactEmployeeSalary
CREATE TABLE FactEmployeeSalary (
    ID_employee int  NOT NULL,
    date date  NOT NULL,
    salary money  NOT NULL,
    CONSTRAINT FactEmployeeSalary_pk PRIMARY KEY  (ID_employee,date)
);

-- foreign keys
-- Reference: DimEmployee_FactEmployeeSalary (table: FactEmployeeSalary)
ALTER TABLE FactEmployeeSalary ADD CONSTRAINT DimEmployee_FactEmployeeSalary
    FOREIGN KEY (ID_employee)
    REFERENCES DimEmployee (ID_employee);

-- Reference: DimPerformanceEvaluation_DimEmployee (table: DimPerformanceEvaluation)
ALTER TABLE DimPerformanceEvaluation ADD CONSTRAINT DimPerformanceEvaluation_DimEmployee
    FOREIGN KEY (ID_employee)
    REFERENCES DimEmployee (ID_employee);

-- Reference: DimPerformanceEvaluation_DimPerformanceEvaluationHistory (table: DimPerformanceEvaluation)
ALTER TABLE DimPerformanceEvaluation ADD CONSTRAINT DimPerformanceEvaluation_DimPerformanceEvaluationHistory
    FOREIGN KEY (ID_performance_evaluation,performance_evaluation)
    REFERENCES DimPerformanceEvaluationHistory (ID_performance_evaluation,performance_evaluation);

-- Reference: FactEmployeeSalary_DimPerformanceEvaluation (table: FactEmployeeSalary)
ALTER TABLE FactEmployeeSalary ADD CONSTRAINT FactEmployeeSalary_DimPerformanceEvaluation
    FOREIGN KEY (ID_employee)
    REFERENCES DimPerformanceEvaluation (ID_employee);

-- End of file.

