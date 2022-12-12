select cuil,apellido,nombre,id_nota,teorico,practico,id_estado_academico,n_estado_academico 
from ersep_segelec.vt_notas where id_curso = 3757 order by apellido, nombre

select id_inscripcion,cuil,nombre 
from ersep_Segelec.vt_inscripciones where id_curso = 3757 order by nombre

select * from ersep_segelec.t_inscripciones where id_postulante = '20337280545' and id_curso = 3759

delete from ersep_segelec.t_notas where id_nota = 75697
update ersep_segelec.t_notas set teorico = 6, practico=null, id_estado_academico = 'T' where id_nota = 75624

insert into ersep_segelec.t_notas (id_inscripcion,teorico,practico,id_estado_academico)
values (77352,null,null,'U')