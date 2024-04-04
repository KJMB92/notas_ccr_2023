--------------------------------------------------------------------------------------
-- Ver los productos de una cuenta
--------------------------------------------------------------------------------------
SELECT 
cd.transaccion,
cd.tarifario_id,
cd.cargo,
cd.precio,
cd.consecutivo,
cd.cargo_cups,
dbd.consecutivo,
dbd.codigo_producto,
dbd.total_costo,
ip.descripcion
FROM 
cuentas_detalle cd
JOIN bodegas_documentos_d dbd ON cd.consecutivo = dbd.consecutivo
JOIN inventarios_productos ip ON dbd.codigo_producto = ip.codigo_producto
WHERE
cd.numerodecuenta = 1974204
--------------------------------------------------------------------------------------
-- Reporte de carolina macias para ver la trazabilidad del servicio
--------------------------------------------------------------------------------------
--el ingreso 1997510 ya salio, con este voy a hacer pruebas
SELECT
TO_CHAR(ing.fecha_ingreso, 'DD/MM/YYYY HH24:MI:SS') fecha_ingreso,
pac.tipo_id_paciente,
pac.paciente_id,
pac.primer_nombre ||' '|| pac.segundo_nombre ||' '|| pac.primer_apellido ||' '|| pac.segundo_apellido AS nombre_completo_paciente,
ing.ingreso AS numero_ingreso,
TO_CHAR(hcom.fecha_registro, 'DD/MM/YYYY HH24:MI:SS') fecha_orden_salida_medico,
hcev.evolucion_id AS evolucion_salida_medico,
suev.nombre ||' - '|| suev.descripcion AS nombre_medico_salida,
TO_CHAR(hcvok.fecha_registro, 'DD/MM/YYYY HH24:MI:SS') fecha_salida_enfermeria,
hcvok.observacion,
suen.nombre ||' - '|| suen.descripcion AS nombre_enfermero_salida,
TO_CHAR(ings.fecha_registro, 'DD/MM-YYYY HH24:MI:SS') fecha_salida_factruracion,
sufa.nombre ||' - '|| sufa.descripcion AS nombre_facturador_salida
FROM
ingresos ing
JOIN pacientes pac ON ing.paciente_id = pac.paciente_id AND ing.tipo_id_paciente = pac.tipo_id_paciente
JOIN hc_ordenes_medicas hcom ON ing.ingreso = hcom.ingreso
JOIN hc_evoluciones hcev ON hcom.evolucion_id = hcev.evolucion_id
JOIN system_usuarios suev ON hcev.usuario_id = suev.usuario_id
JOIN hc_vistosok_salida_detalle hcvok ON ing.ingreso = hcvok.ingreso
JOIN system_usuarios suen ON hcvok.usuario = suen.usuario_id
JOIN ingresos_salidas ings ON ing.ingreso = ings.ingreso
JOIN system_usuarios sufa ON ings.usuario_id = sufa.usuario_id
WHERE
hcom.hc_tipo_orden_medica_id = '99' 
AND hcom.sw_estado = '0'
AND ing.fecha_ingreso::DATE BETWEEN _1 AND _2
ORDER BY ing.fecha_ingreso
-----------------------------------------------------------------
-- INSERT CON SUBCONSULTA permisos para el modulo de firmas de resultados
INSERT INTO user_permisos_os_listatra_apoyod_detalle_profesionales (usuario_id, tipo_id_tercero, tercero_id, departamento, tipo_os_lista_id) 
SELECT 3355,'CC', '1144164834', departamento, tipo_os_lista_id AS ep FROM user_permisos_os_listatra_apoyod_detalle_profesionales 
WHERE usuario_id=452 ;--usuario que necesitamos copiar.
-----------------------------------------------------------------
INSERT INTO user_permisos_os_listatra_apoyod_detalle_profesionales VALUES (3355, 'CC', '1144164834', '010108', 10);
INSERT INTO user_permisos_os_listatra_apoyod_detalle_profesionales VALUES (3355, 'CC', '1144164834', '010110', 10);
INSERT INTO user_permisos_os_listatra_apoyod_detalle_profesionales VALUES (3355, 'CC', '1144164834', '010113', 10);
INSERT INTO user_permisos_os_listatra_apoyod_detalle_profesionales VALUES (3355, 'CC', '1144164834', '612504', 10);
INSERT INTO user_permisos_os_listatra_apoyod_detalle_profesionales VALUES (3355, 'CC', '1144164834', '010126', 10);
INSERT INTO user_permisos_os_listatra_apoyod_detalle_profesionales VALUES (3355, 'CC', '1144164834', '010116', 10);
------------------------------------------------------------------------------------------------------------------------------
UPDATE cums_vigentes SET nombre_producto= 'ACICLOVIR250 MG POLVO LIOFILIZADO PARA RECONSTITUIR A SOLUCION INYECTABLE', laboratorio= 'VITALIS S.A.C.I.', registro_sanitario= '2022M-0003840-R2', estado_registro_sanitario='V', presentacion_comercial='CAJA PLEGADIZA POR 10 VIALES DE VIDRIO TIPO I COLOR AMBAR. TAPON GRIS DE BROMOBUTILO Y AGRAFE DE ALUMINIO TIPO CEBRA.', estado='A', fecha_registro='2022-02-12', fecha_vencim_reg_sanitrio='2035-12-29' WHERE code_cums='19945134-5';
UPDATE cums_vigentes SET nombre_producto= 'ACIDO FOLICO TABLETAS 1 MG.', laboratorio= 'LABORATORIOS ECAR SA', registro_sanitario= '2022M-011236-R3', estado_registro_sanitario='V', presentacion_comercial='CAJA CARTON X 200 TABLETAS EN BLISTER PVC/ALUMINIO X 10 TABLETAS C/U.', estado='A', fecha_registro='2022-02-12', fecha_vencim_reg_sanitrio='2035-12-29' WHERE code_cums='35662-3';
UPDATE cums_vigentes SET nombre_producto= 'ALBENDAZOL SUSPENSION 100 MG. / 5 ML', laboratorio= 'GENFAR S.A.', registro_sanitario= '2022M-010770-R3', estado_registro_sanitario='V', presentacion_comercial='FRASCO DE POLIETILENO DE ALTA DENSIDAD POR 20 ML', estado='A', fecha_registro='2022-02-12', fecha_vencim_reg_sanitrio='2035-12-29' WHERE code_cums='33439-2';
UPDATE cums_vigentes SET nombre_producto= 'AMIKACINA 100 MG / 2 ML', laboratorio= 'VITALIS S.A.C.I.', registro_sanitario= '2022M-014889-R3', estado_registro_sanitario='V', presentacion_comercial='CAJA PLEGADIZA CON 10 AMPOLLAS POR 2 ML EN VIDRIO TIPO I INCOLORO', estado='A', fecha_registro='2022-02-12', fecha_vencim_reg_sanitrio='2035-12-29' WHERE code_cums='19908237-19';
------------------------------------------------------------------------------------------------------------------------------
SELECT 
a.transaccion,
a.consecutivo,
a.cargo,
a.valor_cubierto,
a.cantidad,
d.prefijo,
b.numeracion,
c.fecha_registro,
e.nombre,
e.descripcion
FROM 
cuentas_detalle a, 
bodegas_documentos_d b,
bodegas_documentos c, 
bodegas_doc_numeraciones d,
system_usuarios e
WHERE a.consecutivo=b.consecutivo 
AND a.numerodecuenta=1974204  
AND b.codigo_producto='0102110653' 
AND b.numeracion=c.numeracion 
AND b.bodegas_doc_id=c.bodegas_doc_id 
AND c.bodegas_doc_id=d.bodegas_doc_id  
AND c.usuario_id=e.usuario_id 
ORDER BY a.cargo DESC
------------------------------------------------------------------------------------------------------------------------------
SELECT a.paciente_id,a.tipo_id_paciente,a.agenda_cita_ASignada_id,c.fecha_turno, b.hora
FROM agenda_citAS_ASignadAS a, agenda_citAS b,agenda_turnos c
WHERE a.agenda_cita_id=b.agenda_cita_id 
AND b.agenda_turno_id=c.agenda_turno_id 
AND a.paciente_id='1111690753'
AND a.tipo_id_paciente='TI' 
--AND c.tipo_consulta_id=73 
--AND c.fecha_turno>='2023-07-17'
 ORDER BY c.fecha_turno DESC
