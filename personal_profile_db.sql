CREATE TABLE PersonalInformation (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Address VARCHAR(100),
    City VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    DesiredPosition VARCHAR(100)
);

CREATE TABLE AboutMe (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Summary TEXT,
    Person_ID INT,
    FOREIGN KEY (Person_ID) REFERENCES PersonalInformation(ID)
);

CREATE TABLE MediaLinks (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Address VARCHAR(100),
    Person_ID INT,
    FOREIGN KEY (Person_ID) REFERENCES PersonalInformation(ID)
);

CREATE TABLE SocialMedias (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Link VARCHAR(100),
    Person_ID INT,
    FOREIGN KEY (Person_ID) REFERENCES PersonalInformation(ID)
);

CREATE TABLE WorkExperience (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Position VARCHAR(100),
    Company VARCHAR(100),
    Location VARCHAR(100),
    Period VARCHAR(20),
    Description TEXT,
    Person_ID INT,
    FOREIGN KEY (Person_ID) REFERENCES PersonalInformation(ID)
);

CREATE TABLE Education (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Degree VARCHAR(100),
    Institution VARCHAR(100),
    Type VARCHAR(50),
    Location VARCHAR(100),
    Period VARCHAR(20),
    Description TEXT,
    Person_ID INT,
    FOREIGN KEY (Person_ID) REFERENCES PersonalInformation(ID)
);

CREATE TABLE Skills (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Skill VARCHAR(100),
    Person_ID INT,
    FOREIGN KEY (Person_ID) REFERENCES PersonalInformation(ID)
);

CREATE TABLE Languages (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Language VARCHAR(50),
    Level VARCHAR(20),
    Person_ID INT,
    FOREIGN KEY (Person_ID) REFERENCES PersonalInformation(ID)
);

CREATE TABLE Certifications (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Certificate VARCHAR(100),
    Institution VARCHAR(100),
    CompletionYear VARCHAR(10),
    Person_ID INT,
    FOREIGN KEY (Person_ID) REFERENCES PersonalInformation(ID)
);