DELIMITER $$
USE `data_warehouse`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateProduct`(
  IN new_StockCode varchar(45),
  IN new_Description VARCHAR(100),
  IN new_UnitPrice DECIMAL(10,2),
  IN new_Supplier INT -- Add a parameter for the new supplier
)
BEGIN
  -- Set existing current record to not current
  UPDATE `dim_product`
  SET
    `isCurrent` = 0
  WHERE `stockCode` = new_StockCode AND `isCurrent` = 1;

  -- Insert a new historical record with updated data and isCurrent = 1
  INSERT INTO `dim_product`
  (`stockCode`, `description`, `supplier`, `unitPrice`, `effectiveDate`, `isCurrent`)
  SELECT new_StockCode, new_Description, new_Supplier, new_UnitPrice, CURRENT_TIMESTAMP, 1;

  -- Update the supplier of the current record
  UPDATE `dim_product`
  SET
    `supplier` = new_Supplier
  WHERE `stockCode` = new_StockCode AND `isCurrent` = 1;

END$$
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;
