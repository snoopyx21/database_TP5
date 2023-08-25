DIVRIOTIS Constantin 
CMI Reseaux

Question 1 :
SELECT nc,vdep
FROM L2I_Circuit
WHERE vdep LIKE '% %' AND length(vdep)>5;

Question 2:
//version 1
SELECT NC 
FROM L2I_Reser
WHERE to_char(datedep,'mm/dd' ) >= '01/01' AND to_char(datedep,'mm/dd' ) <= '15/01';

//version 2
SELECT NC
FROM L2I_Reser
WHERE extract(month from datedep) = 01 and extract(day from datedep) between 01 and 15;

Question 3 :
SELECT * 
FROM L2I_Circuit 
WHERE nc NOT IN 
	(SELECT DISTINCT nc 
	 FROM L2I_Reser);

Question 4 : 
SELECT DISTINCT cir.nc, cir.nbj as "NOMBRES DE JOURS DE L'ETAPE"
FROM L2I_Ciretape cir, L2I_Circuit c
WHERE cir.nc in 
	(SELECT nc 
	 FROM L2I_Ciretape
	 GROUP BY nc HAVING count(*)>1)
AND cir.nc=c.nc; 

Question 5 :
SELECT prix
FROM L2I_Circuit
WHERE nc IN 
	(SELECT NC 
	 FROM L2I_reser
 	 GROUP BY NC HAVING count(*)>=3);

Question 6:
SELECT nc as "CIRCUIT LES PLUS RENTABLES",count(*)
FROM L2I_reser 
GROUP BY NC HAVING count(*) =
 	(SELECT max(count(*))
	 FROM L2I_Reser
	 GROUP BY nc);

Question 7 :
create table avis ( num_m varchar(30), nom_client varchar(20), note int, visite date,primary key (num_m,nom_client));

Question 8 :
alter table avis add constraint c_note_check (note between 1 and 5);

Question 9 :
insert into avis values (num_m='MaM de Strasbourg',nom_client='Martin',note=3,date=08/12/2016);

