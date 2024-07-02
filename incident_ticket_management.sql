-- Create a database for incident management
CREATE DATABASE incident_management;

-- Switch to the database
USE incident_management;

-- Create a table for incident tickets
CREATE TABLE incident_tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each ticket
    title VARCHAR(255) NOT NULL,               -- Title of the incident
    description TEXT NOT NULL,                 -- Detailed description of the incident
    priority ENUM('Low', 'Medium', 'High', 'Critical') NOT NULL,  -- Priority level of the incident
    status ENUM('Open', 'In Progress', 'Resolved', 'Closed') NOT NULL DEFAULT 'Open',  -- Current status of the ticket
    reported_by VARCHAR(100) NOT NULL,         -- Name or ID of the person who reported the incident
    assigned_to VARCHAR(100),                  -- Name or ID of the person to whom the ticket is assigned
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp when the ticket was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  -- Timestamp of the last update
);

-- Insert sample data into the incident_tickets table
INSERT INTO incident_tickets (title, description, priority, status, reported_by, assigned_to)
VALUES
('Server Down', 'The main server is not responding.', 'Critical', 'Open', 'Alice Johnson', 'Bob Smith'),
('Login Issue', 'Users are unable to login to the portal.', 'High', 'In Progress', 'Charlie Brown', 'Diana Prince');

-- Select all data from the incident_tickets table
SELECT * FROM incident_tickets;

-- Select specific columns from the incident_tickets table
SELECT title, priority, status FROM incident_tickets;

-- Update the status of a ticket
UPDATE incident_tickets
SET status = 'Resolved', updated_at = CURRENT_TIMESTAMP
WHERE ticket_id = 1;

-- Delete a ticket from the table
DELETE FROM incident_tickets
WHERE ticket_id = 2;

-- Add a new column for resolution notes
ALTER TABLE incident_tickets
ADD resolution_notes TEXT;

-- Drop the incident_tickets table
DROP TABLE incident_tickets;

-- Drop the incident_management database
DROP DATABASE incident_management;
