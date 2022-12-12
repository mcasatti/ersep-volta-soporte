SELECT
    cuil,
    ( apellido
      || ', '
      || nombre ) AS nombre,
    id_curso,
    n_tipo_curso,
    n_curso,
    teorico,
    practico,
    fec_cierre
FROM
    ersep_segelec.vt_notas               n
    LEFT JOIN ersep_segelec.t_solicitudes_registro s ON n.cuil = s.id_postulante
WHERE
    id_tipo_curso IN ( 'E', 'L', 'R' ) -- Examen de curso, examen libre, recuperatorio
    AND id_estado_academico = 'A'
    AND s.id_postulante IS NULL
    AND id_programa = 'SE'
ORDER BY
    nombre ASC