-- Aplicatia 10
-- 1.Listati ce note a pus un anumit professor la un anumit curs
SELECT * FROM `cursuri` c left join note n on  c.id_curs = n.id_curs inner join didactic d on d.id_curs = n.id_curs and d.id_prof =1
where c.id_curs = 21;

-- 2.Cate cursuri sunt fara profesor?
SELECT * FROM `cursuri` WHERE id_curs not in (select id_curs from didactic);

-- 3.Cati studenti nu s-au inscris la niciun curs?
SELECT * FROM `student` where id not in (select id_student from note);

-- 4.Cati studentiau minim 2 note/ sunt inscrisi la minim 2 cursuri
SELECT id_student, count(id_student) as nr FROM `note` group by id_student having nr >=2 ;


-- 5.Cati strudenti si profesori isi serbeaza ziua de Sf. ION?
(SELECT nume, prenume FROM `student` where prenume like 'ion%') UNION (select nume,prenume from profesor where prenume like 'ion%');
-- 6.Pentru un anumit student doresc sa vad ce note are la cursurile sale
select s.nume,s.prenume, n.valoare, c.titlu_curs from student s left join note n on s.id = n.id_student inner join cursuri c on n.id_curs= c.id_curs where s.id=101 ;
-- 7.Calculati media notelor primite pentru un anumit student
select s.nume,s.prenume, avg(n.valoare) from student s left join note n on s.id = n.id_student where s.id=101; 
-- 8. media fiecarui student 
select s.nume,s.prenume, avg(n.valoare) from student s left join note n on s.id = n.id_student group by s.id ;
-- 9. media studentilor pe ani
select s.an, avg(n.valoare) from student s left join note n on s.id = n.id_student group by s.an