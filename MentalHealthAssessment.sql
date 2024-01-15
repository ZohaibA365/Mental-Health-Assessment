
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'MentalHealth')
BEGIN
    CREATE DATABASE MentalHealth;
END;

-- Use the 'MentalHealth' database
USE MentalHealth;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Users') AND type in (N'U'))
BEGIN
    CREATE TABLE Users (
        UserID INT PRIMARY KEY IDENTITY(1,1),
        Username VARCHAR(255) NOT NULL,
        Email VARCHAR(255) NOT NULL,
        Password VARCHAR(255) NOT NULL
    );
END;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'MentalHealthAssessment') AND type in (N'U'))
BEGIN
    CREATE TABLE MentalHealthAssessment (
        AssessmentID INT PRIMARY KEY IDENTITY(1,1),
        UserID INT,
        Date DATE,
        Score INT,
        Comments VARCHAR(MAX),
        FOREIGN KEY (UserID) REFERENCES Users(UserID)
    );
END;


-- Insert sample users
INSERT INTO Users (Username, Email, Password) VALUES
('User1', 'user1@example.com', 'password1'),
('User2', 'user2@example.com', 'password2'),
('User3', 'user3@example.com', 'password3');

-- Insert sample mental health assessments
INSERT INTO MentalHealthAssessment (UserID, Date, Score, Comments) VALUES
(1, '2024-01-01', 70, 'Feeling okay'),
(1, '2024-01-05', 60, 'Some stress'),
(2, '2024-01-02', 85, 'Feeling good'),
(3, '2024-01-03', 45, 'Need support');

-- Query all users
SELECT * FROM Users;

-- Query all mental health assessments
SELECT * FROM MentalHealthAssessment;

-- Query assessments for a specific user (replace [UserID] with an actual UserID)
SELECT * FROM MentalHealthAssessment WHERE UserID = [UserID];