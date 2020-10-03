CREATE DATABASE bLYtz_Megaplex
USE bLYtz_Megaplex

CREATE TABLE MsStaff(
    StaffID CHAR(5) Primary Key NOT NULL,CHECK(StaffID LIKE 'SF[0-9][0-9][0-9]'),
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,CHECK(LEN(Name)>=7 AND LEN(Name)<=30),
    DOB DATE NOT NULL,CHECK(DATEDIFF(DAY,DOB,GETDATE())>=365*18),
    Gender VARCHAR(30) NOT NULL,CHECK(Gender ='Male' OR Gender LIKE 'Female'),
    Phone VARCHAR(30) NOT NULL,CHECK(Phone LIKE '08[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Address VARCHAR(255) NOT NULL, 
)

CREATE TABLE MsMovie(
 MovieID CHAR(5) PRIMARY KEY NOT NULL, CHECK(MovieID LIKE 'MV[0-9][0-9][0-9]'),
 MovieName VARCHAR(255) NOT NULL,
 LicenseNumber VARCHAR(30) NOT NULL,
 Duration INT NOT NULL, CHECK(Duration <=240)
) 

CREATE TABLE MsStudio(
    StudioID CHAR(5) PRIMARY KEY NOT NULL, Check(StudioID LIKE 'ST[0-9][0-9][0-9]'),
    StudioName VARCHAR(255) NOT NULL,
    S_Price INT NOT NULL, CHECK(S_Price BETWEEN 35000 AND 65000),
)

CREATE TABLE HeaderSchedule(
    ScheduleID CHAR(5) PRIMARY KEY NOT NULL, CHECK(ScheduleID LIKE 'MS[0-9][0-9][0-9]'),
    StudioID CHAR(5) NOT NULL,FOREIGN KEY(StudioID) REFERENCES MsStudio(StudioID),
    MovieID CHAR(5) NOT NULL,FOREIGN KEY(MovieID) REFERENCES MsMovie(MovieID),
    ShowTimeDate DATE NOT NULL,CHECK(DATEDIFF(DAY,GETDATE(),ShowTimeDate)>=7),
    MovieTime CHAR(5) NOT NULL,
)

CREATE TABLE MsRefreshmentType(
    RTID CHAR(5) PRIMARY KEY NOT NULL,CHECK(RTID LIKE 'RT[0-9][0-9][0-9]'),
    Ref_Name VARCHAR(255) NOT NULL,
    Ref_Type VARCHAR(255) NOT NULL,
)

CREATE TABLE MsRE(
    REID CHAR(5) PRIMARY KEY NOT NULL,CHECK(REID LIKE 'RE[0-9][0-9][0-9]'),
    RTID CHAR(5), FOREIGN KEY(RTID) REFERENCES MsRefreshmentType (RTID),
    Price INT NOT NULL,
    Stock INT NOT NULL, CHECK(Stock > 50),
)

CREATE TABLE HeaderMovie(
    MovieTr_ID CHAR(6) PRIMARY KEY NOT NULL,CHECK(MovieTr_ID LIKE 'MTr[0-9][0-9][0-9]'),
    StaffID CHAR(5),FOREIGN KEY(StaffID) REFERENCES MsStaff (StaffID),
    Movie_TransactionDate Date NOT NULL,      
)


CREATE TABLE MovieTransactionDetail(
    MovieTr_ID CHAR(6),FOREIGN KEY(MovieTr_ID) REFERENCES HeaderMovie (MovieTr_ID),
    ScheduleID CHAR(5),FOREIGN KEY(ScheduleID) REFERENCES HeaderSchedule (ScheduleID),
    PRIMARY KEY ( MovieTr_ID,ScheduleID),
    Seat INT NOT NULL,
)

CREATE TABLE HeaderRefreshment(
    RefreshmentTr_ID CHAR(6)  PRIMARY KEY NOT NULL,CHECK(RefreshmentTr_ID LIKE 'RTr[0-9][0-9][0-9]'),
    StaffID CHAR(5),FOREIGN KEY(StaffID) REFERENCES MsStaff (StaffID),
    Re_TransactionDate Date NOT NULL,
)


CREATE TABLE RefreshmentTransactionDetail(
	RefreshmentTr_ID CHAR(6) FOREIGN KEY(RefreshmentTr_ID) REFERENCES HeaderRefreshment (RefreshmentTr_ID),
	REID CHAR(5),FOREIGN KEY(REID) REFERENCES MsRE (REID),
	PRIMARY KEY ( RefreshmentTr_ID,REID),
    Quantity INT NOT NULL,
)
