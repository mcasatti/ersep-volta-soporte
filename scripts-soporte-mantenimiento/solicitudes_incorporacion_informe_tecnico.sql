SELECT
    sol.*,
    ( p.apellido
      || ', '
      || p.nombre ) AS nombre
FROM
         ersep_segelec.t_solicitudes_registro sol
    JOIN ersep_segelec.vt_postulantes_cidi     p ON sol.id_postulante = p.id_postulante
    LEFT JOIN ersep_segelec.t_det_informes_tecnicos det ON sol.id_postulante = det.id_postulante
WHERE
    det.id_postulante IS NULL
ORDER BY
    nombre ASC