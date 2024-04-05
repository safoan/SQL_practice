
-- Etudiant..
INSERT INTO Etudiant VALUES 
('l0372','SALIM','Ali',23)
, ('l0487','SMAHI','Rida',25)
,('l0374','ABADA','Amine',27)
,('l0375','MAHMOUDI','Leila',22) 
, ('l0376','KASI','Mohamed',23) 
, ('l0377','SAADA','Nour',22);

-- Enseigant..
INSERT INTO Enseignant VALUES 
(1,'DAOUDI','Ahmed'), 
(2,'KADOURI','Adel'),
(3,'BENABADJI','Yacine'),
(4,'BERBAR','Ahmed'),
(5,'ZAMIH','Mourad'),
(6,'SLIMANI','Mariem'),
(7,'RABAH','Lamia'),
(8,'SMATI','Amina'),
(9,'BENTOUFIK','Zaia'),
(10,'ABOUD','Zohra');

-- Cours..
INSERT INTO Cours VALUES 
('MOS010','Modélisation et simulation',1,2),
('LOG005','Logique',2,2),
('STA105','Statistique',10,2),
('PRO100','Probabilités',9,2),
('ALG541','Algèbre linéaire',8,2),
('GLO250','Génie Logiciel',4,1),
('BDD552','Base de données',6,0),
('RES001','Réseaux',3,0);

-- Seance..
INSERT INTO Seance VALUES 
('MOS010',1,'CM','2012-03-02','125T','14:30','16:00',1),
('MOS010',2,'TD','2012-03-04','104D','08:00','09:30',7),   
('LOG005',1,'CM','2012-03-02','125T','08:00','09:30',2), 
('LOG005',2,'TD','2012-03-02','109','13:00','14:30',5), 
('GLO250',1,'CM','2012-03-05','TMH','10:00','11:30',4); 

-- Inscription..
INSERT INTO Inscription VALUES
('l0372','MOS010'),
('l0487','MOS010'),  
('l0377','MOS010'),  
('l0376','MOS010'),
('l0372','LOG005'),
('l0487','LOG005'),  
('l0377','LOG005'),  
('l0376','LOG005'), 
('l0372','GLO250'),
('l0487','GLO250');