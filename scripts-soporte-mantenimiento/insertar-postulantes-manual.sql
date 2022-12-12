
DECLARE
    vcuils   sys.odcivarchar2list := sys.odcivarchar2list(
   '20276719328',
'20436077417',
'20382733534',
'20460367906',
'20397338836',
'20338428554',
'20388817845',
'20279111215'
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