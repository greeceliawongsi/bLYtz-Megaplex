insert into MsStaff values
('SF001' ,'Spbob Squarepats','Spongrbob@bob.com','2000/01/11','Female','081111111111','BIKINIT BOTTOSM'),('SF002' ,'Patick Star','Patrirck@bob.com','1000/01/11','Male','081111111111','BIKINIT BOTTOSM'),
('SF003' ,'Sqdward Tentacles','Squirdward@bob.com','1300/01/11','Male','081111111111','BIKINIT BOTTOSM'),('SF004' ,'Eugene KraTs','EugerneK@bob.com','1111/01/11','Male','081111111111','BIKINIT BOTTOSM'),
('SF005' ,'Sand Cheeks','Sandry@bob.com','1300/01/11','Female','081111111111','BIKINIT BOTTOSM'),('SF006' ,'Shldon Plankton','Planrkton@bob.com','1111/01/11','Male','081111111111','BIKINIT BOTTOSM'),
('SF007' ,'Larrrry Lobster','Larrry@bob.com','1300/01/11','Male','081111111111','BIKINIT BOTTOSM'),('SF008' ,'Jengggk ns','jenkgins@bob.com','1111/01/11','Male','081111111111','BIKINIT BOTTOSM'),
('SF009' ,'Patassr','Patarr@bob.com','1300/01/11','Female','081111111111','BIKINIT BOTTOSM'),('SF010' ,'SpongeGr gr','SpongeG@bob.com','1111/01/11','Male','081111111111','BIKINIT BOTTOSM'),
('SF011' ,'Patasr S','Patrar@bob.com','1300/01/11','Female','081111111111','BIKINI BOTTOSM'),('SF012' ,'SponGar grt','SpongeG@bob.com','1111/01/11','Male','081111111111','BIKINIT BOTTOSM'),
('SF013' ,'Mermd Man','MMr@@bob.com','1300/01/11','Male','081111111111','BIKINIT BOTTOSM'),('SF014' ,'Barnacle ABC Boy','BB@bob.com','1111/01/11','Male','081111111111','BIKINIT BOTTOSM'),
('SF015' ,'ManSSARay','MRAYr@bob.com','1300/01/11','Female','081111111111','BIKINIT BOTTOSM')

insert into MsMovie values
('MV001','Spongebob Squarepants','00001','30'),('MV002','Anjing ku','00011','240'),('MV003','My World','10001','200'),
('MV004','Siput Kebun','20001','30'),('MV005','UGH','00111','240'),('MV006','ABCD GFEJ','10001','210'),
('MV007','Siput Kebun','20001','30'),('MV008','Bikini Bottom','00111','240'),('MV009','SSSS','10001','100'),
('MV010','My Movie','20001','130'),('MV011','UGFFFFH','00111','240'),('MV012','SSMS','10001','100'),
('MV013','8 Bit MLegend','20001','30'),('MV014','FFFFFF','00111','240'),('MV015','NONose','10001','100')

insert into MsStudio values
('ST001','Bekicot','37000'),('ST002','Binatang Production','59000'),('ST003','Satin Just4 Case','60000'),('ST004','Satin TES','63000'),
('ST005','ABC 5 DASAR','47000'),('ST006','BALOK KU ADA 5','59000'),('ST007','Mushroom','60000'),('ST008','Star','53000'),
('ST009','Atom','59000'),('ST010','Binatang','59000'),('ST011','ABCDEFGH','60000'),('ST012','Nasi','60000'),
('ST015','Anjing','60000'),('ST014','BEKICOD','40000'),('ST013','Merah Muda','50000')

insert into HeaderSchedule values
('MS001','ST002','MV001','2020/11/11','20:00'),('MS002','ST001','MV003','2020/11/08','19:00'),('MS003','ST003','MV003','2020/11/08','19:00'),
('MS004','ST003','MV003','2020/11/08','19:00'),('MS005','ST004','MV001','2020/11/08','19:00'),('MS006','ST004','MV006','2020/11/08','19:00'),
('MS007','ST007','MV007','2020/11/11','20:00'),('MS008','ST008','MV008','2020/11/08','19:00'),('MS009','ST009','MV009','2020/11/08','19:00'),
('MS010','ST011','MV010','2020/11/08','19:00'),('MS011','ST010','MV010','2020/11/08','19:00'),('MS012','ST012','MV012','2020/11/08','19:00'),
('MS015','ST013','MV015','2020/11/08','19:00'),('MS013','ST015','MV013','2020/11/08','19:00'),('MS014','ST014','MV015','2020/11/08','19:00')

