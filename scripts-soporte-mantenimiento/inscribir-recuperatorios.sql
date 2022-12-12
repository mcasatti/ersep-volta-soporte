--select * from ersep_segelec.vt_postulantes_cidi where id_postulante = '20262896871'
--insert into ersep_segelec.t_personas (id_persona) values ('20336004617')

-- CURSO 3161
/*
'20262896871',
'20180158813',
'20125123830',
'20319975439',
'20270461019',
'20165010397',
'23266861419',
'20131540745',
'20323916862',
'20366581791',
'20243214174',
'20380000661',
'20319785540'
*/
select count(*) 
from ersep_segelec.t_inscripciones 
where id_postulante in (
'20262896871',
'20180158813',
'20125123830',
'20319975439',
'20270461019',
'20165010397',
'23266861419',
'20131540745',
'20323916862',
'20366581791',
'20243214174',
'20380000661',
'20319785540')
and id_curso = 3161

insert all 
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20262896871',3161,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20180158813',3161,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20125123830',3161,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20319975439',3161,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20270461019',3161,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20165010397',3161,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('23266861419',3161,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20131540745',3161,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20323916862',3161,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20366581791',3161,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20243214174',3161,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20380000661',3161,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20319785540',3161,0,1)
select * from dual;

-- CURSO 3137
/*
'20277031192',
'23216288629',
'20424406016',
'20378229600',
'20146024212',
'20336004617'
*/
insert all 
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20277031192',3137,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('23216288629',3137,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20424406016',3137,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20378229600',3137,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20146024212',3137,0,1)
into ersep_segelec.t_inscripciones (id_postulante,id_curso,reserva,definitiva) values ('20336004617',3137,0,1)
select * from dual;
