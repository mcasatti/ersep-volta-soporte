# Modificación de datos de curso

La modificación de datos de curso se debe realizar con mucho cuidado.

Volta admite la modificación de diversos datos de curso, en los cuales se realizan controles.

En casos excepcionales se pude solicitar la modificación de datos que el sistema no admite, por lo cual hay que recurrir a la modificación directa en la base de datos.

Esta modificación se realiza por medio del siguiente query:

``` sql
UPDATE T_CURSOS
SET
    campo = valor,
    campo = valor,
    etc.
WHERE
    ID_CURSO = :id_curso
```

siendo `campo` el nombre del campo que se desea modificar y `valor` el nuevo valor que debe asumir.

El `:id_curso` es fundamental ya que identifica el curso que se desea modificar. Dicho valor puede consultarse en la pantalla de gestión de cursos.

Los campos que pueden ser candidatos a modificación por base de datos son los siguientes:

| NOMBRE | DESCRIPCION |
|--------|-------------|
| FEC_INICIO | Fecha de inicio del curso |
| CAPACIDAD_TOTAL | Plazas totales asignadas al curso
| FEC_FIN | Fecha de finalización del curso
| ID_LOCACION | Identificador de la locación donde el curso se lleva a cabo. Sale de la tabla `T_LOCACIONES`.

> EJEMPLO: Si se quisiera modificar la `capacidad total` del curso `3187` la secuencia a ejecutar sería:
>
> `UPDATE T_CURSOS SET CAPACIDAD_TOTAL = nn WHERE ID_CURSO = 3187`
>

