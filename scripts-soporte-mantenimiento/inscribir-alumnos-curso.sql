
DECLARE
    vcuils   sys.odcivarchar2list := sys.odcivarchar2list(
  'XXXXXXXXXX',
'XXXXXXXXXX',
'XXXXXXXXXX',
'XXXXXXXXXX'
);
vcurso number := 3735; 
vcontador number := 0;
vtotal number := 0;
BEGIN
    FOR i IN 1..vcuils.last LOOP
        vtotal := vtotal + 1;
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
            INSERT INTO ersep_segelec.t_postulantes ( id_postulante, id_persona ) VALUES ( vcuils(i), vcuils(i) );
            DBMS_OUTPUT.PUT_LINE ('INSERTADO '||vcuils(i)||' EN T_POSTULANTES');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE ('ERROR AL INSERTAR '||vcuils(i)||' EN T_POSTULANTES:'||SQLERRM);
        END;

        /*
        Insertar el CUIL en T_INSCRIPCIONES
        */
        BEGIN
            INSERT INTO ersep_segelec.t_inscripciones ( id_postulante,id_curso,reserva,definitiva ) VALUES ( vcuils(i),vcurso,0,1 );
            vcontador := vcontador + 1;
            DBMS_OUTPUT.PUT_LINE ('INSERTADO '||vcuils(i)||' EN T_INSCRIPCIONES');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE ('ERROR AL INSERTAR '||vcuils(i)||' EN T_INSCRIPCIONES:'||SQLERRM);
        END;
    
    END LOOP;
    DBMS_OUTPUT.PUT_LINE ('*** INSCRIPTOS '||vcontador||' DE '||vtotal||' ***');
END;