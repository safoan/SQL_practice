-- 1. Cherchez le nom et le prénom de tous les étudiants de moins de 23 ans.
select nom,prenom from Etudiant where age < 23 ;

-- 2. Cherchez le nom et le prénom de l’enseignant responsable du cours de Statistique.
select nom,prenom from Enseignant as e inner join cours as c on e.id = c.responsable 
where c.intitule = 'Statistique';

-- 3. Cherchez le nom et le prénom de tous les étudiants inscrits au cours de Logique.
select nom, prenom from dbo.Etudiant as e inner join Inscription as i on e.numero = i.Etudiant 
inner join cours as c on i.cours = c.sigle where c.intitule = 'Logique';

-- 4. Déterminez le nombre d’enseignants intervenant dans le cours de Modélisation et simulation.
select COUNT(distinct enseignant) from dbo.Seance as s 
inner join cours as c on s.cours=c.sigle 
where c.intitule= 'Modélisation et simulation';

--5. Où et quand a lieu le premier cours de Génie Logiciel?
select date,salle from dbo.Seance as s 
inner join cours as c on s.cours= c.sigle 
where c.intitule= 'Génie Logiciel' and s.numero=1;

--6. Affichez un « emploi du temps » du cours de Logique.
select date,type,heureDebut,heurefin from dbo.Seance as s 
inner join cours as c on s.cours= c.sigle 
where c.intitule='Logique';

--7. Pour chaque enseignant, indiquez le nombre de cours dans lesquels il intervient (restreignez
--   les réponses à l’ensemble des enseignants qui interviennent dans au moins deux cours).
select COUNT (cours) as 'nbr cours',nom,prenom,id 
from Seance inner join Enseignant on Seance.enseignant=enseignant.id
group by id,nom,prenom
having COUNT('cours')>1;


--8. Ajoutez un cours magistral de Logique le 01 Mars 2012 avec BENABADJI Yacine en salle TME
--   de 13h à 14h30
INSERT INTO Seance VALUES 
((select sigle from cours where intitule='logique'),0,'CM','2012-03-01','TME','13:00','16:30',(select id from Enseignant where nom='benabadji'and prenom='yacine') );

-- 9. Listez les étudiants inscrits à aucun cours.
select * from dbo.Etudiant except select numero,nom,prenom,age from dbo.Etudiant inner join
dbo.Inscription on Inscription.Etudiant = Etudiant.numero;

select nom,prenom from Etudiant
where numero not in (select Etudiant from Inscription);

-- 10. Combien d’étudiants (différents) ont assistés à au moins une séance animée par DAOUDI Ahmed ?

select COUNT (distinct Etudiant)
from Inscription where cours=(select sigle from cours,Enseignant,Seance
where    
enseignant=id
and sigle = cours
and nom ='DAOUDI' 
and prenom='Ahmed');