------------------------------------------------------------------------------------------------------------------------------
-- para realizar el cambio del plan en las ordenes de servicio que tengan un mal plan
------------------------------------------------------------------------------------------------------------------------------
 UPDATE os_ordenes_servicios
SET plan_id=4358 WHERE 
orden_servicio_id IN (
SELECT
maes.orden_servicio_id
FROM
os_maestro AS maes
INNER JOIN os_ordenes_servicios AS orden
ON (maes.orden_servicio_id=orden.orden_servicio_id)
WHERE
maes.sw_estado='1'
AND orden.plan_id IN(4328,4323,4313))
------------------------------------------------------------------------------------------------------------------------------
-- ver el error de laboratorio, de no tiene cuenta creada
------------------------------------------------------------------------------------------------------------------------------
SELECT
a.numerodecuenta,
a.plan_id,
a.total_cuenta,
c.servicio,
c.descripcion,
d.ingreso,
f.plan_descripcion,
e.nombre_tercero as tercero,
(a.total_cuenta - a.valor_cubierto - (a.abono_efectivo + a.abono_cheque + a.abono_tarjetas + a.abono_chequespf + a.abono_letras + a.abono_otros)) as saldo
FROM cuentas a,servicios c,ingresos d,terceros e,planes f
WHERE
c.servicio='2'
AND d.tipo_id_paciente='RC'
AND d.paciente_id='1061216482'
AND a.ingreso=d.ingreso
--AND d.estado='1'
AND a.estado='1'
AND c.sw_cargo_multidpto='1'
AND e.tipo_id_tercero=f.tipo_tercero_id
AND e.tercero_id=f.tercero_id
AND a.plan_id='4201'
AND a.plan_id=f.plan_id;

------------------------------------------------------------------------------------------------------------------------------
-- INSERT SELCT para que inserte de la tabla doc_inv_cv01_01_parametros los de bodega FA en la bodega ON
------------------------------------------------------------------------------------------------------------------------------
INSERT INTO cg_conf.doc_inv_cv01_01_parametros  (empresa_id, grupo_id, clase_id, subclase_id, centro_utilidad, bodega, cuenta)
SELECT '01', grupo_id, clase_id, subclase_id, centro_utilidad, 'ON', cuenta AS ep FROM cg_conf.doc_inv_cv01_01_parametros 
WHERE bodega='FA';