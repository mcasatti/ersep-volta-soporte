select p.id_tipo_documento as tipo, p.nro_documento as dni, p.apellido, p.nombre, d.nro_registro, 'III' as categoria, d.id_postulante as cuil 
from ersep_segelec.t_informes_tecnicos i
join ersep_Segelec.t_det_informes_tecnicos d on i.id_informe_tecnico = d.id_informe_tecnico
join ersep_Segelec.vt_postulantes_cidi p on d.id_postulante = p.id_postulante
where i.nro_informe_tecnico = :nro_informe_tecnico
order by substr(d.nro_registro,instr(d.nro_registro,'-'))