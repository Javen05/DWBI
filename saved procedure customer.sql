DELIMITER $$
USE `data_warehouse`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCustomer`(
 IN new_Name varchar(45),
 IN new_Age int(8),
 IN new_Gender varchar(7),
 IN new_BikePurchases int,
 IN new_DateOfBirth date,
 IN new_JobTitle varchar(45),
 IN new_jobIndustry VARCHAR(45),
 IN new_WealthSegment VARCHAR(45),
 IN new_ownsCar VARCHAR(3),
 IN new_tenure tinyint(2),
 IN new_customerId int(8)
)
BEGIN
  -- Set existing current record to not current
  UPDATE `dim_customer`
  SET
    `isCurrent` = 0
  WHERE `customerId` = new_customerId AND `isCurrent` = 1;

  -- Insert a new historical record with updated data and isCurrent = 1
  INSERT INTO `dim_customer`
  (`name`, `age`, `gender`, `past_3_years_bike_related_purchases`, `dateOfBirth`, `jobTitle`,`jobIndustry`,`wealthSegment`,`ownsCar`,`tenure`,`customerId`,`effectiveDate`,`isCurrent`)
  SELECT new_Name, new_Age, new_Gender, new_BikePurchases, new_DateOfBirth, new_JobTitle,new_jobIndustry,new_WealthSegment,new_ownsCar,new_tenure,new_customerId,CURRENT_TIMESTAMP, 1;

END$$
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;