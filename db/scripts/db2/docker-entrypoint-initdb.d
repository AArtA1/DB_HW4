CREATE TABLE StationsPersonel (
    PersNr SERIAL PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Station (
    StatNr SERIAL PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Doctor (
    PersNr SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Area VARCHAR(255),
    Rang VARCHAR(255),
    StatNr INTEGER,
    FOREIGN KEY (StatNr) REFERENCES Station(StatNr)
);

CREATE TABLE Caregivers (
    PersNr SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Qualification VARCHAR(255),
    StatNr INTEGER,
    FOREIGN KEY (StatNr) REFERENCES Station(StatNr)
);

CREATE TABLE Patient (
    PatientNr SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Disease VARCHAR(255),
    RoomNr INTEGER,
    FromDate DATE,
    ToDate DATE
);

CREATE TABLE Room (
    StatNr INTEGER,
    RoomNr INTEGER,
    Beds INTEGER,
    PRIMARY KEY (StatNr, RoomNr),
    FOREIGN KEY (StatNr) REFERENCES Station(StatNr)
);

CREATE TABLE WorksAt (
    StatNr INTEGER,
    PersNr INTEGER,
    PRIMARY KEY (StatNr, PersNr),
    FOREIGN KEY (StatNr) REFERENCES Station(StatNr),
    FOREIGN KEY (PersNr) REFERENCES StationsPersonel(PersNr)
);

CREATE TABLE Treats (
    PatientNr INTEGER,
    PersNr INTEGER,
    PRIMARY KEY (PatientNr, PersNr),
    FOREIGN KEY (PatientNr) REFERENCES Patient(PatientNr),
    FOREIGN KEY (PersNr) REFERENCES StationsPersonel(PersNr)
);

CREATE TABLE Admission (
    StatNr INTEGER,
    RoomNr INTEGER,
    PatientNr INTEGER,
    FromDate DATE,
    ToDate DATE,
    PRIMARY KEY (StatNr, RoomNr, PatientNr, FromDate, ToDate),
    FOREIGN KEY (StatNr, RoomNr) REFERENCES Room(StatNr, RoomNr),
    FOREIGN KEY (PatientNr) REFERENCES Patient(PatientNr)
);
