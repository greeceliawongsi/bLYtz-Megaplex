-- 1
select MovieID,[Total Revenue]= 'IDR '+ Cast(SUM(S_Price*Seat) AS VARCHAR)
From MsStudio st
JOIN HeaderSchedule s
ON st.StudioID=s.StudioID
JOIN MovieTransactionDetail mt
ON s.ScheduleID=mt.ScheduleID
JOIN HeaderMovie h
ON h.MovieTr_ID = mt.MovieTr_ID 
Where st.S_Price >50000 AND DATEDIFF(DAY,Movie_TransactionDate,YEAR(GETDATE())/MONTH(GETDATE())/19)<=0 
GROUP BY MovieID 

--2
select Name,[Total Sold Seats]= SUM(Seat)
FROM MsStaff s
JOIN HeaderMovie h
ON h.StaffID= s.StaffID
JOIN MovieTransactionDetail mt
ON h.MovieTr_ID = mt.MovieTr_ID
Where s.Gender ='Male' AND DATEDIFF(DAY,Movie_TransactionDate,YEAR(GETDATE())/MONTH(GETDATE())/27)<=0 
GROUP BY s.StaffID,Name
ORDER BY SUM(Seat)DESC

--3
Select [Average Quantity]=AVG(Quantity)*Price,[Transaction Days]=CAST(Count(Distinct Re_TransactionDate)AS VARCHAR)+' days',[Female Staff Count]=CAST(Count(Distinct h.StaffID)AS VARCHAR)+' People'
FROM MsStaff s
JOIN HeaderRefreshment h
ON s.StaffID = h.StaffID
JOIN RefreshmentTransactionDetail rt 
ON h.RefreshmentTr_ID = rt.RefreshmentTr_ID
JOIN MsRE re
ON re.REID=rt.REID
Where Gender = 'Female' AND DATEDIFF(DAY,Re_TransactionDate,YEAR('2022/02/10'))<0 
GROUP BY Price

--4
Select [Name]='Mr. '+ Name ,[Total Refreshment Sold]= COUNT(rt.REID),[Total Quantity Sold]= SUM(Quantity)
FROM MsStaff s
JOIN HeaderRefreshment h 
ON s.StaffID=h.StaffID
JOIN RefreshmentTransactionDetail rt 
ON rt.RefreshmentTr_ID= h.RefreshmentTr_ID
Where Gender='Male'
GROUP BY Gender,Name
UNION 
Select [Name]='Ms. '+ Name ,[Total Refreshment Sold]= COUNT(rt.REID),[Total Quantity Sold]= SUM(Quantity)
FROM MsStaff s
JOIN HeaderRefreshment h 
ON s.StaffID=h.StaffID
JOIN RefreshmentTransactionDetail rt 
ON rt.RefreshmentTr_ID= h.RefreshmentTr_ID
Where Gender='Female'
GROUP BY Gender,Name

--5
Select [Refreshment Transaction ID]=SUBSTRING(re.RefreshmentTr_ID,4,5),[Refreshment Transaction Date]=CONVERT(VARCHAR(12),Re_TransactionDate, 107)
FROM (SELECT h.RefreshmentTr_ID,Re_TransactionDate,REID
      FROM HeaderRefreshment h,RefreshmentTransactionDetail r 
      where Quantity >(
    Select AVG(Quantity)
    FROM RefreshmentTransactionDetail tr ,MsRE er
	WHERE tr.REID=er.REID
    ) AND h.RefreshmentTr_ID= r.RefreshmentTr_ID ) rt 
	,
    
    (SELECT r.RefreshmentTr_ID,re.REID
           FROM MsRE re , RefreshmentTransactionDetail r
           WHERE RTID  IN('RT006','RT007','RT008','RT009','RT010') AND re.REID= r.REID
) re
where  re.RefreshmentTr_ID=rt.RefreshmentTr_ID AND rt.REID=re.REID
GROUP BY re.RefreshmentTr_ID,rt.RefreshmentTr_ID,rt.Re_TransactionDate


 --6
Select [Transaction Date]=DATENAME(dw,Movie_TransactionDate)+', '+CONVERT(VARCHAR(12),Movie_TransactionDate, 106),
       [Total Movie Revenue]='IDR '+CAST(Seat*S_Price AS VARCHAR)
FROM (SELECT Movie_TransactionDate,Seat,ScheduleID FROM MovieTransactionDetail  MT , HeaderMovie h
      Where DATEDIFF(DAY,'2020/02/28',Movie_TransactionDate)>-30 AND Seat >(Select AVG(Seat) FROM MovieTransactionDetail)  
      AND mt.MovieTr_ID = h.MovieTr_ID)mt ,

