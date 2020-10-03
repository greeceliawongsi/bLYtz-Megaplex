--SIMULATE TRANSACTION

--Buying Movie Ticket

--Customer A wants to buy a ticket for MV012 which scheduled to play in studio ST012 with schedule id MS012
--After the customer payed, firstly we will need to insert into HeaderMovie table
insert into HeaderMovie values ('MTr020','SF001',GETDATE())
--MTr020 as the transaction id and SF001 as the staffid which handled the transaction

--Then after this we can insert the transaction detail into MovieTransactionDetail Table
insert into MovieTransactionDetail values ('MTr020','MS012','20')
--MTr020 as the transaction id, MS012 as the ScheduleID, and 20 as the seat





--Buying Refreshment


--Customer B wants to buy a coffee
--After tyhe customer payed, firstly we will need to insert into HeaderRefreshment table
insert into HeaderRefreshment values
('RTr020','SF001',GETDATE())
--RTr020 as the transaction id and SF001 as the staffid which handled the transaction

--Then after this we can insert the transaction detail into MovieTransactionDetail Table
insert into RefreshmentTransactionDetail values ('RTr020','RE001','1')
--RTr020 as the transaction id, RE001 as the Refreshment ID, and 1 as the quantity

--Next, we will need to update the stock of the refreshment type that sold out
--Coffee is a beverage with RT001 as the RefreshmentTypeID and RE001 as the RefreshmentID
UPDATE MsRE
SET Stock = Stock + Quantity
FROM MsRE a JOIN RefreshmentTransactionDetail b 
ON a.REID = b.REID
WHERE RefreshmentTr_ID LIKE 'RTr020'


