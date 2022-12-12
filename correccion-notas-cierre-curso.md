# Corrección de notas y eliminacion de duplicados

Los siguientes querys se utilizan para la corrección de notas, actualizacion de estados académicos y eliminación de duplicados

Cada caso debe revisarse de manera individual ya que no hay un procedimiento estandar de correccion de los datos.

``` sql
/* 
Dado un numero de curso consultar todos los datos, para identificar duplicados y notas 

EN ESTE CASO EL CURSO ES EL 3542
*/
select 
    i.id_inscripcion, i.id_postulante cuil, n.id_nota, n.teorico, n.practico, n.id_estado_academico
from 
    ersep_segelec.t_inscripciones i
left join 
    ersep_segelec.t_notas n on n.id_inscripcion = i.id_inscripcion where i.id_curso = 3542 
order by cuil, id_nota

/*
MODIFICAR LA NOTA Identificada como 73690, colocando un valor 6 en teorico, sin práctico (NULL) y con
estado académico REPROBADO (R)
*/
update ersep_segelec.t_notas set teorico = 6, practico = null, id_estado_academico = 'R' where id_nota = 73690

/*
BORRAR UNA NOTA DUPLICADA (identificada como 73466)
*/
delete from ersep_segelec.t_notas where id_nota in (73466)

/*
BORRAR UNA INSCRIPCION DUPLICADA
*/
delete from ersep_segelec.t_inscripciones where id_inscripcion in (75409)

/*
INSERTAR UNA NOTA FALTANTE
*/
insert into ersep_segelec.t_notas (id_inscripcion,carpeta,asistencia,teorico,practico,id_estado_academico)
values (73508,1,1,8.5,7.75,'A')

/*
INSERTAR TODOS LAS NOTAS DE ALUMNOS AUSENTES, DE UN CURSO DETERMINADO (3542)
*/
insert into ersep_segelec.t_notas (id_inscripcion,carpeta,asistencia,teorico,practico,id_estado_academico)
select id_inscripcion,1,1,null,null,'U' from ersep_segelec.t_inscripciones where id_curso = 3542

```

# Cierre manual de cursos

``` sql
/*
CERRAR DE FORMA MANUAL TODOS LOS CURSOS INDICADOS POR LOS IDENTIFICADORES ENTRE PARÉNTESIS
*/
update ersep_segelec.t_cursos set finalizado = 1, insc_habilitada = 0, enabled = 0
where id_curso in (3197,3542,3544)
```
