# Empadronamiento manual

## Software necesario

Los scripts mencionados en este instructivo han sido desarrollados, ejecutados y probados en la herramienta SQL DEVELOPER, la cual se puede descargar desde el [siguiente link](https://www.oracle.com/database/sqldeveloper/technologies/download/).

## Preparación de los datos de entrada

El proceso utiliza como datos de entrada un conjunto de numeros de CUIT separados por coma y entre comillas simples.

### Ejemplo de datos:

```
'20276719328',
'20436077417',
'20382733534',
'20460367906',
'20397338836',
'20338428554',
'20388817845',
'20279111215'
```

Estos números de CUIT representan a las personas que se incorporarán a la base de datos como __postulantes__.

### Script de incorporación al registro

``` sql

DECLARE
    vcuils   sys.odcivarchar2list := sys.odcivarchar2list(
'XXXXXXXXXXX',
'XXXXXXXXXXX',
'XXXXXXXXXXX',
'XXXXXXXXXXX'
);
BEGIN
    FOR i IN 1..vcuils.last LOOP
        /*
        Insertar el CUIL en T_PERSONAS
        */
        BEGIN
            INSERT INTO ersep_segelec.t_personas ( id_persona ) VALUES ( vcuils(i) );
            DBMS_OUTPUT.PUT_LINE ('INSERTADO '||vcuils(i)||' EN T_PERSONAS');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE ('ERROR AL INSERTAR '||vcuils(i)||' EN T_PERSONAS:'||SQLERRM);
        END;
        /*
        Insertar el CUIL en T_POSTULANTES
        */
        BEGIN
            INSERT INTO ersep_segelec.t_postulantes (
                id_postulante,
                id_persona,
                empadronado,
                opcion_para_validar,
                observacion
            ) VALUES (
                vcuils(i),
                vcuils(i),
                SYSDATE,
                'C',
                'ALTA MANUAL: '
                || SYSDATE
            );
            DBMS_OUTPUT.PUT_LINE ('INSERTADO '||vcuils(i)||' EN T_POSTULANTES');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE ('ERROR INSERTANDO '||vcuils(i)||' EN T_POSTULANTES:'||SQLERRM);
        END;
    END LOOP;
END;
```

* El archivo con el script mencionado se puede descargar desde el [siquiente link](./scripts-soporte-mantenimiento/insertar-postulantes-manual.sql).

> NOTA: Es importante resaltar que una vez ejecutado el script es necesario realizar una operación COMMIT si los datos han sido insertados correctamente y un ROLLBACK si se desea deshacer la operación.

> NOTA: En algunos casos puede que algunas inserciones fallen porque los datos ya se encontraban en la base de datos y se reportaron faltantes erroneamente. Dichos errores deben ignorarse ya que el script no genera información duplicada sino que saltea los registros duplicados y sigue con los demás.


