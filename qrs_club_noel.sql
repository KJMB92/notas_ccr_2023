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
cd.numerodecuenta = 2039232
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





MIGUEL CONSULTA EXTERNA
MIGUEL.PALACIOS
EXT 1300
MODULO DE AGENDA MEDICA PARA QUE LE APARESCA LAS AGENDAS DEL DOCTOR QUE ESTA EN TURNO
-------------------------------------
ana maria de ortopedia
problema con la medica 
ti 1112049119
ext 1191
192.168.6.50
Gestionado, esperando respuesta
---------------------------------------
glpi matrimonio entre 
odontopedriatria y odontologia general
ext 1210
diana barbosa
esperando a sayli para revisarlo
---------------------------------------
diana ghu
terceros
modulo 
empleados 
terceros que no estan catalogados como empleados
23477
23493
ext 1023
---------------------------------------
192.168.80.115
---------
192.168.3.58
7YzyWB7u%1aiDpo$*

(postgres7): INSERT INTO inv_solicitudes_devolucion ( empresa_id, centro_utilidad, documento, bodega, fecha, observacion, usuario_id, fecha_registro, estacion_id, estado, ingreso, parametro_devolucion_id ) VALUES ( '01', '01', 426920, 'FA', '2024-04-01', 'SALIDA', 2028, now(), 'ERA2', '0', 1996739, '1' );INSERT INTO inv_solicitudes_devolucion_d ( documento, codigo_producto, cantidad, documentos_despachos, codigo_producto_sol, fecha_vencimiento, lote ) VALUES ( 426920, '0102010377', 1, '3052751', '0102010377', '2025-02-28', 'OTXID22002A' );INSERT INTO inv_solicitudes_devolucion_d ( documento, codigo_producto, cantidad, documentos_despachos, codigo_producto_sol, fecha_vencimiento, lote ) VALUES ( 426920, '0102011152', 1, '3051032,3051029', '0102011152', '2025-10-27', 'A231083' );INSERT INTO inv_solicitudes_devolucion_d ( documento, codigo_producto, cantidad, documentos_despachos, codigo_producto_sol, fecha_vencimiento, lote ) VALUES ( 426920, '0102011152', 1, '3051032,3051029', '0102011152', '2025-11-28', 'A231206' );INSERT INTO inv_solicitudes_devolucion_d ( documento, codigo_producto, cantidad, documentos_despachos, codigo_producto_sol, fecha_vencimiento, lote ) VALUES ( 426920, '0102011152', 1, '3051032,3051029', '0102011152', '2025-11-27', 'A231207' );INSERT INTO inv_solicitudes_devolucion_d ( documento, codigo_producto, cantidad, documentos_despachos, codigo_producto_sol, fecha_vencimiento, lote ) VALUES ( 426920, '0102011519', 2, '3052181', '0102011519', '2026-08-30', '30364' );INSERT INTO inv_solicitudes_devolucion_d ( documento, codigo_producto, cantidad, documentos_despachos, codigo_producto_sol, fecha_vencimiento, lote ) VALUES ( 426920, '0102030989', 1, '3049785', '0102030989', '2026-08-30', '86782' );  


-1: ERROR: LA CANTIDAD A DEVOLVER DEL PRODUCTO ES MAYOR QUE LA REGISTRADA EN LA BODEGA DEL PACIENTE EN EL RESULTADO DE LOS CAMPOS(stock_almacen - cantidad_en_devolucion), PRODUCTO[0102030989], SOLICITADO[0102030989], INGRESO[1996739],PREPARACION[] CONTEXT: funciÃ³n PL/pgSQL bodega_paciente_control_bodegas() en la lÃ­nea 670 en RAISE


1241

--------------------------------------
EL VALOR A FACTURAR DE LA CUENTA EXCEDE EL VALOR DEL CONTRATO
FACTURAR CUENTA 2042293
ext 2224
johana otalvaro

---------------------------------------
ext 1238 
NEUROPSICOLOGIA cancelacion