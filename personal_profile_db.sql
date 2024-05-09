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

/*
Inserting Personal Information
*/
INSERT INTO PersonalInformation (Name, Address, City, Phone, Email, DesiredPosition)
VALUES ('Eduardo Schoepf', '', 'Paris', '+33652543966', 'eduardo.schoepf@hotmail.com', 'Software Developer');

/*
Getting the ID of the newly inserted personal information
*/
SET @person_id := LAST_INSERT_ID();

/*
Inserting About Me
*/
INSERT INTO AboutMe (Summary, Person_ID)
VALUES ('Hi there! 👋 I''m Eduardo Schoepf, and my journey in the world of software development began in 2015. Since then, I''ve been on a path filled with challenges and achievements that have solidified my passion for the technology field. Beyond code, I''m a world explorer, believing that diversity of experiences is the key to creativity. I enjoy teamwork, where communication is the secret to successful challenges. And, of course, I love challenges, as each bug is an opportunity to learn something new! I''m open to new opportunities as a SAP ABAP Consultant. Let''s create something amazing together! 🚀', @person_id);

/*
Inserting Media Links
*/
INSERT INTO MediaLinks (Name, Address, Person_ID)
VALUES ('PT', 'documents/cv_eduardo_schoepf_pt.pdf', @person_id),
       ('EN', 'documents/cv_eduardo_schoepf_en.pdf', @person_id),
       ('FR', 'documents/cv_eduardo_schoepf_fr.pdf', @person_id);

/*
Inserting Social Media Links
*/
INSERT INTO SocialMedias (Name, Link, Person_ID)
VALUES ('linkedin', 'https://www.linkedin.com/in/eduardoschoepf', @person_id),
       ('github', 'https://github.com/eduardoschoepf', @person_id);

/*
Inserting Work Experience
*/
INSERT INTO WorkExperience (Position, Company, Location, Period, Description, Person_ID)
VALUES ('IT Support', 'Public administration', 'Paris - FR', '2018 - Present', 'In my current role, I''ve specialized in analyzing XML flows and resolving incident tickets. I also contribute to the process of training and integrating new colleagues into the team. This experience has not only honed my technical skills, but also underlined the importance of effective teamwork and communication.', @person_id),
       ('JavaScript Developer', 'Mobixio', 'Montpellier - FR', '2017 - 2018', 'In 2017, I was employed as a JavaScript developer in Mobixio''s app development team. I collaborated on the design and feature implementation of the Yoozcool app - a cross-platform mobile application designed for real-time tracking of the status of a transportation fleet, and facilitating direct communication channels with drivers. The platform was developed using Ionic, Cordova, AngularJS and Leaflet technologies. My adaptability enabled me to quickly master the AngularJS framework, making a significant contribution to the success of the project.', @person_id),
       ('Software developer internship', 'O+ Studio', 'Montpellier - FR', '2016 (3 months)', 'This end-of-studies internship, lasting ten weeks, carried out within the company O plus Studio, punctuated my training as a software developer followed at Objectif 3W. The work done during this internship allowed me to put my training into practice. Missions and tasks carried out: • model a MySQL database; • create a web application in PHP5; • implement unit tests.', @person_id);

/*
Inserting Education
*/
INSERT INTO Education (Degree, Institution, Type, Location, Period, Description, Person_ID)
VALUES ('Bachelor''s degree in Software Engineering', 'UNINTER', 'Distance learning Bachelors', 'Santa Cruz do Sul - BR', '2023 - 2027', 'The Software Engineering degree course focuses on the following areas: software development, software project management, architecture, testing and other activities in the software life cycle.', @person_id),
       ('MOOC Introduction to Computer Science', 'CS50 - Harvard University', 'MOOC', '', '2023', 'This program covers concepts like abstraction, algorithms, data structures, encapsulation, resource management, security, software engineering, and web development. An introduction to a number of languages, including C, Python, SQL and JavaScript, as well as CSS and HTML.', @person_id),
       ('Professional Title of Software Developer', 'OBJECTIF 3W', 'Professional Title BAC +2', 'Montpellier - FR', '2015  - 2016', 'Proficient in a diverse range of programming languages, including XML, HTML5, CSS3, JavaScript, jQuery, Ajax, PHP5, SQL, and UML. Skilled in MySQL DBMS, method of analysis and design of MERISE systems, and experienced in object-oriented programming.', @person_id);

/*
Inserting Skills
*/
INSERT INTO Skills (Skill, Person_ID)
VALUES ('Full Stack', @person_id),
       ('JavaScript', @person_id),
       ('Java', @person_id),
       ('SAP ABAP', @person_id);

/*
Inserting Languages
*/
INSERT INTO Languages (Language, Level, Person_ID)
VALUES ('French', 'Advanced', @person_id),
       ('Portuguese', 'Advanced', @person_id);

/*
Inserting Certifications
*/
INSERT INTO Certifications (Certificate, Institution, CompletionYear, Person_ID)
VALUES ('', '', '', @person_id);