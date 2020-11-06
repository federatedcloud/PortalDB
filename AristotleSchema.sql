-- --------------------------------------------------------
-- Host:                         128.84.8.68
-- Server version:               10.2.33-MariaDB - MariaDB Server
-- Server OS:                    Linux
-- HeidiSQL Version:             9.5.0.5295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table aristotle.AcademicStatus
CREATE TABLE IF NOT EXISTS `AcademicStatus` (
  `AcademicStatusID` int(11) NOT NULL,
  `AcademicStatusDescription` varchar(50) NOT NULL,
  UNIQUE KEY `AcademicStatusID` (`AcademicStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.Allocation
CREATE TABLE IF NOT EXISTS `Allocation` (
  `AllocationID` int(11) NOT NULL AUTO_INCREMENT,
  `RequestDate` datetime NOT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `ReviewDate` datetime DEFAULT NULL,
  `AllocationTitle` varchar(255) DEFAULT NULL,
  `AllocationAbstract` varchar(2048) DEFAULT NULL,
  `ExtensionJustification` varchar(2048) DEFAULT NULL,
  `EntityStatusID` int(11) NOT NULL,
  `ProjectID` varchar(20) DEFAULT NULL,
  `PersonID` int(11) NOT NULL,
  `CoreHrsRequested` int(11) DEFAULT NULL,
  `CoreHrsUsed` int(11) DEFAULT NULL,
  `CoreHrsAllocated` int(11) DEFAULT NULL,
  `StorageRequested` int(11) DEFAULT NULL,
  `StorageUsed` int(11) DEFAULT NULL,
  `StorageAllocated` int(11) DEFAULT NULL,
  `DateLastUpdate` datetime DEFAULT NULL,
  `AllocationType` enum('N','R','E') NOT NULL DEFAULT 'N',
  `ScalingJustification` varchar(100) DEFAULT NULL,
  `ReviewComments` varchar(2048) DEFAULT NULL,
  `Approved` enum('Y','N') DEFAULT NULL,
  `ReviewerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AllocationID`),
  KEY `EntityStatusID` (`EntityStatusID`),
  KEY `ProjectID` (`ProjectID`),
  KEY `EntityStatusID_2` (`EntityStatusID`),
  KEY `ProjectID_2` (`ProjectID`),
  KEY `ProjectID_3` (`ProjectID`),
  KEY `ProjectID_4` (`ProjectID`),
  KEY `AllocationID` (`AllocationID`),
  CONSTRAINT `Allocation_ibfk_1` FOREIGN KEY (`EntityStatusID`) REFERENCES `EntityStatus` (`EntityStatusID`) ON DELETE NO ACTION,
  CONSTRAINT `Project` FOREIGN KEY (`ProjectID`) REFERENCES `Project` (`ProjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.ChangeLog
CREATE TABLE IF NOT EXISTS `ChangeLog` (
  `ProjectID` varchar(20) NOT NULL,
  `PersonID` int(11) NOT NULL,
  `ActionTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `WhatChanged` varchar(50) NOT NULL,
  `oldValue` varchar(15) NOT NULL,
  `newValue` varchar(15) NOT NULL,
  KEY `ProjectID` (`ProjectID`),
  KEY `ActionTime` (`ActionTime`),
  KEY `ProjectID_2` (`ProjectID`),
  KEY `UserID_2` (`PersonID`),
  CONSTRAINT `Person` FOREIGN KEY (`PersonID`) REFERENCES `Person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.CurrentUsers
CREATE TABLE IF NOT EXISTS `CurrentUsers` (
  `username` varchar(50) NOT NULL,
  `status` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `id` varchar(45) NOT NULL,
  `identity_provider` varchar(45) NOT NULL,
  `organization` varchar(75) NOT NULL,
  `email` varchar(50) NOT NULL,
  `PersonID` int(11) NOT NULL,
  `mytimestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.EntityStatus
CREATE TABLE IF NOT EXISTS `EntityStatus` (
  `EntityStatusID` int(11) NOT NULL,
  `ActiveLevel` varchar(15) NOT NULL,
  `ActiveLevelDescription` varchar(50) NOT NULL,
  PRIMARY KEY (`EntityStatusID`),
  UNIQUE KEY `EntityStatusID` (`EntityStatusID`),
  KEY `EntityStatusID_2` (`EntityStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.FieldLookup
CREATE TABLE IF NOT EXISTS `FieldLookup` (
  `FieldIndex` int(11) NOT NULL AUTO_INCREMENT,
  `FieldName` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FieldIndex`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.InstanceUsage
CREATE TABLE IF NOT EXISTS `InstanceUsage` (
  `InstanceUsageIndex` int(11) NOT NULL AUTO_INCREMENT,
  `SiteID` int(11) NOT NULL,
  `ProjectID` varchar(20) NOT NULL,
  `InstanceID` varchar(36) NOT NULL,
  `Cores` int(11) NOT NULL,
  `CreationTime` datetime NOT NULL,
  `TimeLastChecked` datetime NOT NULL,
  `IPAddress` varchar(15) DEFAULT NULL,
  `imageID` varchar(14) DEFAULT NULL,
  KEY `InstanceUsageIndex` (`InstanceUsageIndex`)
) ENGINE=InnoDB AUTO_INCREMENT=5398961 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.Person
CREATE TABLE IF NOT EXISTS `Person` (
  `PersonID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) NOT NULL,
  `MiddleName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) NOT NULL,
  `WorkingTitle` varchar(75) DEFAULT NULL,
  `Institution` varchar(75) NOT NULL,
  `Field` varchar(50) NOT NULL,
  `AcademicStatus` varchar(50) NOT NULL,
  `StreetAddress1` varchar(50) NOT NULL,
  `StreetAddress2` varchar(50) DEFAULT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Zip` varchar(15) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `EmailAddress` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `DateAdded` datetime NOT NULL,
  `DateLastUpdate` datetime DEFAULT NULL,
  `EntityStatusID` int(11) NOT NULL,
  `GlobusSub` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PersonID`),
  UNIQUE KEY `PersonID_UNIQUE` (`PersonID`),
  UNIQUE KEY `EmailAddress_UNIQUE` (`EmailAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.Project
CREATE TABLE IF NOT EXISTS `Project` (
  `ProjectID` varchar(20) NOT NULL,
  `ProjectTitle` varchar(255) NOT NULL,
  `ProjectAbstract` varchar(2048) NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `EntityStatusID` int(11) NOT NULL,
  `PersonID` int(11) NOT NULL,
  PRIMARY KEY (`ProjectID`),
  UNIQUE KEY `ProjectID` (`ProjectID`),
  KEY `ProjectID_2` (`ProjectID`),
  KEY `EntityStatusID` (`EntityStatusID`),
  KEY `ProjectID_3` (`ProjectID`),
  KEY `EntityStatusID_2` (`EntityStatusID`),
  CONSTRAINT `EntityStatusProject` FOREIGN KEY (`EntityStatusID`) REFERENCES `EntityStatus` (`EntityStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.ProjectGroupMembers
CREATE TABLE IF NOT EXISTS `ProjectGroupMembers` (
  `ProjectID` varchar(20) NOT NULL,
  `PersonID` int(11) NOT NULL,
  `DateAdded` datetime NOT NULL,
  `DateRemoved` datetime DEFAULT NULL,
  `EntityStatusID` int(11) NOT NULL,
  `Proxy` int(11) DEFAULT 0,
  KEY `EntityStatusID` (`EntityStatusID`),
  KEY `ProjectID` (`ProjectID`),
  KEY `EntityStatusID_2` (`EntityStatusID`),
  KEY `PersonToProject_idx` (`PersonID`),
  CONSTRAINT `PGMemberStatus` FOREIGN KEY (`EntityStatusID`) REFERENCES `EntityStatus` (`EntityStatusID`),
  CONSTRAINT `PersonToProject` FOREIGN KEY (`PersonID`) REFERENCES `Person` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ProjectGroupMembers_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `Project` (`ProjectID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.ProjectUsage
CREATE TABLE IF NOT EXISTS `ProjectUsage` (
  `puindex` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(50) NOT NULL,
  `siteid` int(11) NOT NULL,
  `ram` int(11) NOT NULL,
  `vcpus` int(11) NOT NULL,
  `vms` int(11) NOT NULL,
  `vol_size` int(11) NOT NULL,
  `vols` int(11) NOT NULL,
  `putimestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `puindex` (`puindex`)
) ENGINE=InnoDB AUTO_INCREMENT=450866 DEFAULT CHARSET=latin1 COMMENT='Collecting usage from each site';

-- Data exporting was unselected.
-- Dumping structure for table aristotle.Site
CREATE TABLE IF NOT EXISTS `Site` (
  `SiteID` int(11) NOT NULL,
  `SiteName` varchar(20) NOT NULL,
  `ResourceID` int(11) NOT NULL,
  `ResourceName` varchar(30) NOT NULL,
  `ResourceDescription` varchar(50) NOT NULL,
  `Unit` int(11) NOT NULL,
  `CostPerUnit` float NOT NULL,
  `TimeDimensionForUnit` varchar(10) NOT NULL,
  `EntityStatusID` int(11) NOT NULL,
  `AdditionalInfo` varchar(50) NOT NULL,
  PRIMARY KEY (`ResourceID`),
  KEY `SiteID` (`SiteID`),
  KEY `ResourceID` (`ResourceID`),
  KEY `EntityStatusID` (`EntityStatusID`),
  CONSTRAINT `Site_ibfk_1` FOREIGN KEY (`EntityStatusID`) REFERENCES `EntityStatus` (`EntityStatusID`) ON DELETE NO ACTION,
  CONSTRAINT `Site_ibfk_2` FOREIGN KEY (`SiteID`) REFERENCES `SiteID` (`SiteID`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.SiteHealthStatus
CREATE TABLE IF NOT EXISTS `SiteHealthStatus` (
  `ID` int(11) NOT NULL,
  `SiteHealthTypeID` int(11) NOT NULL,
  `SiteID` int(11) NOT NULL,
  `AffectedSystems` varchar(30) NOT NULL,
  `Description` varchar(250) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `TimePosted` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PostedByUserID` varchar(15) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`),
  KEY `SiteID` (`SiteID`),
  KEY `SiteHealthTypeID` (`SiteHealthTypeID`),
  KEY `SiteHealthTypeID_2` (`SiteHealthTypeID`),
  CONSTRAINT `SiteHealthStatus_ibfk_1` FOREIGN KEY (`SiteID`) REFERENCES `Site` (`SiteID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SiteHealthStatus_ibfk_2` FOREIGN KEY (`SiteHealthTypeID`) REFERENCES `SiteHealthType` (`SiteHealthTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.SiteHealthType
CREATE TABLE IF NOT EXISTS `SiteHealthType` (
  `SiteHealthTypeID` int(11) NOT NULL,
  `StatusType` varchar(25) NOT NULL,
  PRIMARY KEY (`SiteHealthTypeID`),
  KEY `SiteHealthTypeID` (`SiteHealthTypeID`),
  KEY `SiteHealthTypeID_2` (`SiteHealthTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.SiteID
CREATE TABLE IF NOT EXISTS `SiteID` (
  `SiteID` int(11) NOT NULL,
  `SiteName` varchar(50) NOT NULL,
  `ShortName` varchar(30) NOT NULL,
  `InstanceCollectionIntervalInMinutes` int(11) NOT NULL DEFAULT 10,
  `StorageCollectionIntervalInMinutes` int(11) NOT NULL DEFAULT 10,
  `EntityStatusID` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`SiteID`),
  KEY `ShortName` (`ShortName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.StorageUsage
CREATE TABLE IF NOT EXISTS `StorageUsage` (
  `StorageIndex` int(11) NOT NULL AUTO_INCREMENT,
  `SiteID` int(11) NOT NULL,
  `ProjectID` varchar(20) NOT NULL,
  `UserID` varchar(15) DEFAULT NULL,
  `GBs` int(11) NOT NULL,
  `volumeID` varchar(36) NOT NULL,
  `dateCaptured` datetime NOT NULL,
  KEY `StorageIndex` (`StorageIndex`)
) ENGINE=InnoDB AUTO_INCREMENT=9227145 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.UsageHistory
CREATE TABLE IF NOT EXISTS `UsageHistory` (
  `Index` int(11) NOT NULL AUTO_INCREMENT,
  `SiteID` int(11) NOT NULL,
  `ProjectID` varchar(20) NOT NULL,
  `ResourceID` int(11) NOT NULL,
  `YearMonth` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Usage` float unsigned NOT NULL,
  KEY `Index` (`Index`)
) ENGINE=InnoDB AUTO_INCREMENT=901 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.UserOrProjectStatusPerSite
CREATE TABLE IF NOT EXISTS `UserOrProjectStatusPerSite` (
  `Index` int(11) NOT NULL AUTO_INCREMENT,
  `SiteID` int(11) NOT NULL,
  `ProjectID` varchar(20) NOT NULL,
  `EmailAddress` varchar(50) NOT NULL,
  `PersonID` int(11) NOT NULL,
  `EntityStatusID` int(11) NOT NULL,
  `SiteUserID` varchar(50) DEFAULT NULL,
  UNIQUE KEY `Index` (`Index`),
  KEY `SiteID` (`SiteID`,`ProjectID`,`PersonID`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table aristotle.Utilization
CREATE TABLE IF NOT EXISTS `Utilization` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeStamp` datetime NOT NULL,
  `PercentUsed` int(11) NOT NULL,
  `ResourceName` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `ID_2` (`ID`),
  KEY `ResourceName` (`ResourceName`),
  CONSTRAINT `Utilization_ibfk_1` FOREIGN KEY (`ResourceName`) REFERENCES `SiteID` (`ShortName`)
) ENGINE=InnoDB AUTO_INCREMENT=490975 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for procedure aristotle.AddUserToProjectRequest
DELIMITER //
CREATE DEFINER=`lmw25`@`10.17.211.%` PROCEDURE `AddUserToProjectRequest`(
	IN `iPersonID` INT,
	IN `iProjectID` VARCHAR(20)



)
BEGIN
SET @mycount = (SELECT COUNT(*) FROM `aristotle`.`ProjectGroupMembers` WHERE iProjectID = `ProjectGroupMembers`.ProjectID AND iPersonID = `ProjectGroupMembers`.PersonID);
## if (@mycount == 0)
IF (@mycount = 0) THEN
INSERT INTO `aristotle`.`ProjectGroupMembers`
(`ProjectID`, 
`PersonID`, 
DateAdded, 
EntityStatusID)
VALUES
(iProjectID,
iPersonID,
UTC_TIMESTAMP(),
2);

INSERT INTO `aristotle`.`UserOrProjectStatusPerSite`
(`SiteID`, `ProjectID`, `EmailAddress`, `PersonID`, `EntityStatusID`, `SiteUserID`)
VALUES
(2, iProjectID, (SELECT EmailAddress FROM Person WHERE PersonID = iPersonID), iPersonID, 2, NULL),
(3, iProjectID, (SELECT EmailAddress FROM Person WHERE PersonID = iPersonID), iPersonID, 2, NULL),
(4, iProjectID, (SELECT EmailAddress FROM Person WHERE PersonID = iPersonID), iPersonID, 2, NULL);
END IF;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.ApproveProject
DELIMITER //
CREATE DEFINER=`lmw25`@`10.17.211.%` PROCEDURE `ApproveProject`(
	IN `tempProjID` VARCHAR(20)



)
BEGIN

SET @proj = 'aristotle';
UPDATE Project
SET ProjectID = GetNextProjectID(@proj), EntityStatusID = 4
WHERE ProjectID = tempProjID;

END//
DELIMITER ;

-- Dumping structure for procedure aristotle.DeleteProject
DELIMITER //
CREATE DEFINER=`lmw25`@`10.17.211.%` PROCEDURE `DeleteProject`(
	IN `IprojectID` VARCHAR(20)




)
BEGIN

UPDATE Project
SET EntityStatusID = 5, EndDate = UTC_TIMESTAMP()
WHERE ProjectID = IprojectID;

UPDATE ProjectGroupMembers
SET DateRemoved = UTC_TIMESTAMP(), EntityStatusID = 5
WHERE ProjectID = IprojectID;

UPDATE UserOrProjectStatusPerSite
SET EntityStatusID = 5
WHERE ProjectID = IprojectID;

END//
DELIMITER ;

-- Dumping structure for procedure aristotle.DoesUserExist
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `DoesUserExist`(IN eMail varchar(50))
BEGIN
SELECT COUNT(*) AS count
FROM `Person`
WHERE eMail = `Person`.`EmailAddress`;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetAcademicStatus
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.72` PROCEDURE `GetAcademicStatus`()
BEGIN
SELECT *
FROM AcademicStatus;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetActiveProjects
DELIMITER //
CREATE DEFINER=`lmw25`@`10.17.211.%` PROCEDURE `GetActiveProjects`()
BEGIN
SELECT ProjectID FROM Project WHERE EntityStatusID = 1;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetActiveSites
DELIMITER //
CREATE DEFINER=`lmw25`@`10.17.211.%` PROCEDURE `GetActiveSites`()
BEGIN
SELECT * FROM SiteID WHERE EntityStatusID = 1;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetAllocation
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `GetAllocation`()
BEGIN
SELECT * 
FROM aristotle.Allocation
Order By PersonID, ProjectID;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetAllocationByID
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.72` PROCEDURE `GetAllocationByID`(
	IN `projectID` VARCHAR(20)
)
BEGIN
SELECT *
FROM Allocation
WHERE Allocation.ProjectID = projectID AND Allocation.EntityStatusID = 1;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetBalanceByProject
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `GetBalanceByProject`(
	IN `proj` VARCHAR(20)

)
BEGIN
SELECT CAST(DATE_FORMAT(NOW() ,'%Y-%m-01') as DATE) INTO @DEnd;
SELECT DATE_ADD(@DEnd, INTERVAL -1 MONTH) INTO @DStart;
SET @Used = 0;

SELECT SUM(P.CoreHours) As Used
INTO @Used
		FROM
		(
		SELECT ProjectID, UsageHistory.`Usage` AS CoreHours
		FROM UsageHistory
		WHERE (MOD(ResourceID, 2) = 1) and ProjectID = proj AND YearMonth < @DEnd AND YearMonth > @DStart
		)As P;


SELECT  CoreHrsRequested, CEIL(@Used) As Used, CoreHrsRequested - CEIL(@Used) AS Balance
FROM aristotle.Allocation
WHERE ProjectID = proj AND EntityStatusID = 1;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetCoreHoursAllProjects
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.72` PROCEDURE `GetCoreHoursAllProjects`(
	IN `Dstart` DATETIME,
	IN `Dend` DATETIME
)
SELECT  g.ProjectID, SUM(g.CoreMinutes)/60 AS CoreHours
FROM
(

	SELECT SUM(c.Cores * c.MinutesUsed)  AS CoreMinutes, c.ProjectID, c.InstanceID
	FROM
	(
		SELECT t.MinutesUsed, t.InstanceID, t.pTimeStamp, t.TimeLastChecked, t.ProjectID, t.Cores
		FROM
		(
			SELECT  TIMESTAMPDIFF(MINUTE, pTimeStamp, TimeLastChecked) AS MinutesUsed, q.*
			FROM    (

				SELECT *, 
				LAG( TimeLastChecked ) OVER(PARTITION BY InstanceID ORDER BY TimeLastChecked) as pTimeStamp
				FROM   aristotle.InstanceUsage
				WHERE TimeLastChecked >= Dstart AND TimeLastChecked <= Dend
			) AS q
			WHERE pTimeStamp IS NOT NULL 
		) AS t 
		WHERE MinutesUsed < 31 
	) AS c
	GROUP BY c.InstanceID, c.ProjectID
) AS g
GROUP BY g.ProjectID//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetCoreHoursUsed
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `GetCoreHoursUsed`(
	IN `P` VARCHAR(20),
	IN `Dstart` DATETIME,
	IN `Dend` DATETIME
)
BEGIN
SELECT SUM(Proj.CoreHours)
FROM
	(SELECT InstanceUsage.SiteID, ProjectID, InstanceID, Cores, ((COUNT(InstanceID)) * (SiteID.InstanceCollectionIntervalInMinutes/60)) AS TimeByHour, (Cores * (COUNT(InstanceID)) * (SiteID.InstanceCollectionIntervalInMinutes/60))  As CoreHours
	FROM InstanceUsage LEFT OUTER JOIN SiteID ON InstanceUsage.SiteID = SiteID.SiteID
	WHERE InstanceUsage.TimeLastChecked > Dstart AND InstanceUsage.TimeLastChecked < Dend AND ProjectID = P
	GROUP BY ProjectID, InstanceID, Cores) AS Proj;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetCoreHoursUsedBySite
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `GetCoreHoursUsedBySite`(
	IN `startDate` DATETIME,
	IN `endDate` DATETIME

)
BEGIN
SELECT UsageHistory.SiteID, ProjectID, UsageHistory.`Usage` As CoreHours
 FROM UsageHistory WHERE YearMonth > startDate AND YearMonth < endDate AND MOD(ResourceID, 2) = 1;
/*
SELECT P.SiteID As SiteID, P.ProjectID As ProjectID, CEIL(SUM(P.CoreHours)) As CoreHours
			FROM
				(
				SELECT        InstanceUsage.SiteID, ProjectID, InstanceID, Cores, ((COUNT(InstanceID)) * (SiteID.InstanceCollectionIntervalInMinutes/60)) AS TimeByHour, (Cores * (COUNT(InstanceID)) * (SiteID.InstanceCollectionIntervalInMinutes/60))  As CoreHours
				FROM            InstanceUsage LEFT OUTER JOIN SiteID ON InstanceUsage.SiteID = SiteID.SiteID
				WHERE TimeLastChecked > startDate AND TimeLastChecked < endDate
                GROUP BY ProjectID, InstanceID, Cores
				)As P
			GROUP By P.SiteID, P.ProjectID;
			*/
   
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetGBPerMonthByProject
DELIMITER //
CREATE DEFINER=`lmw25`@`10.17.211.%` PROCEDURE `GetGBPerMonthByProject`(
	IN `proj` VARCHAR(20),
	IN `StartDate` DATETIME,
	IN `EndDate` DATETIME

)
    COMMENT 'Get GB By Project'
BEGIN
SELECT Total.SiteID, Total.ProjectID, SUM(Total.GBHours) / TIMESTAMPDIFF(HOUR, StartDate, EndDate) AS GBperMo 
FROM
	(SELECT SiteID, ProjectID, volumeID, TIMESTAMPDIFF(HOUR, MIN(dateCaptured),MAX(dateCaptured)) * GBs AS GBHours
	FROM aristotle.StorageUsage
	WHERE dateCaptured > StartDate AND dateCaptured < EndDate and ProjectID = proj
	GROUP By volumeID) AS Total
GROUP BY Total.ProjectID;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetGBPerMonthBySite
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `GetGBPerMonthBySite`(
	IN `DateStart` DATETIME,
	IN `DateEnd` DATETIME


)
BEGIN

SELECT UsageHistory.SiteID, ProjectID, UsageHistory.`Usage` AS GBperMo
 FROM UsageHistory WHERE YearMonth > '2018-04-01' AND YearMonth < '2018-05-01' AND MOD(ResourceID, 2) = 0;
 /*
SELECT Total.SiteID, Total.ProjectID, SUM(Total.GBHours) / TIMESTAMPDIFF(HOUR, DateStart, DateEnd) AS GBperMo 
FROM
	(SELECT SiteID, ProjectID, volumeID, TIMESTAMPDIFF(HOUR, MIN(dateCaptured),MAX(dateCaptured)) * GBs AS GBHours
	FROM aristotle.StorageUsage
	WHERE dateCaptured > DateStart AND dateCaptured < DateEnd
	GROUP By volumeID) AS Total
GROUP BY Total.ProjectID;*/
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetGlobusUsers
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.72` PROCEDURE `GetGlobusUsers`()
BEGIN

SELECT id, username, `status`, `name`, email, identity_provider, organization
	,(SELECT GROUP_CONCAT(ProjectID SEPARATOR ',') FROM ProjectGroupMembers WHERE ProjectGroupMembers.PersonID = CurrentUsers.PersonID) As projects
FROM CurrentUsers
WHERE (SELECT GROUP_CONCAT(ProjectID SEPARATOR ',') FROM ProjectGroupMembers WHERE ProjectGroupMembers.PersonID = CurrentUsers.PersonID AND ProjectGroupMembers.EntityStatusID = 1) IS NOT NULL;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetPeople
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `GetPeople`()
BEGIN

SELECT *
FROM Person
ORDER By Person.LastName;

END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetPerson
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `GetPerson`(IN eMail varchar(50))
BEGIN
SELECT * FROM aristotle.Person
WHERE eMail = EmailAddress;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetPersonByID
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.72` PROCEDURE `GetPersonByID`(
	IN `personID` INT
)
BEGIN
SELECT *
FROM Person
WHERE Person.PersonID = personID;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetPIorProxy
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `GetPIorProxy`(IN project varchar(20))
BEGIN
SET @personID = (SELECT PersonID
FROM Project 
WHERE ProjectID = project);

SELECT 'PI', FirstName, LastName, EmailAddress
FROM Person
WHERE @personID = PersonID

UNION

SELECT 'Proxy', FirstName,LastName,EmailAddress
FROM ProjectGroupMembers JOIN Person ON ProjectGroupMembers.PersonID = Person.PersonID
WHERE ProjectID = project and Proxy = 1;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetProject
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `GetProject`(IN project varchar(20))
BEGIN
SELECT * FROM aristotle.Project
WHERE project = ProjectID;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetProjectListForUserRequest
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.72` PROCEDURE `GetProjectListForUserRequest`(
	IN `personid` INT

)
BEGIN

CREATE Temporary TABLE tbl_temp (ProjectID VARCHAR(20) NOT NULL);

INSERT INTO tbl_temp(ProjectID)
Select `ProjectGroupMembers`.ProjectID FROM `aristotle`.`ProjectGroupMembers`
WHERE `ProjectGroupMembers`.PersonID = personid AND (EntityStatusID = 1 OR EntityStatusID = 2);

SELECT `Project`.ProjectID FROM tbl_temp 
RIGHT JOIN `Project` ON tbl_temp.ProjectID = `Project`.ProjectID
WHERE `Project`.EntityStatusID = 1 AND  tbl_temp.ProjectID IS NULL;

DROP Temporary TABLE tbl_temp;

END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetProjectMembers
DELIMITER //
CREATE DEFINER=`Utilize`@`localhost` PROCEDURE `GetProjectMembers`(
	IN `P` VARCHAR(20)

)
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT 'Get Project Members'
Select Person.FirstName, Person.LastName, Person.EmailAddress, T1.EntityStatusID
FROM
aristotle.Person JOIN 
(SELECT `ProjectGroupMembers`.`PersonID`,`ProjectGroupMembers`.`EntityStatusID`
FROM `ProjectGroupMembers`
 LEFT JOIN `aristotle`.`Project` ON `ProjectGroupMembers`.`ProjectID` = `Project`.`ProjectID`
WHERE `Project`.`ProjectID`= P) T1
ON Person.PersonID = T1.PersonID
ORDER BY Person.LastName//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetProjectsForPIOrProxy
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `GetProjectsForPIOrProxy`(IN eMail varchar(50))
BEGIN

SET @personID = (SELECT  Person.PersonID
FROM Person
WHERE eMail = `Person`.`EmailAddress`);

-- SELECT @personID;

SELECT ProjectID
FROM Project
WHERE @personID = Project.PersonID AND EntityStatusID = 1
UNION
SELECT ProjectID
FROM ProjectGroupMembers
WHERE @personID = ProjectGroupMembers.PersonID and ProjectGroupMembers.Proxy = 1 and EntityStatusID = 1
ORDER BY ProjectID;

END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetProjectsForUser
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `GetProjectsForUser`(
	IN `eMail` varchar(50)

)
BEGIN
SET @personID = (SELECT  Person.PersonID
FROM Person
WHERE eMail = `Person`.`EmailAddress`);

-- SELECT @personID;

SELECT ProjectID, ProjectGroupMembers.EntityStatusID, EntityStatus.ActiveLevel
FROM ProjectGroupMembers
JOIN EntityStatus ON ProjectGroupMembers.EntityStatusID = EntityStatus.EntityStatusID
WHERE @personID = ProjectGroupMembers.PersonID;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetStorageBalanceByProject
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `GetStorageBalanceByProject`(
	IN `proj` VARCHAR(20)



)
BEGIN
#SET @DStart = SELECT CAST(DATE_FORMAT(NOW() ,'%Y-%m-01') as DATE);
SELECT CAST(DATE_FORMAT(NOW() ,'%Y-%m-01') as DATE) INTO @DEnd;
SELECT DATE_ADD(@DEnd, INTERVAL -1 MONTH) INTO @DStart;
SET @Used = 0;

SELECT SUM(T.GBMonthlyHours)
INTO @Used
FROM
(
SELECT ProjectID, UsageHistory.`Usage` AS GBMonthlyHours
FROM UsageHistory
WHERE (MOD(ResourceID, 2) = 0) and ProjectID = proj AND YearMonth < @DEnd AND YearMonth > @DStart
) AS T
GROUP BY ProjectID;

SELECT  StorageRequested, CEIL(@Used) As Used, StorageRequested - CEIL(@Used) AS Balance
FROM aristotle.Allocation
WHERE ProjectID = proj;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetUserRequests
DELIMITER //
CREATE DEFINER=`lmw25`@`10.17.211.%` PROCEDURE `GetUserRequests`(
	IN `iProjectID` VARCHAR(20)


)
BEGIN
SELECT FirstName, LastName, Person.PersonID
FROM Person JOIN ProjectGroupMembers ON Person.PersonID = ProjectGroupMembers.PersonID
WHERE  ProjectGroupMembers.EntityStatusID = 2 and ProjectGroupMembers.ProjectID = iProjectID;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.GetUtilization
DELIMITER //
CREATE DEFINER=`Utilize`@`localhost` PROCEDURE `GetUtilization`()
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'Get Utilization info'
SELECT DISTINCT `TimeStamp`, `PercentUsed`, `ResourceName`
FROM `Utilization`
ORDER BY `TimeStamp` DESC
LIMIT 700//
DELIMITER ;

-- Dumping structure for procedure aristotle.InsertAllocation
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.72` PROCEDURE `InsertAllocation`(
	IN `startDate` DATETIME,
	IN `endDate` DATETIME,
	IN `reviewDate` DATETIME,
	IN `allocationTitle` VARCHAR(255),
	IN `allocationAbstract` VARCHAR(2048),
	IN `extensionJustification` VARCHAR(2048),
	IN `entityStatusID` INT,
	IN `projectID` VARCHAR(20),
	IN `personID` INT,
	IN `coreHrsRequested` INT,
	IN `coreHrsAllocated` INT,
	IN `storageRequested` INT

,
	IN `storageAllocated` INT,
	IN `allocationType` ENUM('N','R','E'),
	IN `scalingJustification` VARCHAR(100)


,
	OUT `MyallocationID` INT

)
BEGIN
INSERT INTO `aristotle`.`Allocation`
(RequestDate,StartDate,EndDate,ReviewDate,AllocationTitle,AllocationAbstract,ExtensionJustification,EntityStatusID,ProjectID,PersonID,CoreHrsRequested,CoreHrsAllocated,StorageRequested,StorageAllocated,DateLastUpdate,AllocationType,ScalingJustification) 
VALUES
(UTC_TIMESTAMP(),
startDate,
endDate,
reviewDate,
allocationTitle,
allocationAbstract,
extensionJustification,
entityStatusID,
projectID,
personID,
coreHrsRequested,
coreHrsAllocated,
storageRequested,
storageAllocated,
UTC_TIMESTAMP(),
allocationType,
scalingJustification);

SET MyallocationID = (SELECT MAX(AllocationID) AS MyAllocID FROM Allocation);

END//
DELIMITER ;

-- Dumping structure for procedure aristotle.InsertAllocationOrig
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.72` PROCEDURE `InsertAllocationOrig`(
	IN `startDate` DATETIME,
	IN `endDate` DATETIME,
	IN `reviewDate` DATETIME,
	IN `allocationTitle` VARCHAR(255),
	IN `allocationAbstract` VARCHAR(2048),
	IN `extensionJustification` VARCHAR(2048),
	IN `entityStatusID` INT,
	IN `projectID` VARCHAR(20),
	IN `personID` INT,
	IN `coreHrsRequested` INT,
	IN `coreHrsAllocated` INT,
	IN `storageRequested` INT,
	IN `storageAllocated` INT,
	IN `allocationType` ENUM('N','R','E'),
	IN `scalingJustification` VARCHAR(100)
)
BEGIN
INSERT INTO `aristotle`.`Allocation`
(RequestDate,StartDate,EndDate,ReviewDate,AllocationTitle,AllocationAbstract,ExtensionJustification,EntityStatusID,ProjectID,PersonID,CoreHrsRequested,CoreHrsAllocated,StorageRequested,StorageAllocated,DateLastUpdate,AllocationType,ScalingJustification) 
VALUES
(UTC_TIMESTAMP(),
startDate,
endDate,
reviewDate,
allocationTitle,
allocationAbstract,
extensionJustification,
entityStatusID,
projectID,
personID,
coreHrsRequested,
coreHrsAllocated,
storageRequested,
storageAllocated,
UTC_TIMESTAMP(),
allocationType,
scalingJustification);
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.InsertPerson
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `InsertPerson`(
	IN `fname` VARCHAR(20),
	IN `mname` VARCHAR(20),
	IN `lname` VARCHAR(20),
	IN `workingtitle` VARCHAR(75),
	IN `email` VARCHAR(50),
	IN `globussub` VARCHAR(45),
	IN `institution` VARCHAR(75),
	IN `field` VARCHAR(50),
	IN `academicstatus` VARCHAR(50),
	IN `phone` VARCHAR(15),
	IN `street1` VARCHAR(50),
	IN `street2` VARCHAR(50),
	IN `city` VARCHAR(50),
	IN `state` VARCHAR(50),
	IN `zip` VARCHAR(15),
	IN `country` VARCHAR(50)



)
BEGIN
INSERT INTO `aristotle`.`Person`
(`FirstName`,
`MiddleName`,
`LastName`,
`WorkingTitle`,
`Institution`,
`Field`,
`AcademicStatus`,
`StreetAddress1`,
`StreetAddress2`,
`City`,
`State`,
`Zip`,
`Country`,
`EmailAddress`,
`Phone`,
`DateAdded`,
`DateLastUpdate`,
`EntityStatusID`,
`GlobusSub`)
VALUES
(fname,
mname,
lname,
workingtitle,
institution,
field,
academicstatus,
street1,
street2,
city,
state,
zip,
country,
email,
phone,
UTC_TIMESTAMP(),
UTC_TIMESTAMP(),
2,
globussub);
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.InsertProject
DELIMITER //
CREATE DEFINER=`lmw25`@`10.17.211.%` PROCEDURE `InsertProject`()
    COMMENT 'Insert a new project into Project Table'
BEGIN

SET @projectID = 'something';
SET @projectPrefix = 'aristotle';
SET @projectID = GetNextProjectID(@projectPrefix);

/* SELECT @projectID, @projectTitle, @projectAbstract; */

INSERT INTO `aristotle`.`Project`
(`ProjectID`,
`ProjectTitle`,
`ProjectAbstract`,
`StartDate`,
`EndDate`,
`EntityStatusID`,
`PersonID`)
VALUES
(@projectID,
(SELECT Allocation.AllocationTitle
FROM aristotle.Allocation
WHERE Allocation.Approved = 'Y' AND Allocation.EntityStatusID = 4 and Allocation.AllocationType = 'N'),
(SELECT Allocation.AllocationAbstract
FROM aristotle.Allocation
WHERE Allocation.Approved = 'Y' AND Allocation.EntityStatusID = 4 and Allocation.AllocationType = 'N'),
(SELECT Allocation.StartDate
FROM aristotle.Allocation
WHERE Allocation.Approved = 'Y' AND Allocation.EntityStatusID = 4 and Allocation.AllocationType = 'N'),
(SELECT Allocation.EndDate
FROM aristotle.Allocation
WHERE Allocation.Approved = 'Y' AND Allocation.EntityStatusID = 4 and Allocation.AllocationType = 'N'),
4,
(SELECT Allocation.PersonID
FROM aristotle.Allocation
WHERE Allocation.Approved = 'Y' AND Allocation.EntityStatusID = 4 and Allocation.AllocationType = 'N'));

UPDATE Allocation
SET Allocation.ProjectID = @projectID, Allocation.EntityStatusID = 1
WHERE Allocation.Approved = 'Y' AND Allocation.EntityStatusID = 4 and Allocation.AllocationType = 'N';
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.InstanceGetMaxDate
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `InstanceGetMaxDate`(IN `P` INT)
BEGIN
SELECT MAX(TimeLastChecked) FROM aristotle.InstanceUsage WHERE `InstanceUsage`.`SiteID`= P;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.StorageGetMaxDate
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `StorageGetMaxDate`(IN `P` INT)
BEGIN
SELECT MAX(dateCaptured) FROM aristotle.StorageUsage WHERE `StorageUsage`.`SiteID`= P;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.UpdateAllocation
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.72` PROCEDURE `UpdateAllocation`(
	IN `allocationID` INT,
	IN `startDate` DATETIME,
	IN `endDate` DATETIME,
	IN `entityStatusID` INT,
	IN `coreHrsAllocated` INT,
	IN `storageAllocated` INT,
	IN `reviewComments` VARCHAR(2048),
	IN `approved` ENUM('Y','N'),
	IN `reviewerID` INT
)
BEGIN
UPDATE `aristotle`.`Allocation`
SET  
`StartDate` = startDate, 
`EndDate` = endDate,
`ReviewDate` = UTC_TIMESTAMP(),
`EntityStatusID` = entityStatusID,
`CoreHrsAllocated` = coreHrsAllocated,
`StorageAllocated` = storageAllocated,
`ReviewComments` = reviewComments,
`DateLastUpdate` = UTC_TIMESTAMP(),
`Approved` = approved,
`ReviewerID` = reviewerID
WHERE `Allocation`.`AllocationID` = allocationID;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.UpdateApprovedStatus
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.72` PROCEDURE `UpdateApprovedStatus`()
BEGIN
UPDATE
    Person P,
    ProjectGroupMembers PGM
SET
    P.EntityStatusID = 1, PGM.EntityStatusID = 1
WHERE
    P.PersonID = PGM.PersonID AND PGM.EntityStatusID = 4;

END//
DELIMITER ;

-- Dumping structure for procedure aristotle.UpdatePerson
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.173` PROCEDURE `UpdatePerson`(
	IN `email` VARCHAR(50),
	IN `globussub` VARCHAR(45),
	IN `institution` VARCHAR(75),
	IN `field` VARCHAR(50),
	IN `academicstatus` VARCHAR(50),
	IN `phone` VARCHAR(15),
	IN `street1` VARCHAR(50),
	IN `street2` VARCHAR(50),
	IN `city` VARCHAR(50),
	IN `state` VARCHAR(50),
	IN `zip` VARCHAR(15),
	IN `country` VARCHAR(50),
	IN `workingTitle` VARCHAR(75)


)
BEGIN
UPDATE `aristotle`.`Person`
SET 
`WorkingTitle`= workingTitle,
`Institution`= institution,
`Field` = field,
`AcademicStatus` = academicstatus,
`StreetAddress1`= street1,
`StreetAddress2` = street2,
`City`=city,
`State`=state,
`Zip`=zip,
`Country`=country,
`Phone`=phone,
`DateLastUpdate`= UTC_TIMESTAMP(),
`GlobusSub`= globussub
WHERE `Person`.`EmailAddress`= email;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.UpdateProject
DELIMITER //
CREATE DEFINER=`lmw25`@`10.17.211.%` PROCEDURE `UpdateProject`(
	IN `projectID` VARCHAR(20),
	IN `projectTitle` VARCHAR(255),
	IN `projectAbstract` VARCHAR(2048)


)
BEGIN
UPDATE Project
SET Project.ProjectTitle = projectTitle, Project.ProjectAbstract = projectAbstract
WHERE Project.ProjectID = projectID;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.UpdateProjectStatus
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.72` PROCEDURE `UpdateProjectStatus`(
	IN `projectID` VARCHAR(20),
	IN `entityStatus` INT

)
BEGIN
UPDATE Project
SET Project.EntityStatusID = entityStatus
WHERE Project.ProjectID = projectID;
END//
DELIMITER ;

-- Dumping structure for procedure aristotle.UpdateProxy
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.72` PROCEDURE `UpdateProxy`(
	IN `proxy` INT,
	IN `projectID` VARCHAR(20),
	IN `personID` INT
)
BEGIN

UPDATE ProjectGroupMembers 
SET ProjectGroupMembers.Proxy=proxy
WHERE ProjectGroupMembers.ProjectID=projectID AND ProjectGroupMembers.PersonID=personID;

END//
DELIMITER ;

-- Dumping structure for procedure aristotle.UpdateUserToProject
DELIMITER //
CREATE DEFINER=`lmw25`@`10.17.211.%` PROCEDURE `UpdateUserToProject`(
	IN `iProjectID` VARCHAR(20),
	IN `iPersonID` INT,
	IN `iStatusID` INT


)
BEGIN
UPDATE ProjectGroupMembers
SET EntityStatusID = iStatusID
WHERE ProjectID = iProjectID AND PersonID = iPersonID;

UPDATE UserOrProjectStatusPerSite
SET EntityStatusID = iStatusID
WHERE ProjectID = iProjectID AND PersonID = iPersonID;

END//
DELIMITER ;

-- Dumping structure for function aristotle.GetNextProjectID
DELIMITER //
CREATE DEFINER=`lmw25`@`10.17.211.%` FUNCTION `GetNextProjectID`(
	`projectPrefix` VARCHAR(10)

) RETURNS varchar(20) CHARSET latin1
BEGIN
    DECLARE NprojectID VARCHAR(20);
    DECLARE projectnum INT;
    DECLARE IntPart VARCHAR(4);
    
    SET projectnum = (SELECT MAX(RIGHT(ProjectID, 4)) + 1 AS Num
		FROM Project
		WHERE ProjectID LIKE CONCAT(projectPrefix, '%'));
	
    SET IntPart = LPAD(projectnum, 4, 0);
 
    SET IntPart = (SELECT IF(IntPart IS NULL OR @IntPart = '', '0001', IntPart));

    SET NprojectID = (SELECT CONCAT (projectPrefix, IntPart) AS ProjectID);

RETURN NprojectID;

END//
DELIMITER ;

-- Dumping structure for function aristotle.HeidiSQL_temproutine_1
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.72` FUNCTION `HeidiSQL_temproutine_1`() RETURNS tinyint(4)
BEGIN
UPDATE
    Person P,
    ProjectGroupMembers PGM
SET
    P.EntityStatusID = 1, PGM.EntityStatusID = 1
WHERE
    P.PersonID = PGM.PersonID AND PGM.EntityStatusID = 4;
RETURN 1;
END//
DELIMITER ;

-- Dumping structure for function aristotle.UpdateApprovedStatus
DELIMITER //
CREATE DEFINER=`lmw25`@`128.84.31.72` FUNCTION `UpdateApprovedStatus`() RETURNS tinyint(4)
BEGIN
UPDATE
    Person P,
    ProjectGroupMembers PGM
SET
    P.EntityStatusID = 1, PGM.EntityStatusID = 1
WHERE
    P.PersonID = PGM.PersonID AND PGM.EntityStatusID = 4;
RETURN 1;
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
