INSERT INTO goal
VALUES (1, 'Gain Muscle');
INSERT INTO goal
VALUES (2, 'Strength');
INSERT INTO goal
VALUES (3, 'Loose Weight');



INSERT INTO exercise
VALUES	(1 ,'benchpress',40),
		(2,'pullups',80),
		(3,'deadlift',90),
		(4,'romaniandeadlift',50),
        (5,'shrugs',15),
        (6,'tbarrow',15),
        (7,'bentoverrow',25),
        (8,'inclinedumbell',50),
        (9,'flyes',50),
        (10,'shoulderpress',30),
        (11,'onearmdumbell',30),
        (12,'latteralraise',30),
        (13,'bicepcurls',30),
        (14,'hammercurls',30),
        (15,'preachercurls',30),
        (16,'skullcrushers',30),
        (17,'squats',30),
        (18,'legextensions',30),
        (19,'legraises',30),
        (20,'legcurls',30),
        (21,'legpress',30),
        (22,'lunges',30),
        (23,'calfraises',30);


INSERT INTO client
VALUES 	('GDanos','1111','Giwrgos','Ntanos','gdanos@mail.com','6981011012',65.5,1.70,'Ntaksei kalo gumnasthriaki',1),
		('MDanos','1111','Marios','Ntanos','mdanos@mail.com','6981011013',120,1.84,'Oloi me koitazoun ekei mesa',2),
		('MPouti','1111','Magia','Pouti','Mpouti@mail.com','6981011014',56,1.72,'Wraio paidi o Marios h Giwrgos',2);
	
INSERT INTO measure
VALUES 	("2017-04-01 08:00:00",60,19,'GDanos'),
		("2017-04-01 08:00:00",120,3,'MDanos'),
		("2017-04-01 08:00:00",50,28,'MPouti');
    
INSERT INTO visit
VALUES 	("2017-04-01 08:00:00",'GDanos'),
		("2017-04-01 08:50:00",'Mpouti'),
		("2017-04-01 09:32:00",'MDanos');
		    

INSERT INTO product
VALUES	(1,'TREN',34.99,'Klen'),
		(2,'WHEY PROTEIN',69.99,'Aplh prwteinoula 2kg'),
        (3,'Klebuterol',50,'Ti ennoeis den exeis asthma?');

INSERT INTO purchase
VALUES	(1,"2017-04-01 08:00:00",'MDanos'),
		(2,"2017-04-01 08:00:00",'MDanos');
        
INSERT INTO purchase_product
VALUES	(1,1,2),
		(2,2,5);
INSERT INTO rate
VALUES	('MDanos',1,5,'Elpizw na mhn faei ta nefra mou'),
		('MDanos',2,5,'Polu kalh prwteinh.Paramenw fusikos');

INSERT INTO employee
VALUES 	('Xrhstos12','1111','xrhstos12@mail.com','Xrhstos','Xristidhs','6981011022',"00:00:00","08:00:00"),
		('Nikh24','1111','nikh23@mail.com','Nikh','Gianna','6981012022',"08:00:01","016:00:00");
		
INSERT INTO plan
VALUES	(1,'30-DAY STRENGTH','Xrhstos12',2),
		(2,'14-week Hypethrophy','Xrhstos12',1),
		(3,'Abs for summer','Nikh24',3),
        (4,'Loose the buns','Nikh24',3);


       
INSERT INTO part
VALUES	(1,'push day',1,2),
		(2,'pull day',1,2),
        (3,'leg day(you can skip it)',1,2),
        
		(4,'chest day',2,1),
        (5,'back day',2,1),
        (6,'shoulders day',2,1),
        (7,'lower body arm day',2,1),
        (8,'arm day',2,1),
        
        (9,'Everyday abs',3,1),
        
        (10,'abs day',4,1),
        (11,'Full body exhaustion',4,1),
        (12,'Cardio',4,1);
        
 
   
INSERT INTO exercise_part
VALUES	(1,1,3,5,5,62.5,1),
		(9,1,3,5,5,62.5,1),
        (8,1,3,5,5,62.5,1),
        (10,1,3,5,5,62.5,1),
        (6,1,3,5,5,62.5,1),
        
        (4,2,3,5,5,62.5,1),
		(11,2,3,5,5,62.5,1),
        (12,2,3,5,5,62.5,1),
        (5,2,3,5,5,62.5,1),
        
		(2,3,3,5,5,62.5,1),
		(13,3,3,5,5,62.5,1),
        (3,3,3,10,5,62.5,1);
        