insert into MsRefreshmentType values
('RT001','Coffee','Beverage'),('RT002','Soda','Beverage'),('RT003','Juice','Beverage'),('RT004','Tea','Beverage'),('RT005','Other Beverages','Beverage'),
('RT006','Western Food','Food'),('RT007','Heavy Snacks','Food'),('RT008','Traditional Food','Food'),('RT009','Eastern Food','Food'),('RT010','Light Snacks','Food'),
('RT011','Fried Mushroom','Food'),('RT012','Mango','Food'),('RT013','Dumpling','Food'),('RT014','Pizza','Food'),('RT015','Light Fruit','Food')

insert into MsRE values 
('RE001','RT001','30000','150'),('RE002','RT002','20000','100'),('RE003','RT003','10000','300'),
('RE004','RT004','15000','300'),('RE005','RT005','10000','300'),('RE006','RT006','20000','300'),
('RE007','RT007','20000','300'),('RE008','RT008','25000','300'),('RE009','RT009','25000','300'),
('RE010','RT010','25000','300'),('RE011','RT011','25000','300'),('RE012','RT012','25000','300'),
('RE013','RT013','25000','300'),('RE014','RT014','25000','300'),('RE015','RT015','25000','300')

insert into HeaderMovie values
('MTr001','SF001',GETDATE()),('MTr002','SF001',GETDATE()),('MTr003','SF001','2020/02/01'),
('MTr004','SF002','2020/02/01'),('MTr005','SF001',GETDATE()),('MTr006','SF004','2020/02/02'),
('MTr007','SF013','2020/02/01'),('MTr008','SF012','2020/02/01'),('MTr009','SF011',GETDATE()),
('MTr012','SF015','2020/02/01'),('MTr011','SF014',GETDATE()),('MTr010','SF013','2020/02/02'),
('MTr013','SF007','2020/02/01'),('MTr014','SF009',GETDATE()),('MTr015','SF008','2020/02/02')

insert into HeaderRefreshment values
('RTr001','SF001',GETDATE()),('RTr002','SF002',GETDATE()),('RTr003','SF004','2019/11/17'),
('RTr004','SF001','2020/02/01'),('RTr005','SF004','2020/02/01'),('RTr006','SF004','2019/11/17'),
('RTr007','SF005',GETDATE()),('RTr008','SF006','2020/02/01'),('RTr009','SF007','2020/02/01'),
('RTr010','SF015',GETDATE()),('RTr011','SF010','2020/02/01'),('RTr012','SF009','2020/02/01'),
('RTr013','SF011',GETDATE()),('RTr014','SF007','2020/02/01'),('RTr015','SF008','2020/02/01')

insert into MovieTransactionDetail values
('MTr001','MS004','15'),('MTr001','MS002','11'),('MTr003','MS005','17'),('MTr002','MS003','15'),
('MTr004','MS003','11'),('MTr004','MS001','11'),('MTr005','MS003','10'),('MTr006','MS001','12'),
('MTr007','MS007','5'),('MTr007','MS001','20'),('MTr007','MS005','5'),('MTr008','MS008','15'),
('MTr009','MS009','5'),('MTr010','MS001','20'),('MTr011','MS011','5'),('MTr012','MS012','5'),
('MTr003','MS013','5'),('MTr004','MS014','10'),('MTr015','MS015','15'),('MTr006','MS006','15'),
('MTr007','MS002','20'),('MTr008','MS002','20'),('MTr009','MS001','5'),('MTr013','MS010','20'),
('MTr011','MS009','5'),('MTr012','MS002','20'),('MTr013','MS001','15'),('MTr015','MS008','15'),
('MTr015','MS005','5')

INSERT INTO RefreshmentTransactionDetail VALUES
('RTr001','RE001','20'),('RTr001','RE012','10'),('RTr002','RE006','20'),('RTr002','RE003','11'),
('RTr003','RE004','17'),('RTr003','RE005','15'),('RTr004','RE001','18'),('RTr004','RE006','10'),
('RTr005','RE007','10'),('RTr005','RE008','12'),('RTr001','RE002','20'),('RTr006','RE001','21'),
('RTr006','RE006','20'),('RTr007','RE007','10'),('RTr007','RE008','20'),('RTr008','RE008','11'),
('RTr010','RE010','17'),('RTr008','RE001','15'),('RTr009','RE009','18'),('RTr009','RE008','10'),
('RTr010','RE011','10'),('RTr011','RE011','12'),('RTr011','RE012','20'),('RTr012','RE011','21'),
('RTr015','RE011','21')