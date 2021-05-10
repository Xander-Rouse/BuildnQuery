/*TOUR (TourName, Description)
Primary Key (TourName)
EVENT (EventYear, EventMonth, EventDay, Fee)
Primary Key (EventYear, EventMonth, EventDay)
BOOKING (DateBooked, Payment)
CLIENT (ClientID, Surname, GivenName, Gender)
Primary Key (ClientID)*/

CREATE TABLE Tour
TourName NVARCHAR(100)
,Desciption NVARCHAR(500)
,PRIMARY KEY (TourName)
);

CREATE TABLE Client
ClientID INT
,Surname NVARCHAR(100)
,GivenName NVARCHAR(100)
,Gender NVARCHAR(1),
PRIMARY KEY (ClientID)
);

CREATE TABLE Event
TourName NVARCHAR(100)
,EventMonth NVARCHAR(3)
,EventDay INT
,EventYear INT
,EventFee MONEY
,PRIMARY KEY (TourName, EventMonth, EventDay, EventYear)
,FOREIGN KEY (TourName) REFERENCES (Tour)
);

CREATE TABLE Booking
ClientID INT
,EventMonth NVARCHAR(3)
,EventDay INT
,EventYear INT
,Payment MONEY
,DateBooked DATE
,PRIMARY KEY (ClientID, TourName, EventMonth, EventDay, EventYear)
,FOREIGN KEY (ClientID) REFERENCING (Client)
,FOREIGN KEY (TourName, EventMonth, EventDay, EventYear) REFERENCING (Event)
);

INSERT INTO Tour (Tourname, Description) VALUES
('North', 'Tour of wineries and outlets of the Bedigo and Castlemaine region'),
('South', 'Tour of wineries and outlets of Mornington Penisula'),
('West', 'Tour of wineries and outlets of the Geelong and Otways region');

INSERT INTO Client (ClientID, Surname, GivenName, Gender) VALUES
(1, 'Price', 'Taylor', 'M'),
(2, 'Gamble', 'Ellyse', 'F'),
(3, 'Tan', 'Tilly', 'F'),
(103590876, 'Rouse', 'Xander', 'M');

INSERT INTO Event (Tourname, EventMonth, EventDay, EventYear, EventFee) VALUES
('North', 'Jan', 9, 2016, 200),
('North', 'Feb', 13, 2016, 225),
('South', 'Jan', 9, 2016, 200),
('South', 'Jan', 16, 2016, 200),
('West', 'Jan', 29, 2016, 225);

INSERT INTO Booking (ClientID, Tourname, EventMonth, EventDay, EventYear, Payment, DateBooked) VALUES
(1, 'North', 'Jan', 9, 2016, 200, 10/12/2015),
(2, 'North', 'Jan', 9, 2016, 200, 16/12/2015),
(1, 'North', 'Feb', 13, 2016, 225, 8/1/2016),
(2, 'North', 'Feb', 13, 2016, 125, 14/1/2016),
(3, 'North', 'Feb', 13, 2016, 225, 3/2/2016),
(1, 'South', 'Jan', 9, 2016, 200, 10/12/2015),
(2, 'South', 'Jan', 16, 2016, 200, 18/12/2015),
(3, 'South', 'Jan', 16, 2016, 200, 9/1/2016),
(2, 'West', 'Jan', 29, 2016, 225, 17/12/2015),
(3, 'West', 'Jan', 29, 2016, 200, 18/12/2015);
