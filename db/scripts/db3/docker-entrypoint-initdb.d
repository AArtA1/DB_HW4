CREATE TABLE City (
    Name VARCHAR(255) PRIMARY KEY,
    Region VARCHAR(255)
);

CREATE TABLE Station (
    Name VARCHAR(255) PRIMARY KEY,
    Tracks INTEGER,
    CityName VARCHAR(255),
    Region VARCHAR(255),
    FOREIGN KEY (CityName) REFERENCES City(Name)
);

CREATE TABLE Train (
    TrainNr SERIAL PRIMARY KEY,
    Length INTEGER,
    StartStationName VARCHAR(255),
    EndStationName VARCHAR(255),
    UNIQUE (TrainNr, StartStationName,EndStationName),
    FOREIGN KEY (StartStationName) REFERENCES Station(Name),
    FOREIGN KEY (EndStationName) REFERENCES Station(Name)
);

CREATE TABLE Connection (
    FromStation VARCHAR(255),
    ToStation VARCHAR(255),
    TrainNr INTEGER,
    Departure TIME,
    Arrival TIME,
    PRIMARY KEY (TrainNr, FromStation, ToStation),
    FOREIGN KEY (TrainNr,FromStation,ToStation) REFERENCES Train(TrainNr,StartStationName,EndStationName)
);