( SELECT S_Price,ScheduleID FROM MsStudio s, HeaderSchedule h Where s.StudioID=h.StudioID
    ) g

Where mt.ScheduleID=g.ScheduleID


--7
Select[Staff Last Name]=REVERSE(SUBSTRING(REVERSE(Name), 1, CHARINDEX(' ', REVERSE(Name))-1)),
       [Refreshment Transaction ID]=RefreshmentTr_ID,[Refreshment Name]=Ref_Name,
       [Price]='IDR '+CAST(Price AS VARCHAR)
FROM (SELECT  REID , Name, h.RefreshmentTr_ID 
      FROM RefreshmentTransactionDetail m , MsStaff s ,HeaderRefreshment h
     WHERE s.StaffID=h.StaffID AND m.RefreshmentTr_ID=h.RefreshmentTr_ID
     ) a ,
     ( SELECT Price, r.REID, Ref_Name
      FROM MsRE r ,MsRefreshmentType rt 
      WHERE Price<(Select max(Price) FROM MsRE) AND Price>(Select min(Price) FROM MsRE) AND rt.RTID= r.RTID)b
      
WHERE a.REID=b.REID AND CHARINDEX(' ',Name)>0
UNION
Select[Staff Last Name]=Name,
       [Refreshment Transaction ID]=RefreshmentTr_ID,[Refreshment Name]=Ref_Name,
       [Price]='IDR '+CAST(Price AS VARCHAR)
FROM (SELECT  REID , Name, h.RefreshmentTr_ID 
      FROM RefreshmentTransactionDetail m , MsStaff s ,HeaderRefreshment h
     WHERE s.StaffID=h.StaffID AND m.RefreshmentTr_ID=h.RefreshmentTr_ID
     ) a ,
     ( SELECT Price, r.REID, Ref_Name
      FROM MsRE r ,MsRefreshmentType rt 
      WHERE Price<(Select max(Price) FROM MsRE) AND Price>(Select min(Price) FROM MsRE) AND rt.RTID= r.RTID)b
      
WHERE a.REID=b.REID AND CHARINDEX(' ',Name)<=0


--8
SELECT [Movie Transaction ID]=Substring(MovieTr_ID,2,2)+' '+SUBSTRING(MovieTr_ID,4,5),[Studio Name]=StudioName,
       [Studio Price]='IDR '+CAST(S_Price AS VARCHAR)
FROM(SELECT ScheduleID , MovieTr_ID 
    FROM MovieTransactionDetail
    Where Seat<=(Select MAX(Seat) From MovieTransactionDetail) AND Seat>=(Select AVG(Seat)FROM MovieTransactionDetail)) m,
    
    (SELECT S_Price , ScheduleID,StudioName FROM HeaderSchedule s, MsStudio st
     WHERE S_Price <=(Select MAX(S_Price)FROM MsStudio)
            AND S_Price >=(Select AVG(S_Price) FROM MsStudio)
        AND st.StudioID= s.StudioID
        ) n
Where  m.ScheduleID=n.ScheduleID


--9
GO
CREATE VIEW [Movie Schedule Viewer] AS

Select  [Studio ID]='Studio '+SUBSTRING(st.StudioID,3,4),[Studio Name]=StudioName,[Total Play]=Count(ScheduleID),[Movie Duration Total]=SUM(Duration)
FROM MsStudio st
JOIN HeaderSchedule s
ON st.StudioID=s.StudioID
JOIN MsMovie m
ON m.MovieID=s.MovieID
WHERE StudioName Like ('Satin %') AND Duration > 120
GROUP BY st.StudioID,st.StudioName
GO
Select * FROM [Movie Schedule Viewer]

--10
GO
CREATE VIEW [Refreshment Transaction Summary Viewer] AS

SELECT [Transaction Count]= CAST(Count(rt.RefreshmentTr_ID) AS VARCHAR)+ ' transactions',[Quantity Sold]= CAST(SUM(Quantity)AS VARCHAR) + ' products'

FROM RefreshmentTransactionDetail rt , HeaderRefreshment h
WHERE Quantity>5 AND DATENAME(dw,Re_TransactionDate) IN ('Saturday','Sunday') AND h.RefreshmentTr_ID=rt.RefreshmentTr_ID

GO
select * FROM [Refreshment Transaction Summary Viewer]
