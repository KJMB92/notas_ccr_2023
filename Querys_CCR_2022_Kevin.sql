--ELiminar Examen Fisico

DELETE FROM hc_revision_por_sistemas WHERE evolucion_id=4211183 AND ingreso=245924

--ACTUALIZA FECHA EN EXAMEN FISICO
UPDATE hc_revision_por_sistemas SET fecha_registro = '2021-06-02 20:19:07' WHERE evolucion_id=4952824 and ingreso=318444

-- Actualizar profesional y/o fecha de registro en EXAMEN FISICO
UPDATE hc_revision_por_sistemas SET usuario_id=1000
AND fecha_registro='2018-11-08 15:43:39'
WHERE evolucion_id=XXXXX AND ingreso=XXXXX

--Eliminar usuario -- completar
DELETE FROM profesionales_estado WHERE tercero_id='1116280312';
DELETE FROM profesionales_empresas WHERE tercero_id='1116280312';
DELETE FROM profesionales_departamentos WHERE tercero_id='1116280312';
DELETE FROM profesionales_especialidades WHERE tercero_id='1116280312';
DELETE FROM profesionales WHERE usuario_id=3018;
DELETE FROM system_usuarios_empresas WHERE usuario_id=3018;
DELETE FROM system_menu_items_usuarios WHERE usuario_id=3018;
DELETE FROM system_usuarios WHERE usuario_id=3018;


--Eliminar Profesional
		DELETE FROM profesionales_estado WHERE tercero_id='1143970103';
	  DELETE FROM profesionales_empresas WHERE tercero_id='1143970103';
    DELETE FROM profesionales_departamentos WHERE tercero_id='1143970103';
    DELETE FROM profesionales_especialidades WHERE tercero_id='1143970103';
		DELETE FROM profesionales WHERE tercero_id='1143970103';


SELECT agc.* 
FROM agenda_citas agc 
JOIN agenda_turnos agt ON agc.agenda_turno_id = agt.agenda_turno_id
WHERE agt.profesional_id='1151957874';

SELECT * 
FROM agenda_citas_asignadas 
WHERE  agenda_cita_id IN(SELECT agc.agenda_cita_id
FROM agenda_citas agc 
JOIN agenda_turnos agt ON agc.agenda_turno_id = agt.agenda_turno_id
WHERE agt.profesional_id='1151957874')


SELECT *
FROM os_cruce_citas
WHERE agenda_cita_asignada_id IN(SELECT acas.agenda_cita_asignada_id
FROM agenda_citas_asignadas acas
WHERE  agenda_cita_id IN(SELECT agc.agenda_cita_id
FROM agenda_citas agc 
JOIN agenda_turnos agt ON agc.agenda_turno_id = agt.agenda_turno_id
WHERE agt.profesional_id='1151957874'))


SELECT cdp.* 
FROM cuentas_detalle_profesionales cdp
JOIN profesionales prof ON  cdp.tercero_id = prof.tercero_id
WHERE prof.tercero_id='1151957874'


SELECT ccqp.*
FROM cuentas_cargos_qx_procedimientos ccqp
WHERE cuenta_liquidacion_qx_id IN(SELECT qlqx.cuenta_liquidacion_qx_id 
FROM cuentas_liquidaciones_qx qlqx
JOIN profesionales prof ON  qlqx.ayudante_id = prof.tercero_id
WHERE prof.tercero_id='1151957874')

-- Primero se ejecuta este 1
DELETE FROM os_cruce_citas
WHERE agenda_cita_asignada_id IN(SELECT osc.agenda_cita_asignada_id
FROM os_cruce_citas osc
WHERE agenda_cita_asignada_id IN(SELECT acas.agenda_cita_asignada_id
FROM agenda_citas_asignadas acas
WHERE  agenda_cita_id IN(SELECT agc.agenda_cita_id
FROM agenda_citas agc 
JOIN agenda_turnos agt ON agc.agenda_turno_id = agt.agenda_turno_id
WHERE agt.profesional_id='1151957874')))

--Luego este 2
DELETE FROM agenda_citas_asignadas 
WHERE  agenda_cita_id IN(SELECT agc.agenda_cita_id
FROM agenda_citas agc 
JOIN agenda_turnos agt ON agc.agenda_turno_id = agt.agenda_turno_id
WHERE agt.profesional_id='1151957874')

--luego este 3
DELETE FROM agenda_citas 
WHERE agenda_cita_id IN 
(SELECT agc.agenda_cita_id
FROM agenda_citas agc 
JOIN agenda_turnos agt ON agc.agenda_turno_id = agt.agenda_turno_id
WHERE agt.profesional_id='1151957874');

--luego este 4
DELETE FROM cuentas_detalle_profesionales
WHERE tercero_id IN(SELECT cdp.tercero_id
FROM cuentas_detalle_profesionales cdp
JOIN profesionales prof ON  cdp.tercero_id = prof.tercero_id
WHERE prof.tercero_id='1151957874')

--luego este 5

--aqui va otro

DELETE FROM cuentas_liquidaciones_qx
WHERE ayudante_id IN (SELECT qlqx.ayudante_id
FROM cuentas_liquidaciones_qx qlqx
JOIN profesionales prof ON  qlqx.ayudante_id = prof.tercero_id
WHERE prof.tercero_id='1151957874')


DELETE FROM agenda_turnos WHERE profesional_id='1151957874';
DELETE FROM profesionales_estado WHERE tercero_id='1151957874';
DELETE FROM profesionales_empresas WHERE tercero_id='1151957874';
DELETE FROM profesionales_departamentos WHERE tercero_id='1151957874';
DELETE FROM profesionales_especialidades WHERE tercero_id='1151957874';
DELETE FROM profesionales WHERE tercero_id='1151957874';

-- en hc_conducta_remision poner en null el registro

-- vamos a probar con este 1111806831
-- Actualizar Profesional
UPDATE  ingresos_soat SET tercero_id='1151957874' WHERE tercero_id='1151957874';
UPDATE  profesionales_empresas SET tercero_id='1151957874' WHERE tercero_id='1151957874';
UPDATE  profesionales_estado SET tercero_id='1151957874' WHERE tercero_id='1151957874';
UPDATE  profesionales_departamentos SET tercero_id='1151957874' WHERE tercero_id='1151957874';
UPDATE  profesionales_especialidades SET tercero_id='1151957874' WHERE tercero_id='1151957874';
UPDATE  agenda_turnos SET profesional_id='1151957874' WHERE profesional_id='1151957874';
UPDATE  cuentas_detalle_profesionales SET tercero_id='1151957864' WHERE tercero_id='1151957874';
UPDATE  cuentas_liquidaciones_qx SET ayudante_id='1151957874' WHERE ayudante_id='1151957874';
UPDATE  hc_conducta_remision SET tercero_id='1151957874' WHERE tercero_id='1151957874';


--Eliminar varios usuario de estacion de enfermeria

DELETE FROM estaciones_enfermeria_usuarios where usuario_id IN(2278)

--Query para actualizar estacion de usuarios

UPDATE estaciones_enfermeria SET sw_productos_pendientes='1 ,sw_productos_confirmar=1'


--Query para ubicar texto en plan terapeutico

SELECT pt.descripcion, pt.evolucion_id, pt.fecha_registro_plan 
FROM hc_evoluciones_submodulos evs, hc_plan_terapeutico pt, cuentas c
WHERE evs.evolucion_id = pt.evolucion_id
AND c.ingreso = evs.ingreso
AND evs.ingreso=169692
--AND c.numerodecuenta = 45570
AND pt.fecha_registro_plan >= '2019-07-06 00:01' AND  pt.fecha_registro_plan < '2019-07-07 23:59'
AND pt.descripcion ilike '%DE ECO DE TORAX%'
limit 50

--Consulta entre tablas evoluciones

UPDATE 
SET

SELECT o.hc_os_solicitud_id, o.evolucion_id, o.ingreso, o.fecha_solicitud, a.medico_avalista, a.usuario_solicitud
FROM hc_os_solicitudes o, hc_os_solicitudes_apoyod a
where o.hc_os_solicitud_id=a.hc_os_solicitud_id
AND o.paciente_id = 16594050
AND a.medico_avalista=248 

--Eliminar componentes de usuarios de una estacion 

DELETE FROM estaciones_enfermeria_usuarios_componentes WHERE usuario_id = 758

--Actualizar perfil a medico especialista en la tabla estaciones enfermeria

UPDATE estaciones_enfermeria_usuarios SET estacion_perfil_id = 02 WHERE usuario_id = 480

--Eliminar KIT de la tabla insumos

DELETE FROM  insumos_paquetes_d WHERE insumo_paquete_id = 3 AND codigo_producto IN ('0201010738',
 '0201010189', 
 '0201010570', 
 '0201010167', 
 '0201010161', 
 '0201010113', 
 '0201010782', 
 '0201010647')
 
 --Eliminar Recomendaciones medicas
 DELETE FROM hc_recomendaciones_medicas_detalle WHERE evolucion_id='3131221';
		 DELETE FROM hc_recomendaciones_medicas WHERE evolucion_id='3131221';

--Query buscar usuarios por login

SELECT u.usuario_id, u.usuario
FROM system_usuarios u
WHERE u.usuario IN ('roslucpa',
'mayferfe',
'luipospo',
'astminmi',
'gusagupa',
'julpinmo',
'myrbermu',
'adrmormi',
'alejimda',
'yenvalla'
)

--Actualizar Descripcion de usuarios

UPDATE system_usuarios SET descripcion = 'PROCESO AUDITORIA Y FACTURACION INTEGRAL' WHERE usuario_id IN (1005,
985 ,
1028,
1023,
1025,
316 ,
285 ,
724 ,
733 ,
889 ,
699 ,
303 ,
315 ,
389 ,
390 ,
544 ,
770 ,
543 ,
912 ,
653 ,
483 ,
793 ,
319 ,
680 ,
725 ,
719 ,
517 ,
552 ,
833 ,
382 ,
794 ,
832 ,
528) 

--Actualizar Perfil de usuario 

UPDATE system_usuarios_perfiles SET perfil_id = XXX WHERE usuario_id IN (1025,
1028,
653,
315,
382,
303,
912)

--Reliquidar Cirugia

DELETE FROM soat_atencion_ambulatoria WHERE numerodecuenta ='38196 ' AND departamento ='CIRU01' AND cargo <> 'IMD'

--Eliminar Perfil

DELETE FROM system_modulos_perfiles WHERE perfil_id = 99
DELETE FROM system_modulos_perfiles_opciones WHERE system_modulo_perfil_id IN (1290,
1291,1292,1293,1294,1295,1296,1297,1298,1299,1300,1301,1302,1303,1318,1305,1306,1309,
1310,1311,1327,1517,1518,1519,1618)

--Query para consultar usuarios con varios perfiles

SELECT u.usuario_id, COUNT(*) Total, u.nombre, u.activo
FROM system_usuarios_perfiles up, system_usuarios u
WHERE up.usuario_id = u.usuario_id
GROUP BY u.usuario_id
HAVING COUNT(*) > 1

--Borrar usuario de reportes CSV

DELETE FROM usuarios_asigna_reportes WHERE usuario_id = 542

--QUERY para consultar Reportes por perfil y por usuario ()

SELECT ur.reporte_empresa_id, u.usuario, re.nombre_archivo, re.titulo_reporte, up.perfil_id, p.descripcion
FROM usuarios_asigna_reportes ur, system_usuarios u, reportes_empresa re, system_usuarios_perfiles up, system_perfiles p
WHERE u.usuario_id = ur.usuario_id
AND ur.reporte_empresa_id = re.reporte_empresa_id
AND u.usuario_id = up.usuario_id
AND up.perfil_id = p.perfil_id
AND up.perfil_id = 60
AND u.usuario_id = 4
ORDER BY reporte_empresa_id

--Consultar Menus por perfil

SELECT mp.*, mi.titulo
FROM system_menu_items_perfiles mp, system_menus_items mi
WHERE mp.menu_item_id = mi.menu_item_id
AND mp.perfil_id = 89
ORDER BY mi.titulo

-- Actualizar caducidad de contraseña

--UPDATE system_usuarios SET fecha_caducidad_contrasena IS NULL, caducidad_contrasena IS NULL WHERE usuario IN ('joragumi','fraroddi','lorchara','ANDarica','dieferco','linherfe','stehercr','wilgardo')

UPDATE system_usuarios 
SET fecha_caducidad_contrasena = NOW(), caducidad_contrasena = NULL 
WHERE fecha_caducidad_contrasena IS NULL 
AND usuario NOT IN ('andarica','linherfe','stehercr','cargonal','kevmurbo','auxcasino','audexterno','aussanco','juaquihu','carcorca','luiurrlo','nicjimli')








--Eliminar nota que se repite 

DELETE FROM hc_notas_enfermeria_descripcion WHERE hc_notas_enfermeria_descripcion_id IN (300085,
300086,
300074,
300088,
300054,
300055,
300180,
300064,
300067)

--Consultar menus por perfiles

SELECT sm.titulo, sp.*
FROM system_menu_items_perfiles smp, system_menus_items sm, system_perfiles sp
WHERE smp.menu_item_id = sm.menu_item_id
AND smp.perfil_id = sp.perfil_id
AND smp.menu_item_id = 224
AND smp.perfil_id <> 2 --Este perfil es de administrador

SELECT u.usuario_id, COUNT(*) Total, u.nombre, u.activo AS Estado
FROM system_usuarios_perfiles up, system_usuarios u
WHERE up.usuario_id = u.usuario_id
GROUP BY u.usuario_id
HAVING COUNT(*) > 1

-- Query para borrar modulo por perfiles
 
DELETE FROM system_menu_items_perfiles WHERE menu_item_id = 224 AND perfil_id IN (3,4,6,14,15,16,62,60,83,88,95,
53,54,52,89,87,100,98,112,113,32,114,109,117,40,122,123)

-- Query para buscar modulos en un perfil

SELECT sp.descripcion,smi.menu_item_id, smi.titulo
FROM system_menu_items_perfiles smp, system_menus_items smi, system_perfiles sp
WHERE smp.perfil_id = sp.perfil_id
AND smp.menu_item_id= smi.menu_item_id
AND smp.perfil_id = 14
ORDER BY smi.titulo

-- Query para buscar reportes de todos los usuarios de acuerdo al perfil

SELECT ur.reporte_empresa_id, 
       u.usuario_id ,
       u.usuario, 
       re.nombre_archivo, 
       re.titulo_reporte, 
       up.perfil_id, 
       p.descripcion
FROM usuarios_asigna_reportes ur, 
     system_usuarios u, 
     reportes_empresa re, 
     system_usuarios_perfiles up, 
     system_perfiles p
WHERE u.usuario_id = ur.usuario_id
  AND ur.reporte_empresa_id = re.reporte_empresa_id
  AND u.usuario_id = up.usuario_id
  AND up.perfil_id = p.perfil_id
  AND up.perfil_id = 24
  ORDER BY u.usuario_id

-- Query para actualizar observacion en varios items de una respuesta glosa

UPDATE glosas_respuestas_cargos SET observacion = '3051.1, no se acepta glosa, paciente que sufre accidente de tránsito en calidad de 
peatón vs moto presenta trauma en codo, humero, reja costal, cadera del lado izquierdo, dolor de intensidad moderada, Según hallazgos 
y evolución clínica, se definirá conducta a seguir, Se indica manejo analgésico y curación de heridas, por el mecanismo del trauma y 
las lesiones presentadas se requiere descartar lesiones a este nivel, no se acepta glosa y nos acogemos decreto número 4747 de 2007 
artículo 23. una vez formuladas las glosas a una factura, no se podrán formular nuevas glosas a la misma factura, salvo las que surjan 
de hechos nuevos detectados en la respuesta dada a la glosa inicial. y según la administradora de los recursos del sistema general de 
seguridad social en salud manual de auditoría integral de reclamaciones siempre que en la respuesta a los resultados de auditoría el 
reclamante aporte un nuevo documento, este será objeto de una auditoría integral complementando la realizada a la reclamación inicial 
y solo respecto de este nuevo documento podrán aplicarse nuevas glosas, en cuyo caso opera el derecho a dar respuesta al resultado de 
auditoría.' where glosa_respuesta_id=38188
AND glosa_respuesta_cargo_id IN (
190955,
190956,
190957,
190958,
190959)
---Insertar usuario soat
INSERT INTO system_usuarios_departamentos VALUES(410,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(412,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(413,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(414,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(415,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(508,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(546,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(554,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(554,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(556,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(685,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(900,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(1011,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(1179,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(1198,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(1282,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(1156,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(1166,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(1643,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(1644,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(1651,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(1652,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(1834,'ADMISI',now(),3010,'1');
INSERT INTO system_usuarios_departamentos VALUES(2030,'ADMISI',now(),3010,'1');
---------
INSERT INTO userpermisos_soat VALUES('01','01',410);
INSERT INTO userpermisos_soat VALUES('01','01',412);
INSERT INTO userpermisos_soat VALUES('01','01',413);
INSERT INTO userpermisos_soat VALUES('01','01',414);
INSERT INTO userpermisos_soat VALUES('01','01',415);
INSERT INTO userpermisos_soat VALUES('01','01',508);
INSERT INTO userpermisos_soat VALUES('01','01',546);
INSERT INTO userpermisos_soat VALUES('01','01',554);
INSERT INTO userpermisos_soat VALUES('01','01',554);
INSERT INTO userpermisos_soat VALUES('01','01',556);
INSERT INTO userpermisos_soat VALUES('01','01',685);
INSERT INTO userpermisos_soat VALUES('01','01',900);
INSERT INTO userpermisos_soat VALUES('01','01',1011);
INSERT INTO userpermisos_soat VALUES('01','01',1179);
INSERT INTO userpermisos_soat VALUES('01','01',1198);
INSERT INTO userpermisos_soat VALUES('01','01',1282);
INSERT INTO userpermisos_soat VALUES('01','01',1156);
INSERT INTO userpermisos_soat VALUES('01','01',1166);
INSERT INTO userpermisos_soat VALUES('01','01',1643);
INSERT INTO userpermisos_soat VALUES('01','01',1644);
INSERT INTO userpermisos_soat VALUES('01','01',1651);
INSERT INTO userpermisos_soat VALUES('01','01',1652);
INSERT INTO userpermisos_soat VALUES('01','01',1834);
INSERT INTO userpermisos_soat VALUES('01','01',2030);
			



--Actualizar Usuario de Control Cuentas ya creado

UPDATE system_usuarios_departamentos_cc SET usuario_id = 3051 WHERE usuario_id = 3026
UPDATE usuarios_menu_prosi SET usuario_id = 3106 WHERE usuario_id = 3026
INSERT INTO system_usuarios_departamentos_cc 

--Borrar respuesta glosas

DELETE FROM glosas_respuestas_inventarios WHERE glosa_respuesta_id IN (46331,45707);
DELETE FROM glosas_respuestas_cargos WHERE glosa_respuesta_id IN (46331,45707);

--Buscar documentos interfazados en lapso de fecha
SELECT * FROM cg_mov_01.cg_mov_contable_01 WHERE sw_interface='1' 
AND lapso='201702' 
AND fecha_documento BETWEEN '2017-02-18' AND '2017-02-09'
ORDER BY(fecha_documento)

-- Query para actualizar la interfaz a varios documentos contables

UPDATE cg_mov_01.cg_mov_contable_01 SET sw_interface = '1' WHERE prefijo='RTC' AND numero IN (1505, 1506, 
1507, 1533, 1534, 1544)

-------insertar cargos cups

--INSERT INTO hc_notas_operatorias_procedimientos VALUES(29566,'862505','1',DEFAULT,DEFAULT,228860,NULL);
INSERT INTO hc_notas_operatorias_procedimientos VALUES(29566,'834203','1',DEFAULT,DEFAULT,228860,NULL);
INSERT INTO hc_notas_operatorias_procedimientos VALUES(29566,'862510','1',DEFAULT,DEFAULT,228860,NULL);
INSERT INTO hc_notas_operatorias_procedimientos VALUES(29566,'862505','1',DEFAULT,DEFAULT,228860,NULL);
INSERT INTO hc_notas_operatorias_procedimientos VALUES(29566,'862505','1',DEFAULT,DEFAULT,228860,NULL);
INSERT INTO hc_notas_operatorias_procedimientos VALUES(29566,'397203','1',DEFAULT,DEFAULT,228860,NULL);
INSERT INTO hc_notas_operatorias_procedimientos VALUES(29566,'836001','1',DEFAULT,DEFAULT,228860,NULL);
INSERT INTO hc_notas_operatorias_procedimientos VALUES(29566,'861103','1',DEFAULT,DEFAULT,228860,NULL);
INSERT INTO hc_notas_operatorias_procedimientos VALUES(29566,'867002','1',DEFAULT,DEFAULT,228860,NULL);
INSERT INTO hc_notas_operatorias_procedimientos VALUES(29566,'397206','1',DEFAULT,DEFAULT,228860,NULL);

--Actualizar color de SIIS

UPDATE system_usuarios_vars SET valor = 'AzulXp' WHERE variable = 'Tema'

--Actualizar planes tipo cama

UPDATE planes_tipos_camas SET tarifario_id = '0005', valor_lista = 73700 WHERE plan_id = 159 
AND cargo_cups = 'S20100' AND cargo = '38925';
--Excel
--=CONCATENAR("UPDATE planes_tipos_camas SET tarifario_id = '";E4;"', valor_lista = ";H4;" WHERE plan_id = ";B4;" AND cargo_cups = '";F4;"' AND cargo = '";G4;"';")

--Query para eliminar perfiles

DELETE FROM system_modulos_perfiles_opciones WHERE system_modulo_perfil_id IN (2594,
2595,
2596,
2597,
2598,
2618,
2605,
2606,
2607,
23051,
2723,
2724,
2725,
2771,
2792,
2793,
2794,
2795,
2796);

DELETE FROM system_modulos_perfiles WHERE perfil_id = 128;
    DELETE FROM system_menu_items_perfiles WHERE perfil_id = 128;
        DELETE FROM system_perfiles WHERE perfil_id = 128;
		
--cargue de medicamento/insumo en cuenta con transaccion y bodega discriminado
SELECT cd.transaccion
, bd.codigo_producto
, cd.numerodecuenta
, cd.cargo
, cd.departamento
, bdn.bodega
, cd.cantidad
, cd.precio 
FROM cuentas_detalle cd
INNER JOIN bodegas_documentos_d bd ON (cd.consecutivo=bd.consecutivo)
INNER JOIN bodegas_doc_numeraciones  bdn ON (bd.bodegas_doc_id = bdn.bodegas_doc_id)
WHERE cd.numerodecuenta=217576
AND bd.codigo_producto='0201010542'
ORDER BY cd.departamento

--cargue de medicamento/insumo en cuenta con sumatoria por bodega sin trasaccion

SELECT bd.codigo_producto
, cd.numerodecuenta
, cd.cargo
, cd.departamento
, bdn.bodega
, SUM (cd.cantidad)
, cd.precio 
FROM cuentas_detalle cd
INNER JOIN bodegas_documentos_d bd ON (cd.consecutivo=bd.consecutivo)
INNER JOIN bodegas_doc_numeraciones  bdn ON (bd.bodegas_doc_id = bdn.bodegas_doc_id)
WHERE cd.numerodecuenta=217576
AND bd.codigo_producto='0201010542'
GROUP BY 1,2,3,4,5,7
ORDER BY cd.departamento

--Query para buscar medicamentos devueltos

SELECT   /*b.*, a.usuario_id,
         a.fecha_registro,
         a.bodega,*/ d.*
FROM inv_solicitudes_devolucion a, 
     inv_solicitudes_devolucion_d b,
     bodegas_documentos_d c,
     cuentas_detalle d
WHERE   a.documento = b.documento
    AND a.numeracion = c.numeracion
    AND c.consecutivo = d.consecutivo
    AND b.codigo_producto = c.codigo_producto
    --AND d.codigo_producto = '0201010368'
    AND d.cargo = 'DIMD'
    AND a.ingreso = 244342
    --AND d.numerodecuenta = 68634


--Query para buscar la solicitud de un medicamento quien despacho

SELECT  a.solicitud_id,
        a.ingreso,
        a.fecha_solicitud,
        a.estacion_id,
        b.medicamento_id,
        b.cant_solicitada,
        a.usuario_id,
        c.nombre AS usuario_solicito,
        a.documento_despacho,
        d.usuario_id,
        e.nombre AS usuario_despacho,
		d.fecha_registro AS fecha_despacho 
FROM hc_solicitudes_medicamentos a,
     hc_solicitudes_medicamentos_d b,
     system_usuarios c,
     system_usuarios e,
     bodegas_documento_despacho_med d 
WHERE a.solicitud_id = b.solicitud_id
  AND c.usuario_id = a.usuario_id
  AND a.documento_despacho = d.documento_despacho_id
  AND d.usuario_id = e.usuario_id
  AND a.ingreso = 80083
  AND b.medicamento_id = '0102010072'
ORDER BY a.fecha_solicitud


--Query para buscar la solicitud de un insumo quien despacho


SELECT  a.solicitud_id,
		a.sw_estado,
        a.ingreso,
        a.fecha_solicitud,
        a.estacion_id,
        b.codigo_producto,
        b.cantidad AS cantidad_solicitada,
        a.usuario_id,
        c.nombre AS usuario_solicito,
        a.documento_despacho,
		d.cantidad AS cantidad_despachada,
        f.usuario_id,
        e.nombre AS usuario_despacho,
        f.fecha_registro AS fecha_despacho 
FROM hc_solicitudes_medicamentos a,
     hc_solicitudes_insumos_d b,
     system_usuarios c,
     system_usuarios e,
     bodegas_documento_despacho_ins_d d,
	 bodegas_documento_despacho_med f
WHERE a.solicitud_id = b.solicitud_id
AND b.consecutivo_d = d.consecutivo_solicitud
  AND c.usuario_id = a.usuario_id
  AND d.documento_despacho_id = f.documento_despacho_id
  AND f.usuario_id = e.usuario_id
  AND a.ingreso = 179072
  AND b.codigo_producto= '0201010618'
ORDER BY a.fecha_solicitud


-- Query para actualizar facturas de pacientes plan particular
	
UPDATE fac_facturas SET sw_clase_factura = 1, tipo_factura = 1 WHERE factura_fiscal IN (57615, 58616, 5936)

-- Query para consultar los ID contables repetidos en glosas

SELECT DISTINCT b.glosa_id, 
                b.factura_fiscal, 
                b.numero, 
                b.prefijo_glosa
FROM glosas b
WHERE b.numero IN  (SELECT a.numero
                    FROM glosas a
                    WHERE a.numero IS NOT NULL
                    GROUP BY 1
                    HAVING COUNT(*) > 1)
ORDER BY b.numero

--Query para consultar plan de cuenta y factura

SELECT a.factura_fiscal, a.plan_id AS plan_facturas, c.numerodecuenta, c.plan_id AS plan_cuentas
FROM fac_facturas a, fac_facturas_cuentas b, cuentas c 
WHERE a.factura_fiscal = b.factura_fiscal
AND c.numerodecuenta = b.numerodecuenta
AND b.factura_fiscal IN (51624,
54508,
60391,
61106,
61656,
61977,
62153,
62593,
62601,
62903,
63092,
63311)
ORDER BY b.factura_fiscal

--Query para ver los movimientos de un producto

SELECT  a.numerodecuenta,c.ingreso,g.fecha_ingreso,
a.departamento,
f.descripcion,
a.cargo,
a.cantidad,
a.precio,
a.valor_cargo,
d.codigo_producto,
d.descripcion,
a.fecha_cargo AS fecha_cargo_producto
FROM 
 cuentas_detalle a,
 bodegas_documentos_d b,
 cuentas c,
 inventarios_productos d,
 departamentos f,
 ingresos g
WHERE
a.numerodecuenta=c.numerodecuenta AND
a.consecutivo=b.consecutivo AND
b.codigo_producto=d.codigo_producto AND
c.estado!= '5' AND
a.departamento=f.departamento AND 
c.ingreso = g.ingreso AND
d.codigo_producto IN ( '0102010123', 'XXXXXXX')
'10295756'  ,
'11519301047',
'1143842298',
'29671018'  ,
'1061533446',
'94396266'  ,
'38644411'			


-- Planes cuentas

SELECT a.plan_id AS plan_cuentas,
c.plan_id AS plan_tarifario,
b.tarifario_id AS tarifario_cuentas_detalle,
c.tarifario_id AS tarifario,
b.numerodecuenta AS numero_cuenta_detalle
FROM cuentas a, 
cuentas_detalle b,
plan_tarifario c
WHERE a.numerodecuenta = b.numerodecuenta
AND a.plan_id = c.plan_id
AND b.tarifario_id <> c.tarifario_id
AND a.plan_id IN (219,196)
AND a.estado IN ('1','2','3')
AND c.tarifario_id IN ('0018', '0005')
AND b.tarifario_id <> 'SYS'

--Estado de cuenta cuadrada

UPDATE cuentas SET estado='3' WHERE (estado='1' OR estado='2')AND numerodecuenta IN (
132917)

--Actualizar plan en cuentas
UPDATE cuentas SET plan_id = 219, tipo_afiliado_id = 2, rango = '1' WHERE numerodecuenta IN (72815,
730102,
75170,
72226,
74702,
75618,
76978,
75851,
74643,
73982,
68919)

--Insertar codigos de procedimientos en nota operatoria
=CONCATENAR("INSERT INTO hc_notas_operatorias_procedimientos VALUES(24191,'";A2;"','1',null,'nextval('hc_notas_operatorias_procedimientos_operatoria_id_seq'::regclass)',23080,null);")


-- Borrar Nota Operatorias
             
	 DELETE FROM hc_descripcion_cirugia WHERE hc_nota_operatoria_cirugia_id = 49957;
   DELETE FROM hc_notas_operatorias_profilaxis WHERE hc_nota_operatoria_cirugia_id = 49957;
   DELETE FROM hc_notas_operatorias_procedimientos WHERE hc_nota_operatoria_cirugia_id = 49957;
   DELETE FROM hc_diagnosticos_asociados_postqx_paciente_noc WHERE hc_nota_operatoria_cirugia_id = 49957;
   DELETE FROM hc_cultivos_quirurgicos WHERE hc_nota_operatoria_cirugia_id = 49957;
   DELETE FROM hc_hallazgos_quirurgicos WHERE hc_nota_operatoria_cirugia_id = 49957;
   DELETE FROM hc_patologia_quirurgicos WHERE hc_nota_operatoria_cirugia_id = 49957;
   DELETE FROM hc_notas_operatorias_cirugias WHERE hc_nota_operatoria_cirugia_id = 49957;


-- Consultar Nota Operatorias
             
	 SELECT * FROM hc_descripcion_cirugia WHERE hc_nota_operatoria_cirugia_id = 49758;
   SELECT * FROM hc_notas_operatorias_profilaxis WHERE hc_nota_operatoria_cirugia_id = 49758; no hay nada
   SELECT * FROM hc_notas_operatorias_procedimientos WHERE hc_nota_operatoria_cirugia_id = 49758; no hay nada
   SELECT * FROM hc_diagnosticos_asociados_postqx_paciente_noc WHERE hc_nota_operatoria_cirugia_id = 49758; no hay nada
   SELECT * FROM hc_cultivos_quirurgicos WHERE hc_nota_operatoria_cirugia_id = 49758; no hay nada
   SELECT * FROM hc_hallazgos_quirurgicos WHERE hc_nota_operatoria_cirugia_id = 49758;
   SELECT * FROM hc_patologia_quirurgicos WHERE hc_nota_operatoria_cirugia_id = 49758; no hay nada
   SELECT * FROM hc_notas_operatorias_cirugias WHERE hc_nota_operatoria_cirugia_id = 49758;


-- insertar cargos en nota operatoria

INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, acto_quiru) VALUES (49245, '814911', 47726);
INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, acto_quiru) VALUES (49245, '814908', 47726);
INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, acto_quiru) VALUES (49245, '799703', 47726);
INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, acto_quiru) VALUES (49245, '780701', 47726);
INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, acto_quiru) VALUES (49245, '770701', 47726);
INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, acto_quiru) VALUES (49245, '777700', 47726);
INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, acto_quiru) VALUES (49245, '780701', 47726);
INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, acto_quiru) VALUES (49245, '793711', 47726);
INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, acto_quiru) VALUES (49245, '770701', 47726);
INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, acto_quiru) VALUES (49245, '777700', 47726);
INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, acto_quiru) VALUES (49245, '814911', 47726);
INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, acto_quiru) VALUES (49245, '814908', 47726);
																								   

----------ELIMINAR ACTAS
DELETE FROM actas_conciliacion_glosas_detalle WHERE acta_conciliacion_id=537;
UPDATE glosas_respuestas SET acta_conciliacion_id=NULL WHERE acta_conciliacion_id=537;





-- Usuario Referencia y contrareferencia

INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('CX01','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP3','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP4','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP5','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP7','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP6','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HPV8','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('OBS8','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('OBSE','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UCP4','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP3','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP5','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP6','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP7A','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP7B','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP7C','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('URG8','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('URGC','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC3','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC4','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC5','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC6','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC7','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUCN','3010','18');



-- Usuario PROCESO AUDITORIA Y FACTURACION INTEGRAL MODI 145

INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('CEXV','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('CX01','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP3','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP4','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP5','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP7','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP6','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HPV8','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('OBS8','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('OBSE','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UCP4','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP3','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP5','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP6','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP7A','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP7B','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP7C','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('URG8','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('URGC','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC3','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC4','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC5','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC6','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC7','3010','18');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUCN','3010','18');



UPDATE estaciones_enfermeria_usuarios SET estacion_perfil_id='18' WHERE usuario_id='3010'


-- USUARIO AUDITOR MEDICO
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('CX01','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP3','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP4','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP5','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP7','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP6','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HPV8','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('OBS8','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('OBSE','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UCP4','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP3','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP5','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP6','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP7A','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP7B','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP7C','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('URG8','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('URGC','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC3','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC4','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC5','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC6','3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC7','3010','04');



-- USUARIO DE SEGURIDAD DEL PACIENTE
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('CX01','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP3','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP4','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP5','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP7','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HP6','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('HPV8','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('OBS8','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('OBSE','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UCP4','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP3','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP5','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP6','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP7A','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP7B','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('UP7C','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('URG8','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('URGC','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC3','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC4','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC5','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC6','3010','03');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES('VUC7','3010','03');













	         
-- Cambiar usuario en nota operatoria

             UPDATE hc_descripcion_cirugia SET usuario_id = 1117 WHERE hc_nota_operatoria_cirugia_id = 34305;
    UPDATE hc_notas_operatorias_profilaxis SET usuario_id = 1117 WHERE hc_nota_operatoria_cirugia_id = 34305;
            UPDATE hc_cultivos_quirurgicos SET usuario_id = 1117 WHERE hc_nota_operatoria_cirugia_id = 34305;
           UPDATE hc_hallazgos_quirurgicos SET usuario_id = 1117 WHERE hc_nota_operatoria_cirugia_id = 34305;
           UPDATE hc_patologia_quirurgicos SET usuario_id = 1117 WHERE hc_nota_operatoria_cirugia_id = 34305;
     UPDATE hc_notas_operatorias_cirugias SET usuario_id =  1117 WHERE hc_nota_operatoria_cirugia_id = 34305;
	  
--Query para actualizar precio de un producto en una lista de precios

UPDATE lista_precios_detalle SET precio = xxxx WHERE codigo_lista = '003' and codigo_producto= 'xxxxxx'

--Query para buscar permisos de la opciones en un modulo y a que perfil tienen este permiso

SELECT  a.system_modulo_perfil_id,
	a.modulo,
	a.opcion_permiso_nombre,
	CASE WHEN a.opcion_valor = '0' THEN 'INACTIVO'
    WHEN a.opcion_valor ='1' THEN 'ACTIVO'
    END AS permiso,
	c.descripcion		
FROM system_modulos_perfiles_opciones a,
	system_modulos_perfiles b, 
    system_perfiles c
WHERE a.system_modulo_perfil_id = b.system_modulo_perfil_id
	AND b.perfil_id = c.perfil_id
	AND a.modulo = 'AuditoriaCuentas' -- Aqui va el modulo 
	AND a.opcion_permiso_nombre = 'sw_crear_nota' -- Aqui la opcion dentro del modulo
	ORDER BY 5
	
--Query para actualizar el permiso a la opcion de un modulo	
	
UPDATE system_modulos_perfiles_opciones SET opcion_valor = '0' -- (0) para que no lo tenga, (1) para que si
WHERE system_modulo_perfil_id <> 1518
AND modulo = 'AuditoriaCuentas' -- El modulo
AND opcion_permiso_nombre = 'sw_crear_nota' -- La opcion dentro del modulo

-- Query para buscar cuentas relacionadas a un evento con valores

SELECT a.ingreso,
b.numerodecuenta,
b.total_cuenta,
b.valor_total_empresa AS total_empresa_cuentas,
e.factura_fiscal,
e.total_factura,
c.evento,
c.saldo AS saldo_soat,
c.saldo_inicial AS saldo_inicial_soat
FROM ingresos_soat a,
cuentas b,
soat_eventos c,
fac_facturas_cuentas d,
fac_facturas e, 
planes f
WHERE a.ingreso = b.ingreso
AND b.numerodecuenta = d.numerodecuenta
AND d.factura_fiscal = e.factura_fiscal
AND b.plan_id = f.plan_id
AND f.tipo_cliente = '20'
AND a.evento = c.evento
AND b.estado <> '5' 
AND e.estado <> '0'
AND c.paciente_id = '25665695'
--AND c.evento =  XXXX Usar esta linea para buscar el evento especifico, en caso de que el paciente tenga mas de un evento
ORDER BY c.evento

--Uno para consultar la cantidad
SELECT bd.codigo_producto
, cd.numerodecuenta
, cd.cargo
, cd.departamento
, bdn.bodega
, SUM (cd.cantidad)
, cd.precio
FROM cuentas_detalle cd
INNER JOIN bodegas_documentos_d bd ON (cd.consecutivo=bd.consecutivo)
INNER JOIN bodegas_doc_numeraciones bdn ON (bd.bodegas_doc_id = bdn.bodegas_doc_id)
WHERE cd.numerodecuenta=198022
AND bd.codigo_producto='0102010107'
GROUP BY 1,2,3,4,5,7
ORDER BY cd.departamento

--otro para ver la transacion

SELECT cd.transaccion
, bd.codigo_producto
, cd.numerodecuenta
, cd.cargo
, cd.departamento
, bdn.bodega
, cd.cantidad
, cd.precio
FROM cuentas_detalle cd
INNER JOIN bodegas_documentos_d bd ON (cd.consecutivo=bd.consecutivo)
INNER JOIN bodegas_doc_numeraciones bdn ON (bd.bodegas_doc_id = bdn.bodegas_doc_id)
WHERE cd.numerodecuenta=198022
AND bd.codigo_producto='0102010107'
ORDER BY cd.departamento

-- Query para buscar entre documentos generados

select a.prefijo, a.numero, a.codigo_producto, a.total_costo, b.prefijo, b.numero, b.codigo_producto, b.total_costo
from inv_bodegas_movimiento_d a,  
inv_bodegas_movimiento_d b
where a.prefijo = 'IOC' AND a.numero = 2092 
AND b.prefijo = 'EDP' AND b.numero = 68
AND a.total_costo != b.total_costo
AND a.codigo_producto = b.codigo_producto

--revisar
SELECT  a.solicitud_id,
        a.ingreso,
        a.fecha_solicitud,
        a.estacion_id,
        b.medicamento_id
        --b.cantidad,
        --a.usuario_id,
        --c.nombre AS usuario_solicito,
        --a.documento_despacho,
        --f.usuario_id,
        --e.nombre AS usuario_despacho,
        --f.fecha_registro AS fecha_despacho 
FROM hc_solicitudes_medicamentos a,
     hc_solicitudes_medicamentos_d b
     --system_usuarios c,
     --system_usuarios e,
     --bodegas_documento_despacho_ins_d d,
	 --bodegas_documento_despacho_med f
WHERE a.solicitud_id = b.solicitud_id
--AND b.consecutivo_d = d.consecutivo_solicitud
  --AND c.usuario_id = a.usuario_id
  --AND d.documento_despacho = f.documento_despacho_id
  --AND f.usuario_id = e.usuario_id
  AND a.ingreso = 191258
  AND b.medicamento_id= '0102010029'
  AND a.sw_estado =! 3
ORDER BY a.fecha_solicitud

--Query para actualizar los permisos de los componente de la estacion

UPDATE estaciones_enfermeria_usuarios_componentes 
SET  sw_permiso = '1'
--FROM estaciones_enfermeria_usuarios_componentes as x
WHERE estacion_componente_id = '18'
AND usuario_id = (
SELECT usuario_id
FROM (
            SELECT sp.usuario_id
               FROM system_usuarios_perfiles sp 
               WHERE sp.perfil_id = 1
AND sp.usuario_id = estaciones_enfermeria_usuarios_componentes.usuario_id) AS usuarios)

-- ACTUALIZAR INTERFACE A DOC EN CG MOV

UPDATE cg_mov_01.cg_mov_contable_01 SET sw_interface = 1 WHERE prefijo = 'IFR' AND numero IN (9592, 9593, 9595)

-- Crear perfil igual a otro en base a un csv

=CONCATENAR("INSERT INTO system_modulos_perfiles VALUES (DEFAULT, ";B596;", ";C596;", ";D596;", 145, ";F596;", ";G596;", ";H596;", NOW(), 610, ";K596;", NULL, ";M596;", NULL, NULL, ";P596;", ";Q596;", ";R596;", ";S596;", ";T596;", ";U596;"")


--ACTUALIZAR PERFILES FARMACIA

--Cambiar perfiles en bodegas
1. Cuentas: Habilitar Farmacia urgencias e inhabilitar farmacia central.
bodegas_usuarios
UPDATE bodegas_usuarios SET bodega = 'BF' WHERE usuario_id =3010 ; -- 'COLOCAR LA BODEGA ACTUAL' Actualizar bodegas módulo "BODEGAS EMPRESAS" == Cuentas
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
2. bodega empresa: Habilitar Farmacia urgencias e inhabilitar farmacia central.
bodegas_usuarios
UPDATE bodegas_usuarios SET bodega = 'BF' WHERE usuario_id =3010 ; -- 'COLOCAR LA BODEGA ACTUAL' Actualizar bodegas módulo "BODEGAS EMPRESAS" == Cuentas
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
3. Kardex: Habilitar Farmacia urgencias e inhabilitar farmacia central.
modulo inv_movimientos_admin
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
4. Administracion de bodega: Habilitar Farmacia urgencias e inhabilitar farmacia central.
userpermisos_solicitudes_bodegas
UPDATE userpermisos_solicitudes_bodegas SET bodega = 'BC' WHERE usuario_id =3010; -- Actualizar bodegas módulo "ADMINISTRACION DE BODEGAS"
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
5. Transaciones de bodega: Habilitar Farmacia urgencias e inhabilitar farmacia central.
inv_bodegas_userpermisos
UPDATE inv_bodegas_userpermisos SET bodega = 'BC' WHERE usuario_id =3010 ; -- Actualizar bodegas módulo "TRANSACCIONES DE BODEGAS"


-- 84 	AUX SERVICIOS FARMACEUTICO FARMACIA CENTRAL
-- 96 	AUX SERVICIOS FARMACEUTICO FARMACIA URG 	
-- 64 	AUX SERVICIOS FARMACEUTICO FARMACIA CIRUGIA

-- BODEGAS
-- BF - Farmacia Central
-- BC - Farmacia Cirugia
-- OU - Farmacia UCgencias
-- CM - ALMACEN CENTRAL DE MEZCLAS

-- Administracion de bodegas es kardex y se hace por modulo con el modulo inv_movimientos_admin


-- Perfil farmacia central 84
-- el kardex ya esta configurado en el perfil con bodega farmacia central y bodega producto terminado.
INSERT INTO userpermisos_solicitudes_bodegas VALUES('01','01',3135,'BF',nextval('userpermisos_solicitudes_bodegas_userpermiso_bodega_id_seq'::regclass));   -- Insertar bodegas módulo "ADMINISTRACION DE BODEGAS para farmacia central" bodega farmacia central
INSERT INTO userpermisos_solicitudes_bodegas VALUES('01','01',3135,'CP',nextval('userpermisos_solicitudes_bodegas_userpermiso_bodega_id_seq'::regclass));   -- Insertar bodegas módulo "ADMINISTRACION DE BODEGAS para farmacia central" bodega producto terminado
INSERT INTO bodegas_usuarios VALUES('01','01','BF',3135);                                               --Insertar bodegas módulo "BODEGAS EMPRESAS" bodega farmacia central
INSERT INTO bodegas_usuarios VALUES('01','01','CP',3135);                                               --Insertar bodegas módulo "BODEGAS EMPRESAS" bodega producto terminado
INSERT INTO inv_bodegas_userpermisos VALUES(31,'01','01','BF',3135,'0');                                --Insertar bodegas módulo "TRANSACCIONES DE BODEGAS" bodega farmacia central
INSERT INTO inv_bodegas_userpermisos VALUES(31,'01','01','CP',3135,'0');                                --Insertar bodegas módulo "TRANSACCIONES DE BODEGAS" bodega producto terminado
INSERT INTO usuarios_asigna_reportes VALUES('28', 3135, 2803, NOW());                                   --Descargo IMD Pacientes Almacen 28
INSERT INTO usuarios_asigna_reportes VALUES('122', 3135, 2803, NOW());                                  --Medicamentos Alto Costo 122
INSERT INTO usuarios_asigna_reportes VALUES('124', 3135, 2803, NOW());                                  --Medicamentos Controlados 124
INSERT INTO usuarios_asigna_reportes VALUES('241', 3135, 2803, NOW());                                  --Consolidado Existencias Farmacia Central 241

2972 nadgutbe	NADUAR SOFIA GUTIERREZ BENITEZ
Bodegas
  Farmacia cirugia
  Control lote
  Home care



-- Administracion de bodegas es kardex y se hace por modulo con el modulo inv_movimientos_admin ya esta configurado por el perfil
UPDATE userpermisos_solicitudes_bodegas SET bodega = 'BF' WHERE usuario_id =883 AND bodega = 'BC';     -- Actualizar bodegas módulo "ADMINISTRACION DE BODEGAS"
UPDATE bodegas_usuarios SET bodega = 'BF' WHERE usuario_id =883 AND bodega = 'BC';                     --'COLOCAR LA BODEGA ACTUAL' Actualizar bodegas módulo "BODEGAS EMPRESAS" == Cuentas
INSERT INTO usuarios_asigna_reportes VALUES('28', 883, 2803, NOW());                                   --Descargo IMD Pacientes Almacen 28
INSERT INTO usuarios_asigna_reportes VALUES('122', 883, 2803, NOW());                                  --Medicamentos Alto Costo 122
INSERT INTO usuarios_asigna_reportes VALUES('124', 883, 2803, NOW());                                  --Medicamentos Controlados 124
INSERT INTO usuarios_asigna_reportes VALUES('241', 883, 2803, NOW());                                  --Consolidado Existencias Farmacia Central 241
INSERT INTO inv_bodegas_userpermisos VALUES(31,'01','01','BF',883,'0');                                --Insertar bodegas módulo "TRANSACCIONES DE BODEGAS" DOC-TRASLADO
INSERT INTO inv_bodegas_userpermisos VALUES(31,'01','01','CP',883,'0');                                --Insertar bodegas módulo "TRANSACCIONES DE BODEGAS" DOC-TRASLADO




--ALTER TABLE userpermisos_solicitudes_bodegas DISABLE TRIGGER validacion_bodega;        
UPDATE system_usuarios_perfiles SET perfil_id=64 WHERE usuario_id = 3010; -- Actualizar perfil usuario
UPDATE userpermisos_solicitudes_bodegas SET bodega = 'BC' WHERE usuario_id =3010; -- Actualizar bodegas módulo "ADMINISTRACION DE BODEGAS"
UPDATE inv_bodegas_userpermisos SET bodega = 'BC' WHERE usuario_id =3010; -- Actualizar bodegas módulo "TRANSACCIONES DE BODEGAS"
UPDATE bodegas_usuarios SET bodega = 'BC' WHERE usuario_id =3010 ; -- 'COLOCAR LA BODEGA ACTUAL' Actualizar bodegas módulo "BODEGAS EMPRESAS" == Cuentas
--	ALTER TABLE userpermisos_solicitudes_bodegas ENABLE TRIGGER validacion_bodega;

--CREAR USUARIO NUEVO EN FARMACIA
--INSERT INTO system_usuarios_perfiles VALUES(84,'01',2475);
INSERT INTO system_usuarios_vars values (3010,'LimitRowsBrowser','100');
INSERT INTO userpermisos_solicitudes_bodegas VALUES('01','01',3010,'BF',nextval('userpermisos_solicitudes_bodegas_userpermiso_bodega_id_seq'::regclass)); --Insertar bodegas módulo "ADMINISTRACION DE BODEGAS"
INSERT INTO userpermisos_solicitudes_bodegas VALUES('01','01',3010,'CP',nextval('userpermisos_solicitudes_bodegas_userpermiso_bodega_id_seq'::regclass)); --Insertar bodegas módulo "ADMINISTRACION DE BODEGAS" - Almacen central de mezclas
INSERT INTO inv_bodegas_userpermisos VALUES(31,'01','01','BF',3010,'0'); --Insertar bodegas módulo "TRANSACCIONES DE BODEGAS" DOC-TRASLADO
INSERT INTO bodegas_usuarios VALUES('01','01','BF',3010);--Insertar bodegas módulo "BODEGAS EMPRESAS"
INSERT INTO inv_bodegas_userpermisos VALUES(31,'01','01','CL',3010,'0');
INSERT INTO bodegas_usuarios VALUES('01','01','CL',3010);
																

                                --bodega empresas y cuentas es lo mismo, si se inserta en uno queda en los dos
INSERT INTO system_usuarios_vars                  VALUES (3010,'LimitRowsBrowser','100');
INSERT INTO userpermisos_solicitudes_bodegas      VALUES('01','01',3010,'BF',nextval('userpermisos_solicitudes_bodegas_userpermiso_bodega_id_seq'::regclass)); --Insertar bodegas módulo "ADMINISTRACION DE BODEGAS"
INSERT INTO userpermisos_solicitudes_bodegas      VALUES('01','01',3010,'CP',nextval('userpermisos_solicitudes_bodegas_userpermiso_bodega_id_seq'::regclass)); --Insertar bodegas módulo "ADMINISTRACION DE BODEGAS" - Almacen central de mezclas
INSERT INTO inv_bodegas_userpermisos              VALUES(31,'01','01','BF',3010,'0'); --Insertar bodegas módulo "TRANSACCIONES DE BODEGAS" DOC-TRASLADO
INSERT INTO bodegas_usuarios                      VALUES('01','01','BF',3010);--Insertar bodegas módulo "BODEGAS EMPRESAS"
INSERT INTO inv_bodegas_userpermisos              VALUES(31,'01','01','CL',3010,'0'); --Insertar bodegas módulo "TRANSACCIONES DE BODEGAS" DOC-TRASLADO
INSERT INTO bodegas_usuarios                      VALUES('01','01','CL',3010);--Insertar bodegas módulo "BODEGAS EMPRESAS"
INSERT INTO inv_bodegas_userpermisos              VALUES(31,'01','01','CP',3010,'0'); --Insertar bodegas módulo "TRANSACCIONES DE BODEGAS" DOC-TRASLADO
INSERT INTO bodegas_usuarios                      VALUES('01','01','CP',3010);--Insertar bodegas módulo "BODEGAS EMPRESAS"

INSERT INTO inv_bodegas_userpermisos VALUES(31,'01','01','BF',3010,'0'); --Insertar bodegas módulo "TRANSACCIONES DE BODEGAS" DOC-TRASLADO
INSERT INTO inv_bodegas_userpermisos VALUES(31,'01','01','CP',3010,'0'); --Insertar bodegas módulo "TRANSACCIONES DE BODEGAS" DOC-TRASLADO


INSERT INTO inv_bodegas_userpermisos VALUES(24,'01','01','BF',3010,'0');
INSERT INTO inv_bodegas_userpermisos VALUES(31,'01','01','BF',3010,'0');
INSERT INTO inv_bodegas_userpermisos VALUES(29,'01','01','CP',3010,'0');

INSERT INTO inv_bodegas_userpermisos VALUES(31,'01','01','BF',3010,'0'); --Insertar bodegas módulo "TRANSACCIONES DE BODEGAS" DOC-TRASLADO - BODEGA LABORATORIO





			  
-- INSERTAR permisos en reportes cv

INSERT INTO usuarios_asigna_reportes VALUES( 	 3	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 5	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 7	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 8	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 9	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 20	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 21	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 22	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 23	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 24	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 25	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 26	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 27	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 31	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 32	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 33	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 34	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 57	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 58	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 59	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 60	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 62	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 63	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 64	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 65	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 66	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 67	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 68	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 72	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 79	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 80	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 81	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 84	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 96	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 99	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 103	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 106	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 107	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 108	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 109	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 115	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 117	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 118	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 119	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 120	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 126	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 135	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 142	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 145	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 148	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 151	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 172	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 208	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 210	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 220	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 250	,3010,3010,now()); 
INSERT INTO usuarios_asigna_reportes VALUES( 	 268	,3010,3010,now()); 








			  
			  
			  
-Programa para generación de recargos de turnos en SIIS.

INSERT INTO turnos_profesionales_alterno (fecha,identificacion,nombre,tipo_turno_id,fecha_registro,usuario_registro) VALUES ('1/12/2020','1182448284','JEFFERSON SANABRIA CURVELO',9,now(),2);


--Transaciones de bogega
insert into inv_bodegas_userpermisos values ('22','01','01','CM',3010,'0');
insert into inv_bodegas_userpermisos values ('24','01','01','CM',3010,'0');
insert into inv_bodegas_userpermisos values ('26','01','01','CM',3010,'0');
insert into inv_bodegas_userpermisos values ('29','01','01','CM',3010,'0');
insert into inv_bodegas_userpermisos values ('31','01','01','CM',3010,'0');
insert into inv_bodegas_userpermisos values ('31','01','01','CP',3010,'0');


--Transaciones de bogega
insert into inv_bodegas_userpermisos values ('17','01','01','F3',2803,'1');
insert into inv_bodegas_userpermisos values ('18','01','01','F3',2803,'1');
insert into inv_bodegas_userpermisos values ('19','01','01','F3',2803,'1');
insert into inv_bodegas_userpermisos values ('20','01','01','F3',2803,'1');
insert into inv_bodegas_userpermisos values ('21','01','01','F3',2803,'1');
insert into inv_bodegas_userpermisos values ('23','01','01','F3',2803,'1');
insert into inv_bodegas_userpermisos values ('24','01','01','F3',2803,'1');
insert into inv_bodegas_userpermisos values ('26','01','01','F3',2803,'1');
insert into inv_bodegas_userpermisos values ('27','01','01','F3',2803,'1');
insert into inv_bodegas_userpermisos values ('29','01','01','F3',2803,'1');
insert into inv_bodegas_userpermisos values ('30','01','01','F3',2803,'1');
insert into inv_bodegas_userpermisos values ('31','01','01','F3',2803,'1');

--Reportes
INSERT INTO usuarios_asigna_reportes  VALUES(54,3010,3010,now()); -- INSERTA REPORTE Existencias Actuales
INSERT INTO usuarios_asigna_reportes  VALUES(55,3010,3010,now()); -- INSERTA REPORTE Existencias Bodegas
INSERT INTO usuarios_asigna_reportes  VALUES(56,3010,3010,now()); -- INSERTA REPORTE Existencias Farmacia
INSERT INTO usuarios_asigna_reportes  VALUES(122,3010,3010,now()); -- INSERTA REPORTE Existencias Actuales
INSERT INTO usuarios_asigna_reportes  VALUES(123,3010,3010,now()); -- INSERTA REPORTE Existencias Bodegas
INSERT INTO usuarios_asigna_reportes  VALUES(124,3010,3010,now()); -- INSERTA REPORTE Existencias Farmacia
INSERT INTO usuarios_asigna_reportes  VALUES(207,3010,3010,now()); -- INSERTA REPORTE Existencias Farmacia
			  
https://asistencial.clinicacristorey.com.co/SIIS_CR/programas/calculo_recargo_turnos_alterno.php	



insert into bodegas_usuarios values ('01','01','PM',3010);
insert into bodegas_usuarios values ('01','01','CL',3010);
insert into bodegas_usuarios values ('01','01','CF',3010);
insert into bodegas_usuarios values ('01','01','CE',3010);
insert into bodegas_usuarios values ('01','01','AC',3010);
insert into bodegas_usuarios values ('01','01','BA',3010);
insert into bodegas_usuarios values ('01','01','SG',3010);
insert into bodegas_usuarios values ('01','01','AF',3010);
insert into bodegas_usuarios values ('01','01','GH',3010);
insert into bodegas_usuarios values ('01','01','TI',3010);
insert into bodegas_usuarios values ('01','01','SS',3010);
insert into bodegas_usuarios values ('01','01','CM',3010);
insert into bodegas_usuarios values ('01','01','MC',3010);
insert into bodegas_usuarios values ('01','01','BP',3010);
insert into bodegas_usuarios values ('01','01','LA',3010);
insert into bodegas_usuarios values ('01','01','BI',3010);
insert into bodegas_usuarios values ('01','01','BF',3010);
insert into bodegas_usuarios values ('01','01','OU',3010);
insert into bodegas_usuarios values ('01','01','BO',3010);
insert into bodegas_usuarios values ('01','01','BF',3010);
insert into bodegas_usuarios values ('01','01','MO',3010);
insert into bodegas_usuarios values ('01','01','AN',3010);
insert into bodegas_usuarios values ('01','01','HE',3010);
insert into bodegas_usuarios values ('01','01','SP',3010);
insert into bodegas_usuarios values ('01','01','TR',3010);
insert into bodegas_usuarios values ('01','01','RP',3010);
insert into bodegas_usuarios values ('01','01','TM',3010);
insert into bodegas_usuarios values ('01','01','JJ',3010);
insert into bodegas_usuarios values ('01','01','LB',3010);
insert into bodegas_usuarios values ('01','01','CP',3010);
insert into bodegas_usuarios values ('01','01','AP',3010);
insert into bodegas_usuarios values ('01','01','CI',3010);
insert into bodegas_usuarios values ('01','01','CT',3010);
insert into bodegas_usuarios values ('01','01','LH',3010);
insert into bodegas_usuarios values ('01','01','BT',3010);
insert into bodegas_usuarios values ('01','01','MR',3010);
insert into bodegas_usuarios values ('01','01','MD',3010);
insert into bodegas_usuarios values ('01','01','EC',3010);
insert into bodegas_usuarios values ('01','01','GT',3010);
insert into bodegas_usuarios values ('01','01','GB',3010);
		  
insert into bodegas_usuarios values ('01','01','CP',3010);
insert into bodegas_usuarios values ('01','01','BC',3010);
insert into bodegas_usuarios values ('01','01','BO',3010);
insert into bodegas_usuarios values ('01','01','BF',3010);
insert into bodegas_usuarios values ('01','01','OU',3010);
insert into bodegas_usuarios values ('01','01','NP',3010);
insert into bodegas_usuarios values ('01','01','ME',3010);
insert into bodegas_usuarios values ('01','01','AB',3010);
insert into bodegas_usuarios values ('01','01','MN',3010);
insert into bodegas_usuarios values ('01','01','RS',3010);
insert into bodegas_usuarios values ('01','01','CM',3010);
insert into bodegas_usuarios values ('01','01','PP',3010);
insert into bodegas_usuarios values ('01','01','BI',3010);

		
----------DOCUMENTOS A BODEGA

INSERT INTO inv_bodegas_documentos VALUES(16,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(17,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(18,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(19,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(20,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(21,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(22,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(23,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(24,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(25,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(26,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(27,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(28,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(29,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(30,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(31,'01','01','HC',DEFAULT,'1');
INSERT INTO inv_bodegas_documentos VALUES(50,'01','01','HC',DEFAULT,'1');
,CP[fk]BC[fk]BO[fk]BF[fk]OU[fk]NP[fk]ME[fk]AB[fk]MN[fk]RS[fk]CM[fk]PP[fk]BI

																
--INSERTAR USUARIO EN CONTROL CUENTAS - ASIGNARLO A DEPTO
--Departamentos
/*
ADMURG	Admisiones urgencias
FACURG	Facturación Urgencias
FACIMA	Facturación Imágenes
FACTP3	Facturación piso 3
FACTP4	Facturación piso 4
FACTP5	Facturación piso 5
FAUCI3	Facturación UCI 3 - 4
FACIRU	Facturación Cirugía
FACCNT	Facturación central
AUDCTA	Auditoria cuentas médicas
FACAUD	Facturación Auditoria
FACCEX	Facturación consulta externa
COBRZA	Cobranza
COOFAC	Coordinación de facturación
CONCTA	Control cuentas
FACTP6	Facturación piso 6
GLODEV	Radicacion Adres
GRUPO1	Grupo 1 Auditoria Glosas y Dev
GRUPO3	Grupo 3 Auditoria Glosas y Dev
GRUPO2	Grupo 2 Auditoria Glosas y Dev
GDES	Gestion documental y Estadisitica
AUDCCT	Auditoria Concurrente
JURIDI	Juridico
FAUCI5	Facturación UCI 5 - 6
FACLAB	Facturacion Laboratorio
INVGLO	Inventario Glosas Dev
INVFAC	Inventario Cuentas Facts
AUTORI	Autorizaciones
AUDDFA	AUDITORIA DFA
DEVNES	Devoluciones
*/

3155

--Creacion de usuario promedio de Control Cuentas
--antes de esto ya debe estar creado en system_usuarios_departamentos_cc con su respectivo departamento.
INSERT INTO usuarios_menu_prosi VALUES(3155,2,'1','0','0','1','1');
INSERT INTO usuarios_menu_prosi VALUES(3155,3,'0','1','0','1','0');
INSERT INTO usuarios_menu_prosi VALUES(3155,6,'0','0','0','1','1');


--Eliminar usuario de control cuentas
DELETE 
FROM system_usuarios_departamentos_cc
WHERE usuario_id=2750

--INSERTAR permisos a usuario en reportes de control cuentas

INSERT INTO system_usuarios_departamentos_cc VALUES(nextval('system_usuarios_departamentos_cc_id_seq'::regclass),3051,'COOFAC',now(),3010,'1');
INSERT INTO system_usuarios_departamentos_cc VALUES(nextval('system_usuarios_departamentos_cc_id_seq'::regclass),3051,'FACURG',now(),3010,'1');
INSERT INTO system_usuarios_departamentos_cc VALUES(nextval('system_usuarios_departamentos_cc_id_seq'::regclass),3051,'FACIRU',now(),3010,'1');
INSERT INTO system_usuarios_departamentos_cc VALUES(nextval('system_usuarios_departamentos_cc_id_seq'::regclass),3051,'DEVNES',now(),3010,'1');
INSERT INTO system_usuarios_departamentos_cc VALUES(nextval('system_usuarios_departamentos_cc_id_seq'::regclass),3051,'FACOEX',now(),3010,'1');
INSERT INTO system_usuarios_departamentos_cc VALUES(nextval('system_usuarios_departamentos_cc_id_seq'::regclass),3051,'FACEUR',now(),3010,'1');
INSERT INTO system_usuarios_departamentos_cc VALUES(nextval('system_usuarios_departamentos_cc_id_seq'::regclass),3051,'FACCNT',now(),3010,'1');











-- Query para obtener los todos los permisos a las opciones de un modulo para un perfil 

SELECT a.*, b.departamento, b.tipo_caja, b.grupo_departamento_id
FROM system_modulos_perfiles_opciones a,
system_modulos_perfiles b
WHERE a.system_modulo_perfil_id = b.system_modulo_perfil_id
AND b.perfil_id = 100 -- Perfil a copia
ORDER BY a.system_modulo_perfil_id

--Query para traer el id del permisos a los modulos

SELECT b.system_modulo_perfil_id
FROM system_modulos_perfiles_opciones a,
system_modulos_perfiles b
WHERE a.system_modulo_perfil_id = b.system_modulo_perfil_id
AND a.modulo = b.modulo
AND b.modulo = 'Glosas'
AND b.perfil_id = 100
GROUP BY b.system_modulo_perfil_id

--Query para actualizar estado de relacion de cuentas



--Query para buscar evolucion de un profesional en sub-modulos

SELECT a.* 
FROM hc_evoluciones_submodulos a, 
hc_evoluciones b,
ingresos c
WHERE a.evolucion_id = b.evolucion_id 
AND b.ingreso = c.ingreso
AND b.usuario_id = 1134 -- ID del usuario profesional
AND c.paciente_id = '66921660' -- identificacion del paciente

select b.descripcion
from system_usuarios a, 
system_perfiles b,
system_usuarios_perfiles c
where a.usuario_id = c.usuario_id
and c.perfil_id = b.perfil_id
and a.usuario_id IN (498, 1141, 1138, 1144)

--Consulta para traer cargos de respuesta de glosa

SELECT c.glosa_respuesta_cargo_id, 
e.cargo, 
a.glosa_id
FROM glosas a,
glosas_respuestas b,
glosas_respuestas_cargos c,
glosas_detalle_cargos d,
cuentas_detalle e
WHERE a.glosa_id = b.glosa_id
AND b.glosa_respuesta_id = c.glosa_respuesta_id
AND c.glosa_detalle_cargo_id = d.glosa_detalle_cargo_id
AND d.transaccion = e.transaccion
AND a.sw_estado NOT IN ('0','3')
AND a.factura_fiscal = 55189 --Numero de la factura
AND e.cargo IN ('39118', '39118', '39121', '39124', '39209') --Cargos de la respuesta a buscar

--Consulta para traer cargos de la ultima respuesta
SELECT c.glosa_respuesta_cargo_id, 
e.cargo, 
a.glosa_id,
b.glosa_respuesta_id
FROM glosas a,
glosas_respuestas b,
glosas_respuestas_cargos c,
glosas_detalle_cargos d,
cuentas_detalle e
WHERE a.glosa_id = b.glosa_id
AND b.glosa_respuesta_id = c.glosa_respuesta_id
AND c.glosa_detalle_cargo_id = d.glosa_detalle_cargo_id
AND d.transaccion = e.transaccion
AND a.sw_estado NOT IN ('0','3')
AND a.factura_fiscal = 16882
AND b.glosa_respuesta_id = (SELECT MAX (f.glosa_respuesta_id) FROM glosas_respuestas as f WHERE a.glosa_id=f.glosa_id)--consulta la ultima respuesta
AND e.cargo IN ('21101', '21102', '21105', '21106', '21201') --Cargos de la respuesta a buscar

-- Numerador de perfiles

SELECT   ROW_NUMBER() OVER(ORDER BY perfil_id) AS cantidad_perfiles, *
FROM system_perfiles

-- Remplazar un dato por otro

update system_perfiles set descripcion = REPLACE(descripcion,'_',' ')

--modificar fecha a ingreso pacientes del 26 oct
--=CONCATENAR("update ingresos set fecha_ingreso='";F5;"' where ingreso=";C5;";")
update ingresos set fecha_ingreso='2018-10-26 11:37:00' where ingreso=97977;


-- Actualiza interface en cg_mov_01
SELECT * FROM
UPDATE cg_mov_01.cg_mov_contable_01
SET sw_interface='1'
WHERE prefijo='ECI' AND numero IN('3321',
'1076',
'7720',
'7722',
'7724',
'7727',
'7731',
'3245')

--Query para ver cargos en cuentas de cirugia

SELECT a.numerodecuenta, 
c.ingreso, 
p.tipo_id_paciente, 
p.paciente_id, 
a.departamento, 
f.descripcion, 
a.cargo, 
a.cantidad, 
a.precio, 
d.codigo_producto, 
d.descripcion, 
a.fecha_cargo AS fecha_cargo_producto, 
d.referencia AS Cod_Casa_Medica 
FROM cuentas_detalle a, 
bodegas_documentos_d b, 
cuentas c, 
inventarios_productos d, 
departamentos f, 
ingresos g, 
pacientes p 
WHERE a.numerodecuenta=c.numerodecuenta 
AND a.consecutivo=b.consecutivo 
AND b.codigo_producto=d.codigo_producto 
AND a.departamento=f.departamento 
AND c.ingreso = g.ingreso 
AND p.tipo_id_paciente=g.tipo_id_paciente 
AND p.paciente_id=g.paciente_id 
AND d.grupo_id='03' 
AND c.estado!= '5' 
AND a.fecha_cargo::date BETWEEN '2018-09-01' AND '2018-10-31' 
ORDER BY a.numerodecuenta

--ver un medicamento en detalle de la cuenta
SELECT cd.*
FROM  bodegas_documentos_d bd
INNER JOIN cuentas_detalle cd ON cd.consecutivo=bd.consecutivo
WHERE cd.numerodecuenta=217576
AND bd.codigo_producto='0201010542'
AND cd.cargo IN('IMD','DIMD')
ORDER BY cd.cargo, cd.departamento

--Activar productos especificos en una orden de compra
UPDATE compras_requisiciones_detalle SET estado='1' WHERE requisicion_id=4803 
AND codigo_producto IN('0503020010',
'0503020009',
'0503020007',
'0503020017',
'0503010032',
'0503010019',
'0518050010')

-- Cambiar plan de solicitudes
UPDATE hc_os_solicitudes SET plan_id=207
WHERE hc_os_solicitud_id IN(745647, 745648, 746870, 746875, 746891, 746900)

-------------------------------------------parametrizacion por grupos
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41750501' WHERE centro_de_costo_id='01010102';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41751001' WHERE centro_de_costo_id='01010112';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41751001' WHERE centro_de_costo_id='01010122';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41751501' WHERE centro_de_costo_id='01010106';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41751501' WHERE centro_de_costo_id='01010107';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41751501' WHERE centro_de_costo_id='01010108';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41752001' WHERE centro_de_costo_id='01010118';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41752501' WHERE centro_de_costo_id='01010103';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41752501' WHERE centro_de_costo_id='01010116';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41752501' WHERE centro_de_costo_id='01010117';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41752501' WHERE centro_de_costo_id='01010109';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41752501' WHERE centro_de_costo_id='01010118';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41753001' WHERE centro_de_costo_id='01010119';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41753001' WHERE centro_de_costo_id='01010114';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41757001' WHERE centro_de_costo_id='01010101';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41757001' WHERE centro_de_costo_id='01010105';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41757001' WHERE centro_de_costo_id='01010111';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41757001' WHERE centro_de_costo_id='01010113';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41757001' WHERE centro_de_costo_id='01010110';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41757001' WHERE centro_de_costo_id='01010120';
UPDATE cg_conf.doc_fv01_inv_grupos_productos_por_cc SET cuenta_glosa='41757001' WHERE centro_de_costo_id='01010121';
UPDATE cg_conf.doc_fv01_cargos_por_cc SET cuenta_glosa='41751001' WHERE centro_de_costo_id='01010112' AND tarifario_id='0007';

																	                                             
--Modificar TRIGGERS
ALTER TABLE nombre_tabla DISABLE TRIGGER nombre_trigger;

update nombre_tabla set nombre_campo=valor where nombre_campo_condicion= valor ;    



      

ALTER TABLE nombre_tabla ENABLE TRIGGER nombre_trigger;    

--MODIFICAR FECHA DE INGRESO Y CUENTA PARA LOS INGRESOS POR ADMISIONES SIN HC
UPDATE cuentas SET fecha_registro='2019-03-06 08:29:00' WHERE numerodecuenta IN(XXXX,
XXXX);

ALTER TABLE cuentas_detalle DISABLE TRIGGER cuentas_contro_modificacion;
UPDATE cuentas_detalle SET fecha_cargo='2019-03-06 08:29:00' WHERE numerodecuenta IN(XXXX,
XXXX);
ALTER TABLE cuentas_detalle ENABLE TRIGGER cuentas_contro_modificacion;

UPDATE ingresos SET fecha_ingreso='2019-03-06 08:29:00', fecha_registro='2019-03-06 08:29:00' WHERE ingreso IN(XXXX,
XXXX);

--busca las citas asignadas a un profesional 
SELECT 
ac.agenda_cita_id, 
ac.sw_estado, 
ac.hora, 
aga.tipo_id_paciente, 
aga.paciente_id, 
p.primer_nombre||' '||p.segundo_nombre||' '||p.primer_apellido||' '||p.segundo_apellido AS nombre, 
aga.fecha_registro AS registro, 
aga.fecha_deseada::date
FROM agenda_citas_asignadas aga
INNER JOIN agenda_citas ac ON aga.agenda_cita_id=ac.agenda_cita_id
INNER JOIN pacientes p ON p.tipo_id_paciente=aga.tipo_id_paciente AND p.paciente_id=aga.paciente_id
INNER JOIN agenda_turnos agt ON agt.agenda_turno_id=ac.agenda_turno_id
WHERE agt.agenda_turno_id IN(
11264,
11280,
11360,
11358,
11359) AND agt.profesional_id='16918366'
ORDER BY 2

--CANCELA LAS CITAS
UPDATE agenda_citas SET sw_estado='3' WHERE agenda_cita_id IN(
202378, 
202379, 
202380, 
203010, 
202382, 
202383, 
202384, 
202385, 
202386, 
202387, 
202388, 
202389)

---------------actualiza valores
UPDATE glosas SET valor_pendiente = valor_no_aceptado 
WHERE glosa_id IN 
				(SELECT a.glosa_id
					FROM actas_conciliacion_glosas_detalle a
					WHERE a.acta_conciliacion_id = 592)


------ELIMINAR DOCUMENTOS UNO E
DELETE FROM cg_mov_contable WHERE prefijo='CGL' AND numero=10;
DELETE FROM cg_mov_contable_01_detalle WHERE documento_contable_id=376011;


DELETE FROM cg_mov_01.cg_mov_contable_01_detalle WHERE documento_contable_id= 768726;


----contabilidad
delete from cg_mov_01.cg_mov_contable_01_detalle where documento_contable_id=394299


--ELIMINAR RESPUESTA GLOSA IPS
DELETE FROM glosas_respuestas_cargos WHERE glosa_respuesta_id=262837;
DELETE FROM glosas_respuestas_inventarios WHERE glosa_respuesta_id=262837;
DELETE FROM glosas_respuestas_cuentas WHERE glosa_respuesta_id=262837;
--EPS
DELETE FROM glosas_respuestas_eps_cargos WHERE glosa_respuesta_eps_id=119659;
DELETE FROM glosas_respuestas_eps_inventarios WHERE glosa_respuesta_eps_id=119659;
DELETE FROM glosas_respuestas_eps_cuentas WHERE glosa_respuesta_eps_id=119659;

DELETE FROM glosas_respuestas_eps WHERE glosa_id=55369;58554
--GLOS
DELETE FROM glosas_respuestas WHERE glosa_id=61329;
UPDATE glosas SET valor_aceptado=0.00, sw_estado='1', valor_no_aceptado=0.00, valor_pendiente=valor_glosa WHERE glosa_id=61329

--INSUMOS MEDICOS
SELECT estado AS Activo, codigo_producto, descripcion, sw_pos FROM inventarios_productos WHERE grupo_id='02' AND clase_id='01' AND suBFlase_id='01'
UPDATE inventarios_producCos SET sw_pos='1' WHERE grupo_id='02' AND clase_id='01' AND suBFlase_id='01' AND sw_pos='0'

--Buscar Ciagnostico de INGRESO
SELECT * FROM hc_diagnosticos_ingreso WHERE evolucion_id IN (SELECT hes.evolucion_id FROM hc_evoluciones_submodulos 
hes INNER JOIN hc_diagnosticos_ingreso hdi ON hdi.evolucion_id=hes.evolucion_id WHERE ingreso=XXXX AND 
submodulo='DiagnosticoI');

--insertar cuando tiene un registro
INSERT INTO ingresos_soat VALUES(22,27) ON CONFLICT(ingreso) DO NOTHING; --ingreso ya esta omite el registro
INSERT INTO ingresos_soat VALUES(25,2) ON CONFLICT(ingreso) DO NOTHING; --ingreso ya esta omite el registro
INSERT INTO ingresos_soat VALUES(21,27) ON CONFLICT(ingreso) DO NOTHING; --ingreso no esta lo ingresa
--se deben de tener en cuenta todas las primarias en el parentesis del conflict

--otro ejemplo
INSERT INTO cg_conf.doc_fv01_inv_grupos_productos_por_cc 
VALUES (
'01'
,'18'
,'01'
,'06'
,(select centro_de_costo_id from cg_conf.centros_de_costo_departamentos where departamento = 'HM1118')
,'41309020'
,'C'
,(select centro_de_costo_id from cg_conf.centros_de_costo_departamentos where departamento = 'HM1118')) 
ON CONFLICT (empresa_id,grupo_id,clase_id,suBFlase_id,centro_de_costo_id) 
DO UPDATECSET centro_costo_destino = 
(select centro_de_costo_id from cg_conf.centros_de_costo_departamentos where departamento = 'HM1118');

--usuarios BD
SELECT u.usename AS "Role name",
  CASE WHEN u.usesuper AND u.usecreatedb THEN CAST('superuser, create
database' AS pg_catalog.text)
       WHEN u.usesuper THEN CAST('superuser' AS pg_catalog.text)
       WHEN u.usecreatedb THEN CAST('create database' AS
pg_catalog.text)
       ELSE CAST('' AS pg_catalog.text)
  END AS "Attributes"
FROM pg_catalog.pg_user u
ORDER BY 1;

---Query para buscar los planes de las facturas
SELECT FAC.prefijo, FAC.factura_fiscal, CUE.numerodecuenta,  CUE.plan_id
PLA.plan_descripcion
FROM fac_facturas_cuentas FAC, cuentas CUE, planes PLA
WHERE 
FAC.numerodecuenta=CUE.numerodecuenta
AND CUE.plan_id=PLA.plan_id
AND factura_fiscal IN(40537)



INSERT INTO 

------TEMPERATURA
INSERT INTO inv_tipos_medidas_equipos VALUES (21,'02',45.0000,70.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (21,'01',10.0000,30.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (22,'02',45.0000,70.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (22,'01',10.0000,30.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (23,'02',45.0000,70.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (23,'01',10.0000,30.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (24,'02',45.0000,70.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (24,'01',10.0000,30.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (25,'02',45.0000,70.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (25,'01',10.0000,30.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (26,'02',45.0000,70.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (26,'01',10.0000,30.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (27,'02',45.0000,70.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (27,'01',10.0000,30.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (28,'02',45.0000,70.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (28,'01',10.0000,30.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (29,'02',45.0000,70.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (29,'01',10.0000,30.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (30,'02',45.0000,70.0000);
INSERT INTO inv_tipos_medidas_equipos VALUES (30,'01',10.0000,30.0000);

----CODIGO INVIMA

UPDATE inventarios_productos SET codigo_invima IN 
('2012DM-0008870',
'2012DM-0008870',
'2012DM-0008870',
'2012DM-0008870',
'2007DM-0001053',
'2017DM-0017400',
'2014DM-0002401-R1',
'2014DM-0002401-R1',
'2014DM-0002401-R1')  
WHERE codigo_producto IN 
('0301090319',
'0301090351',
'0301140052',
'0301140053',
'0301140610',
'0301130019',
'0301010001',
'0301010002',
'0301010003')



-----Tabla Cups
UPDATE cups SET bys_producto_id='85101505' WHERE cargo IN (
'399602',
'890112',
'890212',
'890312',
'891812',
'890612',
'893810',
'939000',
'939100',
'939300',
'939401',
'939402',
'939403',
'939500',
'939601',
'939700',
'939800')


SELECT 
bd.codigo_producto,
bd.cantidad,
bd.total_costo
FROM
bodegas_documentos_d bd,
cuentas_detalle,
WHERE
FAC.numerodecuenta=CUE.numerodecuenta
AND CUE.plan_id=PLA.plan_id
AND factura_fiscal IN(40537)

........
Update precios unitarios en inv_bodegas_movimiento_d


UPDATE inv_bodegas_movimiento_d SET total_costo = 3439 
WHERE prefijo='TA' 
AND codigo_producto = '0201010328' 
AND numero IN(
    48253, 
    48944,
    48063,
    49069,
    48208,
    48580,
    48294,
    47985,
    48148,
    48942,
    49601,
    49569,
    49645,
    430512
)

SELECT * FROM inv_bodegas_movimiento_d
WHERE prefijo='TA' 
AND codigo_producto = '0201010328' 
AND numero IN(
    48253,
    48944,
    48063,
    49069,
    48208,
    48580,
    48294,
    47985,
    48148,
    48942,
    49601,
    49569,
    49645,
    430512
    )


_______________________________________________________________________________________________

_______________________________________________________________________________________________

Asociar cuentas a eventos

seleccionar los ingresos de las cuentas
SELECT ingreso FROM  cuentas WHERE numerodecuenta IN (
lista de cuentas
)

con este verificamos si estos eventos estan para el mismo paciente

SELECT cuentas.ingreso , ingresos.paciente_id FROM  cuentas , ingresos WHERE cuentas.ingreso=ingresos.ingreso AND  numerodecuenta IN (
lista de cuentas
)

con lo que resulto del select anterior se busca cuales ingresos ya tienen evento asociado para hacer update
SELECT * FROM  ingresos_soat WHERE ingreso IN (
lista de ingresos
)

Estos son los ingresos que ya estan creado, para hacerle update al evento
lista de impuestos que aparecieron en el anterior select

UPDATE ingresos_soat SET evento=evento solicitado WHERE ingreso=lista de ingresos ya creados;
=CONCATENAR("UPDATE ingresos_soat SET evento=";B2 ;" WHERE ingreso=";A2;";")

se seleccionan los ingresos que aun no han sido creados y se crea el insert
INSERT INTO ingresos_soat(ingreso , evento) VALUES (numero_ingreso , numero_evento)
=CONCATENAR("INSERT INTO ingresos_soat(ingreso, evento) VALUES ("; A18;","; B18; ");")



INSERT INTO userpermisos_caja_anulaciones(caja_id, usuario_id) VALUES(1, 3010)




SELECT * FROM inventarios WHERE codigo_producto IN('0201010328', '0201010202', '0201011545')

320 7954560



Facturacion Central Consulta Externa
facecoex
FACOEX

Facturacion Central Urgencias
faceur
FACEUR


pruebas con rayos x portatil






UPDATE inv_bodegas_movimiento_d 
SET porcentaje_gravamen = '0'
WHERE prefijo='IPR' AND numero='31564'






________________________________________________________________________

________________________________________________________________________

SELECT o.pid_id as identificacion, 
o.pid_first_name as Nombres_paciente, 
o.pid_last_name as Apellidos_paciente, 
o.obr_procedure_start_date as fecha_solicitud, 
o.obr_procedure_code as codigo_examen, 
o.obr_exam_reason as descripcion_procedimiento, 
b.fecha_solicitud as fecha_solicitud_medico,
i.departamento, i.ingreso, rd.obr_results_date as fecha_resultado
FROM ingresos i,
interface_imagenes.order_request o
LEFT JOIN interface_imagenes.report_data rd ON (o.orc_order_id = rd.orc_order_id)
INNER JOIN os_maestro a ON (a.numero_orden_id = CAST(o.orc_order_id as INT))
INNER JOIN hc_os_solicitudes b ON (a.hc_os_solicitud_id = b.hc_os_solicitud_id)
WHERE i.ingreso = CAST(o.pv1_visit_id as INT)
AND o.obr_procedure_start_date::date BETWEEN '2021-01-01' AND '2022-03-16' 
ORDER BY 4

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------TOMA FISICA-------------------------------------------------
---------------------------------------------------------------------------------------------------------------

UPDATE bodegas_estaciones SET  bodega ='BF'  WHERE bodega='OU';--inicio en OU

UPDATE bodegas_estaciones SET bodega = 'OU' WHERE bodega='BF' AND estacion_id IN ( 'OBSE', 'URG8', 'OBS8');--fin en OU

--por si la cagan

DELETE FROM bodegas_estaciones WHERE bodega='OU';--eliminar todo lo de la bodega para ponerlo de nuevo
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'OU', 'OBSE', 0);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'OU', 'URG8', 0);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'OU', 'OBS8', 0);




UPDATE bodegas_estaciones SET bodega = 'OU' WHERE bodega = 'BF';--inicio en BF

UPDATE bodegas_estaciones SET bodega = 'BF' WHERE bodega = 'OU' 
AND estacion_id IN ('CX01','HP3','HP4','HP5','HP6','HPV8','UCP4','UP3','UP5','UP6','UP7A','UP7B','UP7C','URGC','VUC3','VUC4','VUC5','VUC6','VUC7','VUCN');--fin en BF

--por si la cagan
DELETE FROM bodegas_estaciones WHERE bodega='BF';--eliminar todo lo de la bodega para ponerlo de nuevo
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'CX01', 1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'HP3',  1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'HP4',  1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'HP5',  1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'HP6',  1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'HPV8', 1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'UCP4', 1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'UP3',  1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'UP5',  1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'UP6',  1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'UP7A', 1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'UP7B', 1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'UP7C', 1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'URGC', 1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'VUC3', 1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'VUC4', 1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'VUC5', 1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'VUC6', 1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'VUC7', 1);
INSERT INTO bodegas_estaciones(empresa_id, centro_utilidad, bodega, estacion_id, sw_bodega_principal) VALUES ('01', '01', 'BF', 'VUCN', 1);



UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='CX01' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='HP3' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='HP4' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='HP5' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='HP6' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='UP3' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='UP5' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='UCP4' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='UP7A' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='UP6' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='UP7B' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='UP7C' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='URGC' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='OBSE' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='VUC3' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='VUC4' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='VUC5' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='VUC6' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='VUC7' AND estacion_id='BF';
UPDATE bodegas_estaciones SET  bodega ='OU'  WHERE estacion_id='VUCN' AND estacion_id='BF';
_______________________________________________________________________________________

UPDATE envios SET fecha_registro='2022-06-13 07:37:35.803426', fecha_final='2022-06-13' WHERE envio_id IN(5919,5909,5910,5911,5913,5914,5915,5916,5917,5918,5920)

UPDATE envios SET fecha_final=(SELECT fecha_radicacion FROM envios WHERE envio_id=5909) WHERE envio_id=5909;
UPDATE envios SET fecha_final=(SELECT fecha_radicacion FROM envios WHERE envio_id=5910) WHERE envio_id=5910;
UPDATE envios SET fecha_final=(SELECT fecha_radicacion FROM envios WHERE envio_id=5911) WHERE envio_id=5911;
UPDATE envios SET fecha_final=(SELECT fecha_radicacion FROM envios WHERE envio_id=5913) WHERE envio_id=5913;
UPDATE envios SET fecha_final=(SELECT fecha_radicacion FROM envios WHERE envio_id=5914) WHERE envio_id=5914;
UPDATE envios SET fecha_final=(SELECT fecha_radicacion FROM envios WHERE envio_id=5915) WHERE envio_id=5915;
UPDATE envios SET fecha_final=(SELECT fecha_radicacion FROM envios WHERE envio_id=5916) WHERE envio_id=5916;
UPDATE envios SET fecha_final=(SELECT fecha_radicacion FROM envios WHERE envio_id=5917) WHERE envio_id=5917;
UPDATE envios SET fecha_final=(SELECT fecha_radicacion FROM envios WHERE envio_id=5918) WHERE envio_id=5918;
UPDATE envios SET fecha_final=(SELECT fecha_radicacion FROM envios WHERE envio_id=5919) WHERE envio_id=5919;
UPDATE envios SET fecha_final=(SELECT fecha_radicacion FROM envios WHERE envio_id=5920) WHERE envio_id=5920


SELECT * FROM fac_facturas WHERE prefijo='CCR' AND factura_fiscal IN ('8807',
'11843',
'8543',
'8550',
'8551',
'8553',
'8555',
'8796',
'8818',
'8814',
'13739'
)


SELECT * FROM rc_detalle_tesoreria_facturas WHERE prefijo='RTC' AND factura_fiscal IN ('8807',
'11843',
'8543',
'8550',
'8551',
'8553',
'8555',
'8796',
'8818',
'8814',
'13739'
).







UPDATE compras_ordenes_pedidos_detalle SET porc_iva= '0.000', porc_iva2= '0.000' WHERE orden_pedido_id='21713' 
AND codigo_producto IN ('0601020088','0601010185','0601010108','0601020015','0601020195','0601020196')


UPDATE glosas SET sw_estado='3' 
WHERE glosa_id IN (4437	,4510	,4606	,4490	,75819	,69	,212	,233	,76445	,293	,56703	,4432	,4122	,4706	,
22468	,4511	,4406	,25559	,4506	,75928	,28207	,8235	,34759	,38831	,4091	,75825	,4129	,43	,4507	,8295	,
42170	,44965	,35133	,8316	,8321	,4492	,4508	,4409	,4423	,4446	,4455	,4515	,4143	,4082	,4080	,41190	,
41490	,4427	,4498	,4433	,4426	,4420	,4422	,4436	,4429	,4414	,4421	,4501	,45618	,4600	,45629	,4513	,75923	,
45859	,46760	,4450	,4516	,4395	,47801	,103	,75961	,4396	,50921	,4484	,4454	,51010	,76343	
) 




UPDATE glosas SET sw_estado='4' WHERE glosa_id IN (	4437	,	)






SELECT * FROM fac_facturas WHERE prefijo='CCR' AND factura_fiscal IN (
  12567,
  34847,
  34918,
  34845,
  51127,
  80113,
  91259,
  91509,
  91512,
  91520,
  91525,
  91527,
  91528,
  91530,
  91532,
  91538,
  87076,
  68724)

ALTER TABLE glosas_respuestas_eps
DISABLE TRIGGER tg_actualizar_valor_respuesta_eps_1
ALTER TABLE glosas_respuestas_eps
ENABLE TRIGGER tg_actualizar_valor_respuesta_eps_1

________________________________________________________________________

--CAMBIAR FECHA COLOCAR 18/10/2022 Y CAMBIAR LA HORA DE ADMINISTRACION COLOCAR 06:00
ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado='2022-10-18 06:00:17'	,	
fecha_registro_control='2022-10-18 06:00:17' , 
fecha_registro_real = '2022-10-18 06:00:17'
WHERE suministro_id=5372417;
ALTER TABLE trigger_hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

--CAMBIAR LA HORA DE ADMINISTRACION COLOCAR A LAS 22:00
ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado='2022-10-17 22:00:00'	,	
fecha_registro_control='2022-10-17 22:00:00' , 
fecha_registro_real = '2022-10-17 22:00:00'
WHERE suministro_id=5372415;
ALTER TABLE trigger_hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

--CAMBIAR LA HORA DE ADMINISTRACION COLOCAR A LAS 14:00
ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado='2022-10-17 14:00:00'	,	
fecha_registro_control='2022-10-17 14:00:00' , 
fecha_registro_real = '2022-10-17 14:00:00'
WHERE suministro_id=5373447;
ALTER TABLE trigger_hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

--CAMBIAR FECHA COLOCAR 13/10/2022 Y CAMBIAR LA HORA DE ADMINISTRACION COLOCAR 06:00
ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado='2022-10-13 06:00:34'	,	
fecha_registro_control='2022-10-13 06:00:34' , 
fecha_registro_real = '2022-10-13 06:00:34'
WHERE suministro_id=5362263;
ALTER TABLE trigger_hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

--CAMBIAR LA HORA DE ADMINISTRACION COLOCAR A LAS 22:00
ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado='2022-10-12 22:00:00'	,	
fecha_registro_control='2022-10-12 22:00:00' , 
fecha_registro_real = '2022-10-12 22:00:00'
WHERE suministro_id=5361311;
ALTER TABLE trigger_hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

--CAMBIAR LA HORA DE ADMINISTRACION COLOCAR A LAS 14:00
ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado='2022-10-12 14:00:00'	,	
fecha_registro_control='2022-10-12 14:00:00' , 
fecha_registro_real = '2022-10-12 14:00:00'
WHERE suministro_id=5362254;
ALTER TABLE trigger_hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

--------------------------------------------------------------
-------------------- cambiar el suministro a las 00
ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado=    '2022-10-07 10:00:00',	
fecha_registro_control= '2022-10-07 10:00:00', 
fecha_registro_real =   '2022-10-07 10:00:00'
WHERE suministro_id=5345565;
ALTER TABLE trigger_hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

-------------------- cambiar el suministro a las 18
ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado=    '2022-10-04 00:00:00',	
fecha_registro_control= '2022-10-04 00:00:00', 
fecha_registro_real =   '2022-10-04 00:00:00'
WHERE suministro_id=5346756;
ALTER TABLE trigger_hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

-------------------- cambiar el suministro a las 00
ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado=    '2022-10-09 11:00:00',	
fecha_registro_control= '2022-10-09 11:00:00', 
fecha_registro_real =   '2022-10-09 11:00:00'
WHERE suministro_id=5349206;
ALTER TABLE trigger_hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

-------------------- cambiar el suministro a las 2022-12-02 00:00:00
ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado=    '2022-12-01 20:00:00'
WHERE suministro_id=5470409;

ALTER TABLE hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;



  ALTER TABLE hc_formulacion_suministro_medicamentos 
  DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
  UPDATE hc_formulacion_suministro_medicamentos
  SET fecha_realizado='2022-03-27 05:25:41'	,	
  fecha_registro_control='2022-03-27 05:25:41' , 
  fecha_registro_real = '2022-03-27 05:25:41'
  WHERE suministro_id=4914752;
  ALTER TABLE trigger_hc_formulacion_suministro_medicamentos 
  ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;



  ALTER TABLE hc_formulacion_suministro_medicamentos 
  DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
  UPDATE hc_formulacion_suministro_medicamentos
  SET fecha_realizado='2022-03-27 05:25:41'	,	
  fecha_registro_control='2022-03-27 05:25:41' , 
  fecha_registro_real = '2022-03-27 05:25:41'
  WHERE suministro_id=4914753;
  ALTER TABLE trigger_hc_formulacion_suministro_medicamentos 
  ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;



  ALTER TABLE hc_formulacion_suministro_medicamentos 
  DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
  UPDATE hc_formulacion_suministro_medicamentos
  SET fecha_realizado='2022-03-27 05:25:41'	,	
  fecha_registro_control='2022-03-27 05:25:41' , 
  fecha_registro_real = '2022-03-27 05:25:41'
  WHERE suministro_id=4914754;
  ALTER TABLE hc_formulacion_suministro_medicamentos 
  ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;


  ALTER TABLE hc_formulacion_suministro_medicamentos 
  DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
UPDATE hc_formulacion_suministro_medicamentos
SET cantidad_suministrada=2,
cantidad_suministro_unidad=2,
observacion= ''
WHERE suministro_id=4990005 AND ingreso=389329 AND codigo_producto='0102070056';
  ALTER TABLE hc_formulacion_suministro_medicamentos 
  ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

  ALTER TABLE hc_formulacion_suministro_medicamentos 
  DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
  UPDATE hc_formulacion_suministro_medicamentos
  SET fecha_realizado='2022-05-10 20:00:00'
  WHERE suministro_id=4994199 AND ingreso=389329 AND codigo_producto='0102070056';
  ALTER TABLE hc_formulacion_suministro_medicamentos 
  ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;





ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
UPDATE hc_formulacion_suministro_medicamentos
SET cantidad_suministrada=2, cantidad_suministro_unidad=2
WHERE suministro_id=5006633 AND ingreso=402455 AND codigo_producto='0102070051';
ALTER TABLE hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;


ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;
UPDATE hc_formulacion_suministro_medicamentos
SET cantidad_suministrada=2, cantidad_suministro_unidad=2
WHERE suministro_id=4988619 AND ingreso=402455 AND codigo_producto='0102070051';
ALTER TABLE hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;




  CREATE TRIGGER trigger_hc_formulacion_suministro_medicamentos 
  AFTER INSERT OR DELETE OR UPDATE ON public.hc_formulacion_suministro_medicamentos FOR EACH 
  ROW EXECUTE PROCEDURE bodega_paciente_control_suministro_medicamentos()

-------------------- cambiar el suministro 0101070020 NO POS CEFTAZIDIMA /AVIBACTAM 2G/0.5G a las 12/12/22 23:59
ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado=    '2022-12-13 00:00:00'
WHERE suministro_id=5493053;

ALTER TABLE hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;



-------------------- cambiar el suministro 0102070044 a las 30/01/23 05:51
ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado=    '2023-02-01 08:00:00'
WHERE suministro_id=5610141;

ALTER TABLE hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;




  ---- REPORTE GLOSAS(fecha Registro Eps y fecha Ratificacion, NIT.) 

  SELECT
g.glosa_id, g.prefijo ||' '|| g.factura_fiscal AS factura, g.prefijo_glosa ||' '|| g.numero AS documento_glosa,  
p.tipo_id_paciente ||' '|| p.paciente_id AS id_paciente, 
pl.plan_descripcion AS entidad, 
pl.tipo_tercero_id AS tipo_doc, 
pl.tercero_id AS numero_documento, 
ru.nombre AS usuario_registra,
g.fecha_glosa, 
g.fecha_registro::date, 
gtc.descripcion AS Clasificacion_Glosa, 
g.codigo_concepto_general AS cod_concepto_gral, 
gcg.descripcion_concepto_general AS concepto_general,  
g.codigo_concepto_especifico AS cod_concepto_especifico, 
gce.descripcion_concepto_especifico AS concepto_especifico, 

    (SELECT rg.fecha_registro           
       FROM glosas_respuestas rg
	   WHERE g.glosa_id = rg.glosa_id 
	  	   LIMIT 1),
    (SELECT CASE WHEN rg.glosa_respuesta_id IS NOT NULL THEN 'CON RESPUESTA'
            ELSE 'SIN RESPUESTA' END AS respuesta 
	        FROM glosas_respuestas rg
	        WHERE g.glosa_id = rg.glosa_id 
			LIMIT 1),
    (SELECT su.nombre AS usuario_respuesta
	        FROM system_usuarios su, glosas_respuestas rg
	        WHERE su.usuario_id = rg.usuario_id 
			AND g.glosa_id = rg.glosa_id
			LIMIT 1), 
    (SELECT to_char(rg.fecha_registro, 'dd/mm/YYYY') as fecha_respuesta          
       FROM glosas_respuestas rg
	   WHERE g.glosa_id = rg.glosa_id 
	  	   LIMIT 1),		
    (SELECT to_char(rg.fecha_registro, 'hh24:mi:ss') as hora_respuesta          
       FROM glosas_respuestas rg
	   WHERE g.glosa_id = rg.glosa_id 
	  	   LIMIT 1),		   
CASE WHEN g.sw_estado= '0' THEN 'ANULADA'
     WHEN g.sw_estado='1' THEN 'SIN RESPUESTA'
     WHEN g.sw_estado= '2' THEN 'CON RESPUESTA'
     WHEN g.sw_estado= '3' THEN 'CERRADA'
     WHEN g.sw_estado= '4' THEN 'RATIFICADA'
     END AS estado_glosa, 
ff.total_factura,
g.valor_glosa, 
SUM(gri.valor_aceptado) as valor_aceptado, 
(ff.total_factura-g.valor_aceptado)AS valor_pagar,
gre.prefijo ||' '|| gre.numero AS id_respuesta_glosa_eps, 
gre.valor_aceptado, 
gre.valor_no_aceptado
FROM
glosas g
LEFT JOIN glosas_respuestas gri ON g.glosa_id=gri.glosa_id
LEFT JOIN glosas_respuestas_eps gre ON g.glosa_id=gre.glosa_id
INNER JOIN fac_facturas ff ON ff.factura_fiscal=g.factura_fiscal AND ff.prefijo=g.prefijo
INNER JOIN fac_facturas_cuentas ffc ON ffc.factura_fiscal=ff.factura_fiscal AND ffc.prefijo=ff.prefijo
INNER JOIN cuentas c ON c.numerodecuenta=ffc.numerodecuenta
INNER JOIN planes pl ON pl.plan_id=ff.plan_id 
INNER JOIN ingresos i ON i.ingreso=c.ingreso
INNER JOIN pacientes p ON p.paciente_id=i.paciente_id AND p.tipo_id_paciente=i.tipo_id_paciente
INNER JOIN glosas_tipos_clasificacion gtc ON gtc.glosa_tipo_clasificacion_id=g.glosa_tipo_clasificacion_id
LEFT JOIN glosas_concepto_general gcg ON gcg.codigo_concepto_general=g.codigo_concepto_general
LEFT JOIN glosas_concepto_especifico gce ON gce.codigo_concepto_especifico=g.codigo_concepto_especifico
LEFT JOIN system_usuarios as ru ON g.usuario_id = ru.usuario_id
WHERE g.fecha_glosa BETWEEN _1 AND _2
GROUP BY g.glosa_id, p.tipo_id_paciente, p.paciente_id, pl.plan_descripcion, pl.tipo_tercero_id, pl.tercero_id, 
ru.nombre, g.fecha_glosa, 
g.fecha_registro, 
gtc.descripcion, 
g.codigo_concepto_general, 
gcg.descripcion_concepto_general,  
g.codigo_concepto_especifico, 
gce.descripcion_concepto_especifico, ff.total_factura, gre.prefijo, gre.numero, gre.valor_aceptado, gre.valor_no_aceptado


UPDATE relacion_cuentas_detalle SET estado='E' WHERE relacion_id=196369











--transaccion con bodega discriminado 
SELECT cd.transaccion 
, bd.codigo_producto 
, cd.numerodecuenta 
, cd.cargo 
, cd.departamento 
, bdn.bodega 
, cd.cantidad 
, cd.precio 
FROM cuentas_detalle cd 
INNER JOIN bodegas_documentos_d bd ON (cd.consecutivo=bd.consecutivo) 
INNER JOIN bodegas_doc_numeraciones bdn ON (bd.bodegas_doc_id = bdn.bodegas_doc_id) 
WHERE cd.numerodecuenta=411209 
AND bd.codigo_producto='0201010161' 
ORDER BY 6, cd.departamento 










UPDATE estaciones_enfermeria_usuarios SET estacion_perfil_id ='13' WHERE usuario_id=2421








UPDATE compras_ordenes_pedidos_detalle SET porc_iva=19.00, porc_iva2=19.00 WHERE orden_pedido_id=20751

UPDATE ingresos_soat SET tercero_id='1143860379', diagnostico_id='S631' WHERE evento=115767 AND ingreso IN (
398460,
399212,
401127,
402113,
403033,
403823,
418770)




SELECT * FROM inv_bodegas_movimiento WHERE bodega='TI' AND fecha_registro::DATE BETWEEN '2022-18-01' AND '2022-18-30'  
ORDER BY fecha_registro


SELECT 
  inso.ingreso, 
  inso.evento, 
  inso.tipo_id_tercero, 
  inso.tercero_id, 
  profe.nombre, 
  inso.diagnostico_id, 
  inso.usuario_id, 
  inso.folios
FROM ingresos_soat inso 
INNER JOIN profesionales profe 
ON (inso.tercero_id=profe.tercero_id)
WHERE ingreso= AND evento=
ORDER BY 1



=CONCATENAR("SELECT inso.ingreso, inso.evento, inso.tipo_id_tercero, inso.tercero_id, profe.nombre, inso.diagnostico_id, inso.usuario_id, inso.folios
FROM ingresos_soat inso 
INNER JOIN profesionales profe ON (inso.tercero_id=profe.tercero_id)
WHERE ingreso='";K2;"' AND evento='";J2;"';")



UPDATE ingresos SET estado='2' WHERE ingreso= ;



INSERT INTO tarifarios_detalle(ingreso , evento) VALUES (numero_ingreso , numero_evento)
=CONCATENAR("INSERT INTO ingresos_soat(ingreso, evento) VALUES ("; A18;","; B18; ");")

INSERT INTO tarifarios_detalle(tarifario_id,grupo_tarifario_id,subgrupo_tarifario_id,cargo,descripcion,precio,tipo_cargo,grupo_tipo_cargo,gravamen,sw_cantidad,nivel,sw_honorarios,concepto_rips,sw_uvrs,grupos_mapipos,tipo_unidad_id,porcentaje_default)
VALUES()

INSERT INTO tarifarios_equivalencias (tarifario_id, cargo, cargo_base, porc_similitud, sw_tipo_consulta)
VALUES ();



--CAMBIAR MEDICO EN EXAMEN FISICO
UPDATE hc_revision_por_sistemas SET usuario_id=123456 WHERE ingreso=123456 AND evolucion_id=123456




SELECT
hg. 	hc_plan_terapeutico_id,
hg. descripcion,
hg. fecha_registro_plan,
hc.evolucion_id

FROM
hc_plan_terapeutico hg
LEFT JOIN hc_evoluciones hc ON hg.evolucion_id=hc.evolucion_id
LEFT JOIN ingresos ing ON hc.ingreso=ing.ingreso

WHERE ing.ingreso=405781


DELETE * FROM tmp_anulacion_factura


-- Para eliminar un triage se debe tener en cuenta las tablas, 
-- teniendo el triage_id que se saca de la tabla triages y 
-- en la tabla triages se filtra con el numero de cocumento del paciente.
chequeo_triages 
-- y la tabla 
signos_vitales_triages 
-- Luego de eso se elimina el registro en la tabla 
triages




--Actualizar Bodegas de estaciones para inventario fisico
UPDATE
bodegas_estaciones
SET
bodega = 'OU'
WHERE 
	sw_bodega_principal = '1'
    AND bodega = 'BF'
    and estacion_id IN ( 

'HP3',
'HP4',
'HP5',
'HP6',
'UP3',
'UP5',
'UP6',
'UCP4',
'UP7A',
'UP7B',
'UP7C',
'URGC',
'OBSE' )

INSERT INTO userpermisos_censo(usuario_id, empresa_id, centro_utilidad, sw_todos_cu) VALUES (3038, '01', '01', '1')
INSERT INTO userpermisos_cirugia(usuario_id, empresa_id, centro_utilidad, departamento) VALUES (3038, '01', '01', 'CIRU01')
INSERT INTO userpermisos_estacion_enfermeria_qx(departamento, usuario_id) VALUES ('CIRU01', 3038)

-- insert con subconsulta (atencion pacientes)
INSERT INTO estaciones_enfermeria_usuarios (estacion_id, usuario_id, estacion_perfil_id) 
SELECT estacion_id,3775,--usuario al que necesitamos que se le inserten los permisos.
estacion_perfil_id AS ep FROM estaciones_enfermeria_usuarios 
WHERE usuario_id=1216 ;--usuario que necesitamos copiar.

--insert con consulta permiso de medicos
INSERT INTO estaciones_enfermeria_usuarios_componentes(estacion_id, usuario_id, estacion_componente_id, sw_permiso)
SELECT estacion_id, 1860, 60, 1 
FROM estaciones_enfermeria_usuarios 
WHERE usuario_id = 1860;

--actualizar usaurio en estacion enfermeria con subconsulta para igualarlo a otro usuario.
UPDATE estaciones_enfermeria_usuarios 
SET estacion_perfil_id= '03'
WHERE usuario_id=1261


-- insert con subconsulta (Bodegas usuarios)
INSERT INTO bodegas_usuarios(empresa_id, centro_utilidad, bodega, usuario_id) 
SELECT empresa_id, centro_utilidad,bodega, 3189 --usuario al que necesitamos que se le inserten los permisos.
FROM bodegas_usuarios 
WHERE usuario_id=3072;--usuario que necesitamos copiar.


-- insert subconsulta para reportes CSV
INSERT INTO usuarios_asigna_reportes (reporte_empresa_id, usuario_id, usuario_registra, fecha_registro)
SELECT reporte_empresa_id, 3189, 2803, NOW()
FROM usuarios_asigna_reportes
WHERE usuario_id= 2845--usuario que necesitamos copiar.


-- insert copia usuario subconsulta para trasnsacciones de bodega KARDEX
INSERT INTO 
inv_bodegas_userpermisos (documento_id, empresa_id, centro_utilidad, bodega, usuario_id, permiso_doc)
SELECT documento_id, empresa_id, centro_utilidad, bodega, 3076, permiso_doc
FROM inv_bodegas_userpermisos
WHERE usuario_id= 2871--usuario que necesitamos copiar.


-- insert copia de usuario con subconsulta en departamentos_cc
INSERT INTO system_usuarios_departamentos_cc (usuario_id, departamento, fecha_registro, usuario_registro, sw_estado)
SELECT 2568, departamento, NOW(), 2803, sw_estado
FROM system_usuarios_departamentos_cc
WHERE usuario_id= 470

-- insert copia de usuario con subconsulta en usuarios_menu_prosi
INSERT INTO usuarios_menu_prosi (usuario_id, cod_menu,	sw_insert,	sw_update,	sw_delete,	sw_select,	sw_print)
SELECT 2803,	cod_menu,	sw_insert,	sw_update,	sw_delete,	sw_select,	sw_print
FROM usuarios_menu_prosi
WHERE usuario_id= 2803

-- insert con subconsulta en userpermisos_solicitudes_bodegas 
INSERT INTO userpermisos_solicitudes_bodegas (empresa_id, centro_utilidad, usuario_id, bodega)
SELECT empresa_id, centro_utilidad, 3110, bodega
FROM userpermisos_solicitudes_bodegas
WHERE usuario_id=3--usuario que necesitamos copiar.


-- insert con subconsulta en bodegas_usuarios_devoluciones_cuentas // SIRVE PARA EL BOTON DEVOLVER EN CUENTAS
INSERT INTO bodegas_usuarios_devoluciones_cuentas (empresa_id, centro_utilidad, bodega, usuario_id)
SELECT empresa_id, centro_utilidad, bodega, 3110 --usuario que vamos a insertar los permisos
FROM bodegas_usuarios_devoluciones_cuentas
WHERE usuario_id= 3;--usuario que necesitamos copiar.


-- insert con subconsulta en inv_bodegas_userpermisos 
INSERT INTO inv_bodegas_userpermisos (documento_id, empresa_id, centro_utilidad, bodega, usuario_id, permiso_doc)
SELECT documento_id, empresa_id, centro_utilidad, bodega, 523, permiso_doc --usuario que vamos a insertar los permisos
FROM inv_bodegas_userpermisos
WHERE usuario_id= 544;--usuario que necesitamos copiar.


-- update fecha ingreso caja en fecha registro

SELECT fecha_ingcaja
FROM 

UPDATE recibos_caja SET fecha_registro = '2022-09-30 00:00:00' WHERE prefijo='RTA' AND recibo_caja=;






--            PERFILES                 --

-- Analista de compras y suministro 58 --

-- referencia y contrareferencia
userpermisos_censo



-- modificacion de suministro de nutricio o dieta --

ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

-- desaplicar las 4 nutriciones del dia 30/6/2022 a las 23:59 y eliminar la observacion cobro multiple por realización de mipres - finalización de mes. --
UPDATE hc_formulacion_suministro_medicamentos
SET cantidad_suministrada=0, observacion=""
WHERE suministro_id=5109238 AND ingreso=421176 AND codigo_producto='0102070056';

-- Aplicar 1 lata en los siguientes horarios el dia 1/7/2022 --

-- 1 lata 1/7/2022 1:00am login de SHYRLEY XIMENA MARMOLEJO GUERRERRO --
UPDATE hc_formulacion_suministro_medicamentos
SET cantidad_suministrada=1
WHERE suministro_id=5109234 AND ingreso=421176 AND codigo_producto='0102070056';

-- 1 lata 1/7/2022 6:00am SHYRLEY XIMENA MARMOLEJO GUERRERRO --

-- 1 lata 1/7/2022 12:00pm login laura valeria pavon gallo --

-- 1 lata 1/7/2022 18:00 horas login laura valeria pavon gallo --


ALTER TABLE hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;


SELECT 3, ID, Name, DivisionID AS DivisionName, ManagerID AS ManagerName, Salary
FROM cb_companydivisions ORDER BY Salary DESC 





DELETE FROM cg_mov_01.cg_mov_contable_01_detalle WHERE documento_contable_id= 644730


-- Consulta para roman --
SELECT rc.prefijo ||' '|| rc.recibo_caja AS Documento, 
rc.tipo_id_tercero, 
rc.tercero_id, 
te.nombre_tercero,
rc.fecha_ingcaja AS fecha_ingreso_caja, 
rc.fecha_registro,
rc.observacion
FROM recibos_caja rc
JOIN terceros te ON rc.tercero_id = te.tercero_id
where fecha_ingcaja::DATE BETWEEN '2022-01-01' AND '2022-06-14'
ORDER BY fecha_ingcaja




-- update glosas respuestas inventarios
UPDATE glosas_respuestas_inventarios
SET observacion='995. No se acepta glosa realizada por las siguientes razones: extemporaneidad. de conformidad con lo establecido en la ley 1438 de 2011, resolución 3047 de 2008 y resolución 4331 de 2012, mediante las cuales definieron los formatos, mecanismos de envío, procedimientos y términos en la relaciones entre prestadores de servicios de salud y entidades responsables de pago: ?las entidades responsables del pago de servicios de salud dentro de los veinte (20) días hábiles siguientes a la presentación de la factura con todos sus soportes, formularán y comunicarán a los prestadores de servicios de salud las glosas a cada factura con base en la codificación y alcance definidos en la normatividad vigente?. con base en dicha normatividad, se identifica resultado claro de la extemporaneidad ya que la factura fue radicada ante la eps el día 31/05/2022 ; la glosa de la factura fue presentada por la eps ante clínica cristo rey el 30/06/2022, superando el tiempo establecido por la ley.
 
 No se acepta glosa, no se evidencia mayor valor cobrado servicio no se encuentra regulado el Valor facturado no supera el valor promedio del mercado y no hay convenio entre las partes por lo tanto se debe reconocer a tarifas institucionales decreto 056/2015 artículo 10. Por favor tener en cuenta el art 57 de la ley 1438 y el art. 23 del decreto 4747 una vez formuladas las glosas o devoluciones de una factura no se podrá formular nuevas glosas o devolución a la misma factura.'
WHERE glosa_respuesta_id='217315'



-- modificacion de suministro de nutricio o dieta --

-- apaga trigger
ALTER TABLE hc_formulacion_suministro_medicamentos 
DISABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;

-- hora 1:00 AM
UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado='2022-07-01 01:00:00', fecha_registro_control='2022-07-01 13:12:08'
WHERE suministro_id=5149426 AND ingreso=421176 AND codigo_producto='0102070056';

-- hora 5:00 AM
UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado='2022-07-01 05:00:00', fecha_registro_control='2022-07-01 13:12:30'
WHERE suministro_id=5149429 AND ingreso=421176 AND codigo_producto='0102070056';

-- hora 10:00 AM
UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado='2022-07-01 10:00:00', fecha_registro_control='2022-07-01 13:13:09'
WHERE suministro_id=5149437 AND ingreso=421176 AND codigo_producto='0102070056';

-- hora 6:00 PM
UPDATE hc_formulacion_suministro_medicamentos
SET fecha_realizado='2022-07-01 18:00:00', fecha_registro_control='2022-07-01 18:59:36'
WHERE suministro_id=5149596 AND ingreso=421176 AND codigo_producto='0102070056';

-- enciende trigger
ALTER TABLE hc_formulacion_suministro_medicamentos 
ENABLE TRIGGER trigger_hc_formulacion_suministro_medicamentos;



----------------------------------------------------------------------------------------------

SELECT 
ffc.prefijo,
ffc.factura_fiscal AS numero_factura,
ff.numerodecuenta,
env.fecha_radicacion::DATE,
ffc.fecha_registro::DATE AS fecha_factura,
ffc.total_factura AS valor_total_factura,
ffc.saldo AS valor_saldo_factura,
soe.tipo_id_paciente AS tipo_id,
soe.paciente_id AS numero_identificacion,
pac.primer_nombre ||' '|| pac.segundo_nombre ||' '|| pac.primer_apellido ||' '|| pac.segundo_apellido AS nombre_completo_paciente,
soe.poliza AS numero_poliza,
ter.nombre_tercero
FROM soat_eventos soe 
LEFT JOIN pacientes pac ON soe.paciente_id = pac.paciente_id
LEFT JOIN soat_polizas sop ON soe.poliza = sop.poliza
LEFT JOIN fac_facturas ffc ON sop.tercero_id = ffc.tercero_id
LEFT JOIN fac_facturas_cuentas ff ON ffc.factura_fiscal = ff.factura_fiscal AND ffc.prefijo = ff.prefijo
LEFT JOIN terceros ter ON ffc.tercero_id = ter.tercero_id
LEFT JOIN envios_detalle edt ON ffc.factura_fiscal = edt.factura_fiscal AND ffc.prefijo = edt.prefijo
LEFT JOIN envios env ON edt.envio_id = env.envio_id
WHERE env.fecha_radicacion::DATE BETWEEN '2022-07-01' AND '2022-07-02'


desde fac facturas con cuentas

-------------------------------------------------------------------------------------------------------
SELECT 
ffc.prefijo, 
ffc.factura_fiscal, 
ffc.estado AS estado_factura, 
glo.prefijo AS pref_fac_glosa, 
glo.factura_fiscal AS num_fac_glosa, 
glo.sw_estado AS estado_glosa, 
glo.glosa_id, 
glo.prefijo_glosa, 
glo.numero AS numero_glosa,
glo_ips.glosa_respuesta_id,
glo_ips.valor_aceptado,
glo_ips.documento_id,
glo_eps.glosa_respuesta_eps_id
FROM 
fac_facturas ffc
JOIN glosas glo ON ffc.factura_fiscal= glo.factura_fiscal AND ffc.prefijo=glo.prefijo
LEFT JOIN glosas_respuestas glo_ips ON glo.glosa_id = glo_ips.glosa_id
LEFT JOIN glosas_respuestas_eps glo_eps ON glo.glosa_id = glo_eps.glosa_id
WHERE ffc.prefijo='CCR' AND ffc.factura_fiscal IN(90645,
91176,91177,91180,91182,91449,91559,91426,91422,91421,91419,92016,92023,92021,92018,92027,92029,
92031,91970,92584,92583,92581,92579,92505,92509,92910,92892,93335,93169,93738,93455,93736,93734,
93731,93726,93724,93718,93717,93715,93660,94437,94443,94447,94453,94456,94460,94470,94477,94479,
94480,94485,94486,94755,94760,94778,94781,94785,94855,94860,95129,95133,95138,95143,95235,95352,
95904,95910,95914,95916,95919,95923,95932,95937,95943,96133,96145,96146,96152,96165,96709,96725,
96860,97394,97410,97416,97443,97829,97834,97836,97841,98424,98610,98624,98643) ORDER BY estado



UPDATE glosas SET sw_estado=0 WHERE Prefijo_glosa='GLF' AND numero IN(157770	,
158320	,158406	
)

AND glosa_id IN(158080	,
158635	,158
)


________________________________________________________________________
INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (1, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (2, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (3, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (4, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (5, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (6, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (7, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (8, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (9, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (10, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (11, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (12, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (14, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (16, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (17, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (18, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (19, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (20, 6309172, 431279, 'N', 'Especifique', 2180, NOW());

INSERT INTO hc_revision_por_sistemas (tipo_sistema_id, evolucion_id, ingreso, sw_normal, hallazgo, usuario_id, fecha_registro)
VALUES (21, 6309172, 431279, 'N', 'Especifique', 2180, NOW());



UPDATE hc_revision_por_sistemas
SET usuario_id=2805
WHERE evolucion_id=6309172 AND ingreso=431279

UPDATE hc_revision_por_sistemas
SET usuario_id=2805, evolucion_id=6307894
WHERE evolucion_id=6309172 AND ingreso=431279


-- Actualizacion de glosas_respuestas_cargos
UPDATE glosas_respuestas_cargos
SET observacion='Ips no acepta glosa insumo, procedimientos, internacion, insumos y medicamentos servicios pactados entre las partes clinica cristo rey lo que demuestra que no tienen convenio con salud total eps y se cobra de acuerdo a lo estrictamente al manual tarifario soat y lo que no se encuentre dentro del manual se reconoceran a tarifas institucionales acorde a la pertinencia y necesidad del paciente, nos acogemos a decreto numero 4747 de 2007 articulo 23. una vez formulas glosas a una factura, no se podran formular nuevas glosas a la misma factura, salvo las que surjan de hechos nuevos detectados en la respuesta dada a la glosa inicial. y segun la administradora de los recursos del sistema general de seguridad social en salud manual de auditoria integral de reclamaciones siempre que en la respuesta a los resultados de auditoria el reclamante aporte un nuevo documento, este sera objeto de una auditoria integral complementando la realizada a la reclamacion inicial y solo respecto de este nuevo documento podran aplicarse nuevas glosas, en cuyo caso opera el derecho a dar respuesta al resultado de auditoria. no se acepta glosa, se evidencia que se factura acorde a tarifa pactada entre las partes por tanto se considera como glosa infundada o injustificada y basándonos en el articulo 7 del decreto ley 1281 de 2002 se cita, en el evento en que las glosas formuladas resulten infundadas el prestador de servicios tendra derecho al reconocimiento de intereses moratorios desde la fecha de presentacion de la factura, reclamacion o cuenta de cobro.'
WHERE glosa_respuesta_id=135435

UPDATE glosas_respuestas_inventarios
SET observacion='Ips no acepta glosa insumo, procedimientos, internacion, insumos y medicamentos servicios pactados entre las partes clinica cristo rey lo que demuestra que no tienen convenio con salud total eps y se cobra de acuerdo a lo estrictamente al manual tarifario soat y lo que no se encuentre dentro del manual se reconoceran a tarifas institucionales acorde a la pertinencia y necesidad del paciente, nos acogemos a decreto numero 4747 de 2007 articulo 23. una vez formulas glosas a una factura, no se podran formular nuevas glosas a la misma factura, salvo las que surjan de hechos nuevos detectados en la respuesta dada a la glosa inicial. y segun la administradora de los recursos del sistema general de seguridad social en salud manual de auditoria integral de reclamaciones siempre que en la respuesta a los resultados de auditoria el reclamante aporte un nuevo documento, este sera objeto de una auditoria integral complementando la realizada a la reclamacion inicial y solo respecto de este nuevo documento podran aplicarse nuevas glosas, en cuyo caso opera el derecho a dar respuesta al resultado de auditoria. no se acepta glosa, se evidencia que se factura acorde a tarifa pactada entre las partes por tanto se considera como glosa infundada o injustificada y basándonos en el articulo 7 del decreto ley 1281 de 2002 se cita, en el evento en que las glosas formuladas resulten infundadas el prestador de servicios tendra derecho al reconocimiento de intereses moratorios desde la fecha de presentacion de la factura, reclamacion o cuenta de cobro.'
WHERE glosa_respuesta_id=135435


--INSERTAR PROCEDIMMIENTOS NOTAS OPERATORIAS
--INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
--VALUES (47588,'793901','1','',46159,'');
--INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
--VALUES (47588,'793405','1','',46159,'');
--INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
--VALUES (47588,'780403','1','',46159,'');
INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
VALUES (47588,'770402','1','',46159,'');
--INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
--VALUES (47588,'782341','1','',46159,'');
--INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
--VALUES (47588,'819005','1','',46159,'');
--INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
--VALUES (47588,'782341','1','',46159,'');
--INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
--VALUES (47588,'817207','1','',46159,'');
--INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
--VALUES (47588,'819331','1','',46159,'');
INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
VALUES (47588,'770902','1','',46159,'');
--INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
--VALUES (47588,'782741','1','',46159,'');
--INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
--VALUES (47588,'867001','1','',46159,'');
--INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
--VALUES (47588,'824321','1','',46159,'');
--INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
--VALUES (47588,'825301','1','',46159,'');
--INSERT INTO hc_notas_operatorias_procedimientos (hc_nota_operatoria_cirugia_id, procedimiento_qx, realizado,observaciones, acto_quiru, sw_misma_via)
--VALUES (47588,'780901','1','',46159,'');


hc_cultivos_quirurgicos

hc_patologia_quirurgicos

hc_hallazgos_quirurgicos

hc_descripcion_cirugia

hc_notas_operatorias_profilaxis

hc_notas_operatorias_procedimientos



SELECT 
acs.tipo_id_paciente, 
acs.paciente_id, 
(pac.primer_nombre ||' '|| pac.segundo_nombre ||' '|| pac.primer_apellido ||' '|| pac.segundo_apellido ) AS full_name_paciente,
acs.tipo_cita, 
tic.descripcion AS descripcion_tipo_cita,
acs.plan_id,
pla.plan_descripcion,
acs.cargo_cita,
cup.descripcion AS descripcion_cargo,
acs.observacion,
acs.usuario_id,
(syu.primer_nombre ||' '|| syu.segundo_nombre ||' '|| syu.primer_apellido ||' '|| syu.segundo_apellido ) AS full_name_colaborador,
acs.fecha_registro::DATE AS fecha_registro,
acs.fecha_registro::TIME AS hora_registro,
acs.fecha_deseada
FROM
agenda_citas_asignadas acs
JOIN pacientes pac ON acs.paciente_id = pac.paciente_id AND acs.tipo_id_paciente = acs.tipo_id_paciente
JOIN planes pla ON acs.plan_id = pla.plan_id
JOIN system_usuarios syu ON acs.usuario_id = syu.usuario_id
JOIN tipos_cita tic ON acs.tipo_cita = tic.tipo_cita
JOIN cups cup ON acs.cargo_cita = cup.cargo
WHERE acs.fecha_registro BETWEEN _1 AND _2
--WHERE acs.fecha_registro BETWEEN '2022-08-01' AND '2022-08-29'


UPDATE bodega_paciente SET cantidad_en_solicitud = 0 WHERE ingreso =366326;

UPDATE tarifarios_equivalencias SET indica_orden =  WHERE tarifario_id= AND cargo= AND cargo_base= ;

DELETE
FROM
WHERE




SELECT * 
FROM recibos_caja 
WHERE fecha_registro::DATE BETWEEN '2022-07-01' AND '2022-08-31' 
AND prefijo='RTA'
ORDER BY fecha_registro;



-- ver quien modifico la informacion de un paciente con cargo

SELECT suc.nombre AS creacion, su.nombre AS modificacion, su.descripcion AS perfil, pa.* 
FROM pacientes_auditar pa
JOIN system_usuarios suc ON pa.usuario_id = suc.usuario_id
JOIN system_usuarios su ON pa.usuario_mod = su.usuario_id
WHERE paciente_id = '98432144'
ORDER BY 4;

-- ver quien modifico la informacion de un paciente.

SELECT suc.nombre AS creacion, su.nombre AS modificacion, pa.* 
FROM pacientes_auditar pa
JOIN system_usuarios suc ON pa.usuario_id = suc.usuario_id
JOIN system_usuarios su ON pa.usuario_mod = su.usuario_id
WHERE paciente_id = '98432144'
ORDER BY 3;




-- consultar datos necesarios para FURIPS

SELECT
ffc.prefijo,
ffc.factura_fiscal,
ing.tipo_id_paciente,
ing.paciente_id,
ing.ingreso,
ins.evento,
c.numerodecuenta
FROM ingresos ing
JOIN ingresos_soat ins ON ing.ingreso = ins.ingreso
JOIN cuentas c ON ing.ingreso = c.ingreso
JOIN fac_facturas_cuentas ffc ON c.numerodecuenta = ffc.numerodecuenta
WHERE ing.ingreso = 438400
ORDER BY ing.ingreso;



-- ver permisos control cuentas con nombres
SELECT
su.nombre,
msp.des_menu,
mp.*
FROM usuarios_menu_prosi mp
JOIN system_usuarios su ON mp.usuario_id = su.usuario_id
JOIN menus_prosi msp ON mp.cod_menu = msp.cod_menu
WHERE mp.usuario_id = 315;


-------------------------------------
Cuando se queda un temporal pegado
se debe buscar en tmp_cuenta_insumos




-----------------------------------
--Creacion de usuario de Farmacia central   || cuentas es lo mismo empresa
--el CSV se hace en el SIIS
--el Kardex es en SIIS en administracion de modulos modulo inv_movimientos_admin

INSERT INTO inv_bodegas_userpermisos VALUES(31,'01','01','BF',3010,'0'); --Insertar bodegas módulo "TRANSACCIONES DE BODEGAS" DOC-TRASLADO
INSERT INTO inv_bodegas_userpermisos VALUES(31,'01','01','CP',3010,'0'); --Insertar bodegas módulo "TRANSACCIONES DE BODEGAS" DOC-TRASLADO
INSERT INTO userpermisos_solicitudes_bodegas VALUES('01','01',3010,'BF',nextval('userpermisos_solicitudes_bodegas_userpermiso_bodega_id_seq'::regclass)); --Insertar bodegas módulo "ADMINISTRACION DE BODEGAS"
INSERT INTO userpermisos_solicitudes_bodegas VALUES('01','01',3010,'CP',nextval('userpermisos_solicitudes_bodegas_userpermiso_bodega_id_seq'::regclass)); --Insertar bodegas módulo "ADMINISTRACION DE BODEGAS" - Almacen central de mezclas
--Este se inserta pára que se vea las estaciones de enfermeria
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('CX01', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('URGC', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('OBSE', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('HP3', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('UP3', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('VUC3', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('HP4', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('UCP4', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('VUC4', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('HP5', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('UP5', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('VUC5', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('HP6', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('UP6', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('VUC6', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('UP7A', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('HP7', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('VUC7', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('UP7B', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('UP7C', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('URG8', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('OBS8', '3010','04');
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('HPV8', '3010','04');


----------------------------------------
--agregar reporte a SIIS por base de datos.
--NOMBRE ARCHIVO: triage_diagnosticos
--TITULO REPORTE: Triage Diagnosticos

INSERT INTO reportes_empresa (empresa_id, nombre_archivo, titulo_reporte, modulo, modulo_tipo, observaciones)
VALUES ('01', 'triage_diagnosticos', 'Triage Diagnosticos', 'ReportesProdPaciPlan_Facturados', 'app', NULL);

--Insertar en  parametros reporte, se deben insertar en ambas tablas
--ID REPORTE: 314

INSERT INTO parametros_reportes (reporte_empresa_id, nombre_campo, abreviatura, fecha_registro)
VALUES (314, 'fecha_inicial', '_1', NOW());
INSERT INTO parametros_reportes (reporte_empresa_id, nombre_campo, abreviatura, fecha_registro)
VALUES (314, 'fecha_final', '_2', NOW());


-------------------------------------------------------------------------------------------------------------
--subidos doble por error que no han sido interfazados a la DIAN en el aplicaivo de facturacion electronica ICS documento equivalente.

DELETE FROM inf_dian.documentos_equivalentes_items WHERE documento_equivalente_id
IN (SELECT documento_equivalente_id FROM inf_dian.documentos_equivalentes WHERE prefijo='DSEF' AND numero=41);

DELETE FROM inf_dian.documentos_equivalentes_respuestas_dian WHERE documento_equivalente_id
IN(SELECT documento_equivalente_id FROM inf_dian.documentos_equivalentes WHERE prefijo='DSEF' AND numero=41);

DELETE FROM inf_dian.documentos_equivalentes WHERE documento_equivalente_id
IN(SELECT documento_equivalente_id FROM inf_dian.documentos_equivalentes WHERE prefijo='DSEF' AND numero=41);
-------------------------------------------------------------------------------------------------------------
--PArametrizacion empresa SEDE Pereira
1402 - roman
1064 - hellen

INSERT INTO userpermisos_requisiciones (empresa_id, centro_utilidad, usuario_id)
VALUES('01','02', 1402);--parametrizacion para sede pereira
INSERT INTO userpermisos_requisiciones (empresa_id, centro_utilidad, usuario_id)
VALUES('01','01', 1402);--parametrizacion para sede cristo rey cali

INSERT INTO centros_operacion (empresa_id, centro_operacion_id, centro_operacion_descripcion)
VALUES(01, 002, 'SEDE PEREIRA');
INSERT INTO centros_operacion_x_cu (empresa_id,centro_operacion_id, centro_utilidad)
VALUES (01, 002, 02);



________________________________________________________________________
--prueba facturas
DELETE FROM facturas_impresion_masiva

_______________________________________________________________________
-- sacar evolucion de hc_diagnosticos_ingreso y egreso
SELECT 
he.*
FROM
hc_diagnosticos_ingreso he
JOIN hc_evoluciones e ON (he.evolucion_id = e.evolucion_id)
WHERE e.ingreso = 464114
_______________________________________________________________________________________

DECLARE
  identificador_detalle INTEGER;
  identificador_glosa INTEGER;
  aceptado NUMERIC;
  no_aceptado NUMERIC;
BEGIN
  IF TG_RELNAME = 'glosas_respuestas' THEN
    IF TG_OP = 'UPDATE' AND NEW.sw_cerrada = '1' THEN
      aceptado := ( SELECT CASE WHEN veps.valor_aceptado IS NULL THEN vgr.valor_aceptado
                                ELSE (vgr.valor_aceptado + veps.valor_aceptado) END AS valor_aceptado

                    FROM  (SELECT   SUM(valor_aceptado) AS valor_aceptado,
                                    glosa_id
                            FROM    glosas_respuestas
                            WHERE   glosa_id = OLD.glosa_id
                            AND     sw_cerrada = '1'
                            GROUP BY glosa_id) AS vgr
                         
                    LEFT JOIN (SELECT   CASE WHEN SUM(valor_aceptado) IS NULL THEN 0
                                        ELSE SUM(valor_aceptado) END AS valor_aceptado,
                                        glosa_id
                               FROM    glosas_respuestas_eps
                               WHERE   glosa_id = OLD.glosa_id
                               GROUP BY glosa_id) AS veps ON vgr.glosa_id = veps.glosa_id);  

      no_aceptado := (SELECT MIN(c.valor_no_aceptado) AS valor_no_aceptado
                      FROM (SELECT g.glosa_id,
                                   greatest(MAX(gr.fecha_registro), MAX(geps.fecha_registro)) AS fecha_respuesta,
                                   CASE WHEN greatest(MAX(gr.fecha_registro), MAX(geps.fecha_registro)) = MAX(gr.fecha_registro) THEN gr.valor_no_aceptado
                                        WHEN greatest(MAX(gr.fecha_registro), MAX(geps.fecha_registro)) = MAX(geps.fecha_registro) THEN geps.valor_no_aceptado
                                        WHEN greatest(MAX(gr.fecha_registro), MAX(geps.fecha_registro)) IS NULL THEN g.valor_pendiente
                                        ELSE 0
                                        end AS valor_no_aceptado
                            FROM glosas AS g
                            LEFT JOIN glosas_respuestas AS gr ON (g.glosa_id = gr.glosa_id)
                            LEFT JOIN glosas_respuestas_eps AS geps ON (g.glosa_id = geps.glosa_id)
                            WHERE g.glosa_id = OLD.glosa_id
                            GROUP BY g.glosa_id, gr.valor_no_aceptado, geps.valor_no_aceptado, g.valor_pendiente) AS C
                      WHERE EXISTS (SELECT greatest(MAX(gr.fecha_registro), MAX(geps.fecha_registro)) AS fecha_respuesta
                                    FROM glosas AS g
                                    LEFT JOIN glosas_respuestas AS gr ON (g.glosa_id = gr.glosa_id)
                                    LEFT JOIN glosas_respuestas_eps AS geps ON (g.glosa_id = geps.glosa_id)
                                    WHERE g.glosa_id = OLD.glosa_id));
      UPDATE  glosas
      SET     valor_aceptado  = aceptado,
              valor_no_aceptado = no_aceptado,
              valor_pendiente = no_aceptado
      WHERE glosa_id = OLD.glosa_id;        
    END IF;
  ELSIF TG_RELNAME = 'glosas_respuestas_factura_conceptos' AND NEW.sw_cerrada = '1' THEN
    aceptado := ( SELECT  SUM(valor_aceptado) AS valor_aceptado
                  FROM    glosas_respuestas_factura_conceptos
                  WHERE   glosa_detalle_factura_concepto_id = NEW.glosa_detalle_factura_concepto_id
                  AND     sw_cerrada = '1' );
    no_aceptado := (
                    SELECT  GR.valor_no_aceptado
                    FROM    glosas_respuestas_factura_conceptos GR,
                            (
                              SELECT  MAX(glosa_respuesta_factura_concepto_id) AS glosa_respuesta_factura_concepto_id   
                              FROM    glosas_respuestas_factura_conceptos
                              WHERE   glosa_detalle_factura_concepto_id = NEW.glosa_detalle_factura_concepto_id
                              AND     sw_cerrada = '1'
                            ) GA
                    WHERE   GR.glosa_respuesta_factura_concepto_id = GA.glosa_respuesta_factura_concepto_id   
                  );
                  
    UPDATE  glosas_detalle_factura_conceptos
    SET     valor_aceptado = aceptado,
            valor_no_aceptado = no_aceptado,
            codigo_concepto_general_rsp = NEW.codigo_concepto_general, 
            codigo_concepto_especifico_rsp = NEW.codigo_concepto_especifico 
    WHERE   glosa_detalle_factura_concepto_id = NEW.glosa_detalle_factura_concepto_id;
  ELSIF TG_RELNAME = 'glosas_respuestas_externa_conceptos' AND NEW.sw_cerrada = '1' THEN
    aceptado := ( SELECT  SUM(valor_aceptado) AS valor_aceptado
                  FROM    glosas_respuestas_externa_conceptos
                  WHERE   concepto_glosa_id = NEW.concepto_glosa_id
                  AND     glosa_id = NEW.glosa_id
                  AND     sw_cerrada = '1');
    no_aceptado := (
                    SELECT  GR.valor_no_aceptado
                    FROM    glosas_respuestas_externa_conceptos GR,
                            (
                              SELECT  MAX(glosa_respuesta_externa_concepto_id) AS glosa_respuesta_externa_concepto_id   
                              FROM    glosas_respuestas_externa_conceptos
                              WHERE   concepto_glosa_id = NEW.concepto_glosa_id
                              AND     glosa_id = NEW.glosa_id
                              AND     sw_cerrada = '1'
                            ) GA
                    WHERE   GR.glosa_respuesta_externa_concepto_id = GA.glosa_respuesta_externa_concepto_id   
                  );
                  
    UPDATE  glosas_externas_conceptos
    SET     valor_aceptado = aceptado,
            valor_no_aceptado = no_aceptado
    WHERE   concepto_glosa_id = NEW.concepto_glosa_id
    AND     glosa_id = NEW.glosa_id;
  ELSIF TG_RELNAME = 'glosas_respuestas_cargos' AND NEW.sw_cerrada = '1' THEN
    aceptado := ( SELECT  SUM(valor_aceptado) AS valor_aceptado
                  FROM    glosas_respuestas_cargos
                  WHERE   glosa_detalle_cargo_id = NEW.glosa_detalle_cargo_id
                  AND     sw_cerrada = '1'  
                );
    no_aceptado := (
                    SELECT  GR.valor_no_aceptado
                    FROM    glosas_respuestas_cargos GR,
                            (
                              SELECT  MAX(glosa_respuesta_cargo_id  ) AS glosa_respuesta_cargo_id
                              FROM    glosas_respuestas_cargos
                              WHERE   glosa_detalle_cargo_id = NEW.glosa_detalle_cargo_id
                              AND     sw_cerrada = '1'
                            ) GA
                    WHERE   GR.glosa_respuesta_cargo_id = GA.glosa_respuesta_cargo_id   
                  );

    UPDATE  glosas_detalle_cargos
    SET     valor_aceptado = aceptado,
            valor_no_aceptado = no_aceptado,
            codigo_concepto_general_rsp = NEW.codigo_concepto_general, 
            codigo_concepto_especifico_rsp = NEW.codigo_concepto_especifico 
    WHERE   glosa_detalle_cargo_id = NEW.glosa_detalle_cargo_id;

  ELSIF TG_RELNAME = 'glosas_respuestas_cuentas' AND NEW.sw_cerrada = '1' THEN 
    aceptado := ( SELECT  SUM(valor_aceptado) AS valor_aceptado
                  FROM    glosas_respuestas_cuentas
                  WHERE   glosa_detalle_cuenta_id = NEW.glosa_detalle_cuenta_id 
                  AND     sw_cerrada = '1'
                );

    no_aceptado := (
                    SELECT  GR.valor_no_aceptado
                    FROM    glosas_respuestas_cuentas GR,
                            (
                              SELECT  MAX(glosa_respuesta_cuenta_id) AS glosa_respuesta_cuenta_id
                              FROM    glosas_respuestas_cuentas
                              WHERE   glosa_detalle_cuenta_id = NEW.glosa_detalle_cuenta_id
                              AND     sw_cerrada = '1'
                            ) GA
                    WHERE   GR.glosa_respuesta_cuenta_id = GA.glosa_respuesta_cuenta_id   
                  );

    UPDATE  glosas_detalle_cuentas
    SET     valor_aceptado = aceptado,
            valor_no_aceptado = no_aceptado,
            codigo_concepto_general_rsp = NEW.codigo_concepto_general, 
            codigo_concepto_especifico_rsp = NEW.codigo_concepto_especifico 
    WHERE   glosa_detalle_cuenta_id = NEW.glosa_detalle_cuenta_id;

  ELSIF TG_RELNAME = 'glosas_respuestas_inventarios' AND NEW.sw_cerrada = '1' THEN
    aceptado := ( SELECT SUM(valor_aceptado) AS valor_aceptado
                  FROM    glosas_respuestas_inventarios
                  WHERE   glosa_detalle_inventario_id = NEW.glosa_detalle_inventario_id 
                  AND     sw_cerrada = '1'
                );
    no_aceptado := (
                    SELECT  GR.valor_no_aceptado
                    FROM    glosas_respuestas_inventarios GR,
                            (
                              SELECT  MAX(glosa_respuesta_inventario_id) AS glosa_respuesta_inventario_id
                              FROM    glosas_respuestas_inventarios
                              WHERE   glosa_detalle_inventario_id = NEW.glosa_detalle_inventario_id
                              AND     sw_cerrada = '1'
                            ) GA
                    WHERE   GR.glosa_respuesta_inventario_id = GA.glosa_respuesta_inventario_id   
                  );
    UPDATE  glosas_detalle_inventarios
    SET     valor_aceptado = aceptado,
            valor_no_aceptado = no_aceptado,
            codigo_concepto_general_rsp = NEW.codigo_concepto_general, 
            codigo_concepto_especifico_rsp = NEW.codigo_concepto_especifico 
    WHERE   glosa_detalle_inventario_id = NEW.glosa_detalle_inventario_id;

  END IF;
  RETURN NEW;
END


SELECT 
he.*
FROM
hc_diagnosticos_ingreso he
JOIN hc_evoluciones e ON (he.evolucion_id = e.evolucion_id)
WHERE e.ingreso = 464114



SELECT 
gl.glosa_id AS glosa_id_glosas, 
gl.prefijo AS prefijo_glosas, 
gl.factura_fiscal AS factura_fiscal_glosas, 
glre.glosa_id AS glosa_id_glosas_respuestas_eps, 
glre.prefijo AS prefijo_glosas_respuestas_eps, 
glre.numero AS numero_glosas_respuestas_eps,
glre.documento_id AS glosa_id_glosas_respuestas_eps,
glre.glosa_respuesta_eps_id AS glosa_respuesta_id_glosas_respuestas_eps
FROM 
glosas gl 
JOIN glosas_respuestas_eps glre ON (gl.glosa_id = glre.glosa_id)
WHERE gl.prefijo='CCR' 
AND gl.factura_fiscal IN(105278	,
149692	,
112082	,
174259	,
184158	,
88958	
)

DELETE FROM glosas_respuestas_eps_cargos WHERE glosa_respuesta_eps_id=107212;
DELETE FROM glosas_respuestas_eps_inventarios WHERE glosa_respuesta_eps_id=107212;
DELETE FROM glosas_respuestas_eps_cuentas WHERE glosa_respuesta_eps_id=107212;
DELETE FROM glosas_respuestas_eps WHERE glosa_respuesta_eps_id=107212;



UPDATE  glosas
      SET     valor_aceptado  = aceptado,
              valor_no_aceptado = no_aceptado,
              valor_pendiente = no_aceptado
      WHERE glosa_id = OLD.glosa_id;        
    END IF;





UPDATE glosas SET valor_pendiente=(SELECT valor_glosa FROM glosas WHERE glosa_id=157918) WHERE glosa_id=157918;


---------------------------------------------------------------- 
-- Ver producto desde cuentas detalle por medio del consecutivo del producto
SELECT 
ip.codigo_producto,
ip.descripcion,
ip.descripcion_abreviada,
ip.estado AS estado_producto,
bdd.consecutivo,
bdd.codigo_producto,
bdd.cantidad,
bdd.bodegas_doc_id,
bd.fecha AS fecha_bodegas_documentos,
bd.bodegas_doc_id,
bdn.bodega,
bdn.tipo_doc_bodega_id,
cd.transaccion,
cd.numerodecuenta,
cd.departamento,
cd.cargo,
cd.cantidad,
cd.facturado,
cd.fecha_cargo,
cd.sw_liq_manual,
cd.servicio_cargo,
s.descripcion,
s.ambito,
cd.consecutivo,
cd.departamento_al_cargar
FROM inventarios_productos ip 
JOIN bodegas_documentos_d bdd ON ip.codigo_producto = bdd.codigo_producto
JOIN bodegas_documentos bd ON bdd.bodegas_doc_id = bd.bodegas_doc_id
JOIN bodegas_doc_numeraciones bdn ON bdd.bodegas_doc_id = bdn.bodegas_doc_id
JOIN cuentas_detalle cd ON bdd.consecutivo = cd.consecutivo
JOIN servicios s ON cd.servicio_cargo = s.servicio
WHERE cd.numerodecuenta = 483625
ORDER BY bd.fecha


-- Ver producto desde cuentas detalle por medio del numero de cuenta
SELECT 
ip.codigo_producto,
ip.descripcion,
ip.descripcion_abreviada,
ip.estado AS estado_producto,
bdd.consecutivo,
bdd.codigo_producto,
bdd.cantidad,
bdd.bodegas_doc_id,
bd.fecha AS fecha_bodegas_documentos,
bd.bodegas_doc_id,
bdn.bodega,
bdn.tipo_doc_bodega_id,
cd.transaccion,
cd.numerodecuenta,
cd.departamento,
cd.cargo,
cd.cantidad,
cd.facturado,
cd.fecha_cargo,
cd.sw_liq_manual,
cd.servicio_cargo,
s.descripcion,
s.ambito,
cd.consecutivo,
cd.departamento_al_cargar
FROM cuentas_detalle cd 
JOIN servicios s ON cd.servicio_cargo = s.servicio
JOIN bodegas_documentos_d bdd ON cd.consecutivo = bdd.consecutivo
JOIN bodegas_documentos bd ON bdd.bodegas_doc_id = bd.bodegas_doc_id
JOIN bodegas_doc_numeraciones bdn ON bdd.bodegas_doc_id = bdn.bodegas_doc_id
JOIN inventarios_productos ip ON bdd.codigo_producto = ip.codigo_producto
WHERE cd.numerodecuenta = 483625
ORDER BY bd.fecha



DELETE FROM tmp_cuenta_insumos WHERE numerodecuenta=489311;



SELECT 
c.numerodecuenta,
c.transaccion,
c.cargo,
iv.codigo_producto,
iv.descripcion,
iv.estado as estado_producto,
CASE WHEN c.facturado= '1' THEN 'facturado' ELSE 'No Facturado' END AS facturado,
bdd.fecha,
c.cantidad,
c.precio AS vlr_unt,
c.valor_cargo AS vlr_total,
c.valor_nocubierto,
c.valor_cubierto,
c.sw_liq_manual,
bdd.fecha AS fecha_bodegas_documentos,
bdn.bodega,
c.fecha_cargo::date AS fecha_cargo,
c.fecha_registro::date AS fecha_registro,
su.nombre AS usuario_cargo,
d.descripcion AS departamento,
ig.descripcion AS grupo_actividad
FROM cuentas_detalle c
INNER JOIN bodegas_documentos_d bd ON c.consecutivo = bd.consecutivo
INNER JOIN bodegas_documentos bdd ON bd.bodegas_doc_id=bdd.bodegas_doc_id AND bd.numeracion=bdd.numeracion
INNER JOIN bodegas_doc_numeraciones bdn ON bdd.bodegas_doc_id = bdn.bodegas_doc_id
INNER JOIN inventarios_productos iv ON bd.codigo_producto::text = iv.codigo_producto::text 
INNER JOIN departamentos d ON c.departamento_al_cargar::text = d.departamento::text 
INNER JOIN system_usuarios su ON c.usuario_id = su.usuario_id 
INNER JOIN inv_grupos_inventarios ig ON iv.grupo_id=ig.grupo_id
WHERE 
--c.facturado='1'
--AND (c.sw_paquete_facturado IS NULL OR c.sw_paquete_facturado='1')
c.numerodecuenta = 476759
ORDER BY bdd.fecha, c.facturado


------------------------------------------------------------------------------------------------------
--Actualizar el profesional en ingresos_soat
UPDATE ingresos_soat SET tercero_id='1032407481' WHERE tercero_id='10324074812'



SELECT 
ip.codigo_producto,
ip.descripcion,
ip.descripcion_abreviada,
ip.estado AS estado_producto,
bdd.consecutivo,
bdd.codigo_producto,
bdd.cantidad,
bdd.bodegas_doc_id,
bdd.total_costo,
bdd.total_costo_inv,
(bdd.total_costo - bdd.total_costo_inv) AS diferencia,
bd.fecha AS fecha_bodegas_documentos,
bd.bodegas_doc_id,
bdn.bodega,
bdn.tipo_doc_bodega_id,
cd.transaccion,
cd.numerodecuenta,
cd.departamento,
cd.cargo,
cd.cantidad,
CASE WHEN cd.facturado= '1' THEN 'facturado' ELSE 'No Facturado' END AS facturado,
cd.fecha_cargo,
cd.sw_liq_manual,
cd.servicio_cargo,
s.descripcion,
s.ambito,
cd.consecutivo,
cd.departamento_al_cargar
FROM cuentas_detalle cd
LEFT JOIN bodegas_documentos_d bdd     ON cd.consecutivo = bdd.consecutivo
LEFT JOIN bodegas_documentos bd        ON bdd.bodegas_doc_id=bd.bodegas_doc_id AND bdd.numeracion=bd.numeracion
LEFT JOIN bodegas_doc_numeraciones bdn ON bd.bodegas_doc_id = bdn.bodegas_doc_id
LEFT JOIN inventarios_productos ip     ON bdd.codigo_producto::text = ip.codigo_producto::text 
LEFT JOIN departamentos d              ON cd.departamento_al_cargar::text = d.departamento::text 
LEFT JOIN system_usuarios su           ON cd.usuario_id = su.usuario_id 
LEFT JOIN inv_grupos_inventarios ig    ON ip.grupo_id=ig.grupo_id
LEFT JOIN servicios s ON cd.servicio_cargo = s.servicio
WHERE 
--c.facturado='1'
--AND (c.sw_paquete_facturado IS NULL OR c.sw_paquete_facturado='1')
cd.numerodecuenta = 227713
ORDER BY bd.fecha, cd.facturado


--_______________________________________________________________________
-- Para agregar la consulta de documentos en Transacciones de bodega 
-- Entramos a Empresas - Administracion y seguimos la ruta y le asignamos al usuario la bodega y el documento que necesita validar



-- update para actualizar el usuario de walosoca2 al walosoca --
UPDATE hc_evoluciones SET usuario_id=2726 WHERE usuario_id=2442;
UPDATE ingresos_soat SET tercero_id='1032407481' WHERE tercero_id='1032407481-0';


_______________________________________________________________________________________
-- traer ingresos_soat a partir de una ccr
SELECT 
ffc.prefijo,
ffc.factura_fiscal,
cue.numerodecuenta,
ing.ingreso,
ins.evento,
ins.tipo_id_tercero,
ins.tercero_id,
pro.nombre
FROM
fac_facturas_cuentas ffc
INNER JOIN cuentas cue ON ffc.numerodecuenta = cue.numerodecuenta
INNER JOIN ingresos ing ON cue.ingreso = ing.ingreso
INNER JOIN ingresos_soat ins ON cue.ingreso = ins.ingreso
INNER JOIN profesionales pro ON ins.tercero_id = pro.tercero_id
WHERE ffc.prefijo='CCR' AND ffc.factura_fiscal=145137


UPDATE ingresos_soat SET tipo_id_tercero='CC', tercero_id='31574690' WHERE ingreso= AND evento= AND tercero_id='';


________________________________________________________________________________________________
UPDATE hc_evoluciones SET usuario_id=1728 WHERE usuario_id=2795



1797368,
1797253,
1797603,
1803350,
1798899,
1801066,
1801072,
1799061,
1801747,
1802085,
1802523,
1810003,
1806589,
1807816,
1808246,
1806336,
1809833,
1804276,
1805825


____________________________________________________________________________________________
-- CONSULTAR quien modifico la historia clinica

SELECT 
hcl.usuario,
syu.nombre AS nombre_que_modifico,
syu.descripcion,
syu.activo,
hcl.fecha,
hcl.estado_v,
hcl.ingreso_n,
hcl.tipo_hc,
ing.paciente_id,
(pac.primer_nombre ||' '|| pac.segundo_nombre ||' '|| pac.primer_apellido ||' '|| pac.segundo_apellido ) AS full_name_paciente,
cue.numerodecuenta,
cue.plan_id,
pla.plan_descripcion
FROM 
hc_log hcl
INNER JOIN system_usuarios syu  ON hcl.usuario = syu.usuario_id
INNER JOIN ingresos ing         ON hcl.ingreso_n = ing.ingreso
INNER JOIN pacientes pac        ON ing.paciente_id = pac.paciente_id
INNER JOIN cuentas cue          ON ing.ingreso = cue.ingreso
INNER JOIN planes pla           ON cue.plan_id = pla.plan_id
WHERE 
cue.numerodecuenta = 75537
ORDER BY hcl.fecha


SELECT 
hcl.usuario,
syu.nombre AS nombre_que_modifico,
syu.descripcion,
syu.activo,
hcl.fecha,
hcl.estado_v,
hcl.ingreso_n,
hcl.tipo_hc,
ing.paciente_id,
(pac.primer_nombre ||' '|| pac.segundo_nombre ||' '|| pac.primer_apellido ||' '|| pac.segundo_apellido ) AS full_name_paciente,
cue.numerodecuenta,
cue.plan_id,
pla.plan_descripcion
FROM 
hc_log hcl
INNER JOIN system_usuarios syu  ON hcl.usuario = syu.usuario_id
INNER JOIN ingresos ing         ON hcl.ingreso_n = ing.ingreso
INNER JOIN pacientes pac        ON ing.paciente_id = pac.paciente_id
INNER JOIN cuentas cue          ON ing.ingreso = cue.ingreso
INNER JOIN planes pla           ON cue.plan_id = pla.plan_id
WHERE 
hcl.ingreso_n = 72097
ORDER BY hcl.fecha


10430
,10431
,10432
,10433
,10434
,10435
,10436
,10437
,10438
,10439
,10440
,10441


_______________________________________________________________________________________________
-- IDENTIFICAR LOS USUARIOS Y DEPARTAMENTOS DE LA TABLA departamentos_cc
SELECT
sysdepcc.usuario_id,
sysdepcc.departamento,
CASE WHEN sysdepcc.sw_estado= '1' THEN 'activo' ELSE 'desactivado' END AS activo_user_en_deparcc,
sysus.nombre,
sysus.descripcion,
CASE WHEN sysus.activo= '1' THEN 'activo' ELSE 'desactivado' END AS activo_user_system,
depcc.descripcion,
CASE WHEN depcc.sw_estado= '1' THEN 'activo' ELSE 'desactivado' END AS activo_depa_cc
FROM
system_usuarios_departamentos_cc sysdepcc
INNER JOIN system_usuarios sysus ON sysdepcc.usuario_id = sysus.usuario_id
INNER JOIN departamentos_control_cuentas depcc ON sysdepcc.departamento = depcc.departamento
ORDER BY sysdepcc.departamento


SELECT
glo.glosa_id AS glosa_id_glosa,
glo.prefijo AS prefijo_glosa,
glo.factura_fiscal AS factura_fiscal_glosa,
glo.valor_glosa AS valor_glosa_glosa,
glo.valor_aceptado AS valor_aceptado_glosa,
glo.auditor_id AS auditor_id_glosa,
sysu.nombre AS nombre_glosa,
glo.fecha_registro AS fecha_registro_glosa,
glo.valor_no_aceptado AS valor_no_aceptado_glosa,
glo.valor_pendiente AS valor_pendiente_glosa,
glo.fecha_respuesta AS fecha_respuesta_glosa,
glo.prefijo_glosa AS prefijo_glosa_glosa,
glo.numero AS numero_glosa,
glrips.valor_aceptado AS valor_aceptado_IPS,
glrips.valor_no_aceptado AS valor_no_aceptado_IPS,
glrips.valor_pendiente AS valor_pendiente_IPS,
glrips.usuario_id AS usuario_id_IPS,
sysu2.nombre AS nombre_IPS,
glrips.observacion AS observacion_IPS,
glrips.fecha_registro AS fecha_registro_IPS,
glrips.fecha_confirmacion AS fecha_confirmacion_IPS,
sysu3.nombre AS nombre_IPS,
glrips.usuario_confirmacion AS usuario_confirmacion_IPS,
glreps.valor_aceptado AS valor_aceptado_EPS,
glreps.valor_no_aceptado AS valor_no_aceptado_EPS,
glreps.prefijo AS prefijo_EPS,
glreps.numero AS numero_EPS,
glreps.observacion AS observacion_EPS,
glreps.usuario_id AS usuario_id_EPS,
sysu4.nombre AS nombre_EPS,
glreps.fecha_registro AS fecha_registro_EPS
FROM glosas glo
LEFT JOIN glosas_respuestas glrips ON glo.glosa_id = glrips.glosa_id
LEFT JOIN glosas_respuestas_eps glreps ON glo.glosa_id = glreps.glosa_id
LEFT JOIN system_usuarios sysu ON glo.auditor_id = sysu.usuario_id
LEFT JOIN system_usuarios sysu2 ON glrips.usuario_id = sysu2.usuario_id
LEFT JOIN system_usuarios sysu3 ON glrips.usuario_confirmacion = sysu3.usuario_id
LEFT JOIN system_usuarios sysu4 ON glrips.usuario_id = sysu4.usuario_id
WHERE glo.prefijo= 'FC' 
AND glo.factura_fiscal IN(
  5654, 6440, 6500, 1044, 4272, 2, 117, 6707
)
ORDER BY glo.prefijo, glo.factura_fiscal




_______________________________________________________________________
UPDATE relacion_cuentas_detalle SET estado='E' WHERE relacion_id=208746

----------------------
SELECT
acg.prefijo,
acg.numero,
acgd.acta_conciliacion_id,
acgd.prefijo,
acgd.factura_fiscal,
acgd.glosa_id,
g.prefijo_glosa,
g.numero
FROM 
actas_conciliacion_glosas_detalle acgd
LEFT JOIN actas_conciliacion_glosas acg ON acgd.acta_conciliacion_id = acg.acta_conciliacion_id
LEFT JOIN glosas g ON acgd.glosa_id = g.glosa_id
WHERE
acg.prefijo='CGL' AND
acg.numero IN(861	,
863	,
868	,
869	,
870	,
872	,
876	,
879	,
880	,
882	,
886	,
891	,
892	,
894	,
900	,
901	,
902	,
905	,
906	,
907	,
908	,
913	,
915	,
951	,
957	,
958	,
978	)
ORDER BY acg.prefijo, acg.numero, acgd.acta_conciliacion_id


_______________________________________________________________________
-- TOMA FISICA EN OBSERVACION URGENCIAS

--INICIO
UPDATE
bodegas_estaciones
SET
bodega = 'BF'
WHERE 
	sw_bodega_principal = '1'
    AND bodega = 'OU'

--FIN
UPDATE
bodegas_estaciones
SET
bodega = 'OU'
WHERE estacion_id IN ( 'OBSE', 'URG8', 'OBS8')



_______________________________________________________________________
-- TOMA FISICA EN FARMACIA CENTRAL

--INICIO
UPDATE
bodegas_estaciones
SET
bodega = 'OU'
WHERE 
	sw_bodega_principal = '1'
    AND bodega = 'BF'

--FIN
UPDATE
bodegas_estaciones
SET
bodega = 'BF'
WHERE 
	sw_bodega_principal = '1'
    AND bodega = 'OU'
    AND estacion_id IN ( 
'CX01',
'HP3',
'HP4',
'HP5',
'HP6',
'HPV8',
'UCP4',
'UP3',
'UP5',
'UP6',
'UP7A',
'UP7B',
'UP7C',
'URGC',
'VUC3',
'VUC4',
'VUC5',
'VUC6',
'VUC7',
'VUCN')


_________________________________________________________________________________________________________
query para tefy
en la tabla documentos_x_resoluciones se debe actualizar la resolucion
11 73 01 178682 5000000
Resolución de facturación No. 18764031861441 de julio 28 de 2022, autoriza consecutivo CCR 178682 al CCR 5000000, vigencia
de la autorización: 12 meses	
2022-07-28	
2023-07-28	
18764031861441
2412

Por

11 73 01 178682 5000000
Gran contribuyente resolucion 012220 de Diciembre 26 de 2022, resolución de facturación No. 18764031861441 de julio 28 de 2022, autoriza consecutivo CCR 178682 al CCR 5000000, vigencia
de la autorización: 12 meses	
2022-07-28	
2023-07-28	
18764031861441
2412




__________________________________________________________________________________________________________

UPDATE inventarios_productos SET opc_costo_producto='3'  WHERE codigo_producto IN(
'0102010155',
'0102080011',
'0102070036',
'0102010145',
'0102140001',
'0102010207',
'0101020188',
'0102070047',
'0102010131',
'0101070007',
'0102010154',
'0102010124',
'0102010098',
'0102110012',
'0102010086',
'0102010210',
'0102010232',
'0102010256',
'0102030003',
'0102010238',
'0102030005',
'0102010135',
'0102010081',
'0101010039',
'0102070006',
'0102060002',
'0101070024')

UPDATE estaciones_enfermeria_usuarios SET estacion_perfil_id='15' WHERE usuario_id=3126

___________________________________________________________________________________________________________
--El reporte que pide Valeria.

 SELECT a.numerodecuenta,
    a.fecha_registro::date AS fecha_cuenta,
	ig.ingreso,
    ig.fecha_ingreso::date AS fecha_ingreso,
	ig.tipo_id_paciente,
    ig.paciente_id,
	ff.prefijo,
	ff.factura_fiscal,
	CASE  WHEN ff.estado = '0' THEN 'FACTURADO'
	WHEN ff.estado = '1' THEN 'PAGADO'
	WHEN ff.estado = '2' THEN 'ANULADO'
	WHEN ff.estado = '3' THEN 'ANULADA CON NOTA'
	WHEN ff.estado IS NULL THEN 'SIN FACTURA'
	ELSE 'SIN ESTADO'
	END AS estado_factura,
	ff.fecha_registro AS fecha_factura,
    ce.descripcion AS estado_cuenta,
	a.fecha_cierre::date AS fec_cierre_cta, 
    cd.departamento,
    cd.cargo_prod,
	cd.descripcion,
    cd.grupo_actividad,
	g.tipo_tercero_id,
    g.tercero_id,
	g.plan_descripcion,
    cd.cantidad,
    cd.vlr_unt,
    cd.vlr_total,
    cd.valor_nocubierto,
    cd.valor_cubierto,
    cd.cargo_cups,
	cd.desc_cargo_cups,
	cd.fecha_cargo,
    cd.fecha_registro,
	ins.fecha_registro::date as fecha_registro_salida,
	cd.departamento_solicitud,
	cd.cargo_procedimiento,
	cd.desc_procedimiento,
	cd.consecutivo_procedimiento,
	cd.secuencia,
	cd.porcentaje,
	cd.tipo_cargo_qx_id,
	cd.cargo_cups_proced,
	cd.desc_cargo_cups_proced,
	cd.suma_proc
	--cd.identifacion_cirujano,
	--cd.nombre_cirujano,
	--cd.especialidad
	
   FROM ( SELECT c.numerodecuenta,
            c.cargo as cargo_prod,
            c.cargo_cups,
			cu.descripcion as desc_cargo_cups,
            c.tarifario_id,
            e.descripcion,
            c.cantidad,
            c.precio AS vlr_unt,
            c.valor_cargo AS vlr_total,
            c.valor_nocubierto,
            c.valor_cubierto,
            c.fecha_cargo::date AS fecha_cargo,
            c.fecha_registro::date AS fecha_registro,
            d.descripcion AS departamento,
            f.descripcion AS grupo_actividad,
			c.departamento_solicitud,
            qx.cargo AS cargo_procedimiento,
            tdq.descripcion AS desc_procedimiento,
			qx.consecutivo_procedimiento,
			qx.secuencia,
			qx.porcentaje,
			qx.tipo_cargo_qx_id,
			qxc.cargo_cups AS cargo_cups_proced,
			cup.descripcion AS desc_cargo_cups_proced,
			ab.suma_proc
			--pro.tipo_id_tercero||' '||pro.tercero_id AS identifacion_cirujano,
			--pro.nombre as nombre_cirujano,
			--esp.descripcion as especialidad

           FROM cuentas_detalle c
             JOIN departamentos d ON c.departamento::text = d.departamento::text
             JOIN tarifarios_detalle e ON c.cargo::text = e.cargo::text AND c.tarifario_id::text = e.tarifario_id::text
             JOIN grupos_tipos_cargo f ON e.grupo_tipo_cargo::text = f.grupo_tipo_cargo::text
			 LEFT JOIN cups cu ON c.cargo_cups=cu.cargo
             LEFT JOIN cuentas_cargos_qx_procedimientos qx ON c.transaccion = qx.transaccion
             LEFT JOIN tarifarios_detalle tdq ON qx.cargo::text = tdq.cargo::text AND qx.tarifario_id::text = tdq.tarifario_id::text
			 LEFT JOIN (SELECT SUM (cd.precio) AS suma_proc,qx.cargo,qx.consecutivo_procedimiento,qx.secuencia
				FROM cuentas_detalle cd,
				cuentas_cargos_qx_procedimientos qx
				WHERE qx.transaccion=cd.transaccion
				GROUP BY 2,3,4
				ORDER BY 2
				) ab ON  (ab.cargo=qx.cargo AND ab.consecutivo_procedimiento=qx.consecutivo_procedimiento AND ab.secuencia=qx.secuencia)
			 LEFT JOIN cuentas_liquidaciones_qx_procedimientos qxc ON (qx.consecutivo_procedimiento=qxc.consecutivo_procedimiento)
			 LEFT JOIN cups cup ON (qxc.cargo_cups=cup.cargo)
			--LEFT JOIN profesionales as pro ON pro.tercero_id = qxc.cirujano_id AND qxc.tipo_id_cirujano=pro.tipo_id_tercero
			--LEFT JOIN profesionales_especialidades as pe ON pe.tercero_id = pro.tercero_id AND pe.tipo_id_tercero=pro.tipo_id_tercero
			--LEFT JOIN especialidades as esp ON esp.especialidad = pe.especialidad
          WHERE c.consecutivo IS NULL
		  AND c.facturado='1'
		  AND (c.sw_paquete_facturado IS NULL OR c.sw_paquete_facturado='1')
        UNION ALL
         SELECT c.numerodecuenta,
            iv.codigo_producto AS cargo_prod,
            ''::character varying AS cargo_cups,
			 ''::character varying AS desc_cargo_cups,
            'IMD'::character varying AS tarifario_id,
            c.descripcion,
            c.cantidad,
            c.valor_cargo AS vlr_unt,
            c.valor_cargo AS vlr_total,
            0 AS valor_nocubierto,
            c.valor_cubierto,
            c.fecha_cargo::date AS fecha_cargo,
            c.fecha_cargo::date AS fecha_registro,
            c.departamento_descripcion AS departamento,
            ig.descripcion AS grupo_actividad,
			''::character varying AS departamento_solicitud,
            ''::character varying AS cargo_procedimiento,
            ''::character varying AS desc_procedimiento,
			0 AS consecutivo_procedimiento,
			''::character varying AS secuencia,
			0 AS porcentaje,
			''::character varying AS tipo_cargo_qx_id,
			''::character varying AS cargo_cups_proced,
			''::character varying AS desc_cargo_cups_proced,
			0 AS suma_proc
			--''::character varying AS identifacion_cirujano,
			--''::character varying AS nombre_cirujano,
			--''::character varying AS especialidad
           FROM view_cuentas_detalle_productos c
           INNER JOIN inventarios_productos iv ON c.codigo_producto::text = iv.codigo_producto::text 
           INNER JOIN inv_grupos_inventarios ig ON iv.grupo_id=ig.grupo_id
		) cd,
    cuentas a
	INNER JOIN cuentas_estados ce ON a.estado = ce.estado
    INNER JOIN ingresos ig ON a.ingreso = ig.ingreso 
	INNER JOIN planes g ON a.plan_id = g.plan_id 
	LEFT JOIN ingresos_salidas ins ON ig.ingreso=ins.ingreso
	LEFT JOIN (
                    select  f.*,
                            ffc.numerodecuenta
                    from    fac_facturas f
                        left join fac_facturas_cuentas ffc on (f.empresa_id = ffc.empresa_id and f.prefijo = ffc.prefijo and f.factura_fiscal = ffc.factura_fiscal)
                    where f.estado NOT IN ('2','3')
					and f.tipo_factura != '0'
                ) ff on (ff.numerodecuenta = a.numerodecuenta)
  WHERE a.numerodecuenta = cd.numerodecuenta
  AND a.numerodecuenta IN (
'217084',
'218656',
'220025',
'220054',
'220055',
'220174'
  )


  -----------------------------------------------------------------------------------------
  -- REPORTE LARISA
SELECT
g.glosa_id, g.prefijo ||' '|| g.factura_fiscal AS factura, g.prefijo_glosa ||' '|| g.numero AS documento_glosa,  
p.tipo_id_paciente ||' '|| p.paciente_id AS id_paciente,
tit.descripcion as entidad_identificacion_tipo,
pl.tercero_id as entidad_id,
pl.plan_descripcion AS entidad, 
ru.nombre AS usuario_registra,
g.fecha_glosa, 
g.fecha_registro::date, 
gtc.descripcion AS Clasificacion_Glosa, 
g.codigo_concepto_general AS cod_concepto_gral, 
gcg.descripcion_concepto_general AS concepto_general,  
g.codigo_concepto_especifico AS cod_concepto_especifico, 
gce.descripcion_concepto_especifico AS concepto_especifico, 
gre.fecha_registro AS Fecha_Registro,
gre.fecha_ratificacion,
gre.glosa_respuesta_eps_id AS Glosas_Respuesta_EPS,

    (SELECT rg.fecha_registro           
       FROM glosas_respuestas rg
       WHERE g.glosa_id = rg.glosa_id 
           LIMIT 1),
    (SELECT CASE WHEN rg.glosa_respuesta_id IS NOT NULL THEN 'CON RESPUESTA'
            ELSE 'SIN RESPUESTA' END AS respuesta 
            FROM glosas_respuestas rg
            WHERE g.glosa_id = rg.glosa_id 
            LIMIT 1),
    (SELECT su.nombre AS usuario_respuesta
            FROM system_usuarios su, glosas_respuestas rg
            WHERE su.usuario_id = rg.usuario_id 
            AND g.glosa_id = rg.glosa_id
            LIMIT 1), 
    (SELECT to_char(rg.fecha_registro, 'dd/mm/YYYY') as fecha_respuesta          
       FROM glosas_respuestas rg
       WHERE g.glosa_id = rg.glosa_id 
           LIMIT 1),        
    (SELECT to_char(rg.fecha_registro, 'hh24:mi:ss') as hora_respuesta          
       FROM glosas_respuestas rg
       WHERE g.glosa_id = rg.glosa_id 
           LIMIT 1),           
CASE WHEN g.sw_estado= '0' THEN 'ANULADA'
     WHEN g.sw_estado='1' THEN 'SIN RESPUESTA'
     WHEN g.sw_estado= '2' THEN 'CON RESPUESTA'
     WHEN g.sw_estado= '3' THEN 'CERRADA'
     WHEN g.sw_estado= '4' THEN 'RATIFICADA'
     END AS estado_glosa, 
ff.total_factura,
g.valor_glosa, 
SUM(gri.valor_aceptado) as valor_aceptado, 
(ff.total_factura-g.valor_aceptado)AS valor_pagar,
gre.prefijo ||' '|| gre.numero AS id_respuesta_glosa_eps, 
gre.valor_aceptado, 
gre.valor_no_aceptado
FROM
glosas g
LEFT JOIN glosas_respuestas gri ON g.glosa_id=gri.glosa_id
LEFT JOIN glosas_respuestas_eps gre ON g.glosa_id=gre.glosa_id
INNER JOIN fac_facturas ff ON ff.factura_fiscal=g.factura_fiscal AND ff.prefijo=g.prefijo
INNER JOIN fac_facturas_cuentas ffc ON ffc.factura_fiscal=ff.factura_fiscal AND ffc.prefijo=ff.prefijo
INNER JOIN cuentas c ON c.numerodecuenta=ffc.numerodecuenta
INNER JOIN planes pl ON pl.plan_id=ff.plan_id 
INNER JOIN ingresos i ON i.ingreso=c.ingreso
INNER JOIN pacientes p ON p.paciente_id=i.paciente_id AND p.tipo_id_paciente=i.tipo_id_paciente
INNER JOIN glosas_tipos_clasificacion gtc ON gtc.glosa_tipo_clasificacion_id=g.glosa_tipo_clasificacion_id
LEFT JOIN glosas_concepto_general gcg ON gcg.codigo_concepto_general=g.codigo_concepto_general
LEFT JOIN glosas_concepto_especifico gce ON gce.codigo_concepto_especifico=g.codigo_concepto_especifico
LEFT JOIN system_usuarios as ru ON g.usuario_id = ru.usuario_id
LEFT JOIN tipo_id_terceros as tit ON pl.tipo_tercero_id = tit.tipo_id_tercero
--WHERE g.fecha_glosa BETWEEN _1 AND _2
WHERE g.fecha_glosa BETWEEN '2016-01-01' AND now()

GROUP BY g.glosa_id, p.tipo_id_paciente, p.paciente_id, pl.plan_descripcion, tit.descripcion, pl.tercero_id,
ru.nombre, g.fecha_glosa, 
g.fecha_registro, 
gtc.descripcion, 
g.codigo_concepto_general, 
gcg.descripcion_concepto_general,  
g.codigo_concepto_especifico, 
gce.descripcion_concepto_especifico, ff.total_factura, gre.prefijo, gre.numero, gre.valor_aceptado, gre.valor_no_aceptado, gre.fecha_ratificacion, gre.fecha_registro, gre.glosa_respuesta_eps_id
_______________________________________________________________________________________

--insert con consulta permiso de medicos
INSERT INTO estaciones_enfermeria_usuarios_componentes(estacion_id, usuario_id, estacion_componente_id, sw_permiso)
SELECT estacion_id, 1805, 60, 1 
FROM estaciones_enfermeria_usuarios 
WHERE usuario_id = 1805;

____________________________________________________________________________________________________________

INSERT INTO envios_glosas_detalle(envio_id, prefijo, factura_fiscal, empresa_id, glosa_id, valor) 
VALUES (9221, 'CCR', factura_fiscal,'01', glosa_id, valor)


_____________________________________________________________________________________________________________

UPDATE inv_bodegas_movimiento
SET fecha_registro= '2023-02-28'
WHERE prefijo = 'IFR'
AND numero in (34555	,
34556	,
34557	,
34558	,
34559	,
34560	,
34561	,
34562	,
34563	,
34564	,
34565	,
34567	,
34568	,
34569	,
34570	,
34571	,
34572	,
34573	,
34574	,
34575	,
34576	,
34577	,
34578	,
34579	,
34580	,
34581	,
34582	,
34583	,
34584	,
34585	,
34586	,
34587	,
34588	,
34589	,
34590	,
34591	,
34592	,
34593	,
34594	,
34595	,
34596	,
34597	,
34598	,
34599	,
34600	,
34601	,
34602	,
34603	
);


_______________________________________________________________________


SELECT 
pro.tercero_id,
syu.nombre AS nombre_SYU,
pro.nombre AS nombre_PROF,
syu.descripcion AS cargo,
tip.descripcion AS nombre_tipo_profesional,
esp.descripcion AS nombre_esp,
CASE WHEN syu.activo = '1' THEN 'activo' WHEN syu.activo = '0' THEN 'inactivo' END AS estado,
CASE WHEN pro.estado = '1' THEN 'activo' WHEN pro.estado = '0' THEN 'inactivo' END AS estado_profesional
FROM system_usuarios syu
LEFT JOIN profesionales pro ON syu.usuario_id = pro.usuario_id
LEFT JOIN tipos_profesionales tip ON pro.tipo_profesional = tip.tipo_profesional
LEFT JOIN profesionales_especialidades pre ON pro.tercero_id = pre.tercero_id
LEFT JOIN especialidades esp ON pre.especialidad = esp.especialidad


SELECT 
pro.tercero_id,
syu.usuario_id,
syu.usuario,
syu.nombre AS nombre_SYU,
pro.nombre AS nombre_PROF,
syu.descripcion AS cargo,
tip.descripcion AS nombre_tipo_profesional,
esp.descripcion AS nombre_esp,
CASE WHEN syu.activo = '1' THEN 'activo' WHEN syu.activo = '0' THEN 'inactivo' END AS estado,
CASE WHEN pro.estado = '1' THEN 'activo' WHEN pro.estado = '0' THEN 'inactivo' END AS estado_profesional
FROM system_usuarios_perfiles sys
LEFT JOIN system_usuarios syu ON sys.usuario_id = syu.usuario_id
LEFT JOIN profesionales pro ON syu.usuario_id = pro.usuario_id
LEFT JOIN tipos_profesionales tip ON pro.tipo_profesional = tip.tipo_profesional
LEFT JOIN profesionales_especialidades pre ON pro.tercero_id = pre.tercero_id
LEFT JOIN especialidades esp ON pre.especialidad = esp.especialidad

SELECT  MAX(GR.glosa_respuesta_id ) AS  glosa_respuesta_id 	,
                  ED.id
          FROM    envios_glosas_detalle AS ED,
                  envios_glosas EG,
                  glosas_respuestas GR
          WHERE   ED.glosa_id = GR.glosa_id 
          AND     ED.envio_id = EG.envio_id
          AND     EG.fecha_registro >= GR.fecha_registro


SELECT 
TO_CHAR(MAX(sul.fecha), 'dd-mm-yyyy') AS fecha_log,
sul.usuario_id,
sys.usuario,
sys.nombre
FROM system_usuarios_log sul
JOIN system_usuarios sys ON sul.usuario_id = sys.usuario_id
WHERE sys.activo = '1'
GROUP BY sul.usuario_id, sys.nombre, sys.usuario


______________________________________________________________________________________________________________

INSERT
INTO (
  cargo	
  ,descripcion	
  ,grupo_tarifario_id	
  ,subgrupo_tarifario_id	
  ,grupo_tipo_cargo	
  ,tipo_cargo	
  ,nivel	
  ,concepto_rips	
  ,precio	
  ,gravamen	
  ,sw_cantidad	
  ,sw_honorarios	
  ,sw_uvrs	
  ,nivel_autorizador_id	
  ,sw_pos	
  ,grupos_mapipos	
  ,grupo_qx	
  ,sw_bilateral	
  ,sw_internacion	
  ,sw_estado	
  ,sw_costo_variable	
  ,sw_notaoperatoria	
  ,sw_activo	
  ,sw_estadoa	
  ,sw_vacuna	
  ,sw_odontologia	
  ,sexo_id	
  ,sw_parto	
  ,sw_add_perfusion	
  ,sw_add_hemodilucion	
  ,sw_requiere_comentario	
  ,bys_producto_id
)
VALUES
(

)

=CONCATENAR("INSERT INTO (cargo,descripcion,grupo_tarifario_id,subgrupo_tarifario_id,grupo_tipo_cargo,tipo_cargo,nivel,concepto_rips,precio,gravamen,sw_cantidad,sw_honorarios,sw_uvrs,nivel_autorizador_id,sw_pos,grupos_mapipos,grupo_qx,sw_bilateral,sw_internacion,sw_estado,sw_costo_variable,sw_notaoperatoria,sw_activo,sw_estadoa,sw_vacuna,sw_odontologia,sexo_id,sw_parto,sw_add_perfusion,sw_add_hemodilucion,sw_requiere_comentario,bys_producto_id) VALUES()")
=CONCATENAR("INSERT INTO cups VALUES()")

=CONCATENAR("INSERT INTO cups(";$A$1;",";$B$1;",";$C$1;",";$D$1;",";$E$1;",";$F$1;",";$G$1;",";$H$1;",";$I$1;",";$J$1;",";$K$1;",";$L$1;",";$M$1;",";$N$1;",";$O$1;",";$P$1;",";$Q$1;",";$R$1;",";$S$1;",";$T$1;",";$U$1;",";$V$1;",";$W$1;",";$X$1;",";$Y$1;",";$Z$1;",";$AA$1;",";$AB$1;",";$AC$1;",";$AD$1;",";$AF$1;") VALUES('";A2;"','";B2;"','";C2;"','";D2;"','";E2;"','";F2;"','";G2;"','";H2;"',";I2;",";J2;",'";K2;"','";L2;"','";M2;"','";N2;"','";O2;"','";P2;"','";Q2;"','";R2;"',";S2;",'";T2;"','";U2;"','";V2;"','";W2;"','";X2;"','";Y2;"','";Z2;"','";AA2;"','";AB2;"','";AC2;"','";AD2;"','";AF2;"')")



UPDATE glosas SET sw_estado=3 , valor_pendiente=0 WHERE glosa_id= AND prefijo_glosa='GLF' AND numero=




SELECT numerodecuenta, consecutivo FROM cuentas_detalle WHERE numerodecuenta=526528 AND consecutivo IS NOT NULL


________________________________________________________________________________________________________________
-- conocer los productos a partir de la cuenta

SELECT 
invp.descripcion,
bdd.cantidad,
bdd.total_costo_inv,
bdd.total_costo,
cud.numerodecuenta,
cud.transaccion,
cud.consecutivo,
cud.precio,
cud.cantidad
FROM
cuentas_detalle cud
LEFT JOIN bodegas_documentos_d bdd ON cud.consecutivo = bdd.consecutivo
LEFT JOIN inventarios_productos invp ON bdd.codigo_producto = invp.codigo_producto
WHERE numerodecuenta = 443930
ORDER BY invp.descripcion




DELETE FROM bodegas_documentos WHERE bodegas_doc_id=31

DELETE FROM bodegas_documentos WHERE bodegas_doc_id=32


 
SELECT * FROM bodegas_documentos WHERE bodegas_doc_id=31

DELETE FROM tarifarios_equivalencias WHERE tarifario_id='0017'
DELETE FROM tarifarios_detalle WHERE tarifario_id='0017'



HA OCURRIDO UN ERROR AL MOMENTO DE CREAR EL ACTA
ERROR:  la suma de los valores aceptados y no aceptados es mayor que el valor de la glosa 80881
CONTEXT:  función PL/pgSQL verificar_valor_glosa() en la línea 26 en RAISE
sentencia SQL: «UPDATE  glosas
      SET     valor_pendiente = valorp,
              sw_estado = estado
      WHERE   glosa_id = OLD.glosa_id»
función PL/pgSQL actualizar_valor_glosas() en la línea 95 en sentencia SQL
<br>UPDATE glosas 
SET    valor_no_aceptado = 173462815.00 - 59924,        
valor_pendiente = 173462815.00 - 59924 
WHERE  glosa_id = 80881 

____________________________________________________________________________________________________________________
DECLARE 
    valor_glosa_aux NUMERIC(12,2); 
    valor_aceptado_aux NUMERIC(12,2);
    valor_no_aceptado_aux NUMERIC(12,2); 
    glosa_aux integer;
BEGIN
    IF TG_OP = 'UPDATE' THEN

        glosa_aux := (SELECT glosa_id
                        FROM glosas
                        WHERE glosa_id = OLD.glosa_id);80881

        valor_glosa_aux := (SELECT valor_glosa
                        FROM glosas
                        WHERE glosa_id = OLD.glosa_id);173.462.815

        valor_aceptado_aux := (SELECT valor_aceptado
                            FROM glosas
                            WHERE glosa_id = OLD.glosa_id);3.265.633

        valor_no_aceptado_aux := (SELECT valor_no_aceptado
                            FROM glosas
                            WHERE glosa_id = OLD.glosa_id);132.642.482

        IF (valor_aceptado_aux + valor_no_aceptado_aux) > valor_glosa_aux THEN 
            RAISE EXCEPTION 'la suma de los valores aceptados y no aceptados es mayor que el valor de la glosa %',glosa_aux;
        END IF; 

    END IF;

    RETURN NEW; 
    
END


HA OCURRIDO UN ERROR AL MOMENTO DE CREAR EL ACTA
ERROR:  la suma de los valores aceptados y no aceptados es mayor que el valor de la glosa 80881
CONTEXT:  función PL/pgSQL verificar_valor_glosa() en la línea 26 en RAISE
sentencia SQL: «UPDATE  glosas
      SET     valor_pendiente = valorp,
              sw_estado = estado
      WHERE   glosa_id = OLD.glosa_id»
función PL/pgSQL actualizar_valor_glosas() en la línea 95 en sentencia SQL<br>
UPDATE glosas 
SET    
valor_no_aceptado = 173462815.00 - 59924,        
valor_pendiente = 173462815.00 - 59924 
WHERE  glosa_id = 80881 


_____________________________________________________________________________________________________________________

DECLARE 
  valor1 NUMERIC;
  valor2 NUMERIC;
  valor3 NUMERIC;
  valorp NUMERIC;
  estado CHARACTER(1);
  cantidad INTEGER;
  cantidad_acta INTEGER;
BEGIN
  IF TG_OP='INSERT' THEN
    IF NEW.sw_glosa_total_factura = '1' THEN
      UPDATE glosas
      SET valor_glosa = (SELECT CASE WHEN saldo > 0 THEN saldo 
                            ELSE total_factura END
                         FROM   fac_facturas
                         WHERE  prefijo = NEW.prefijo
                         AND    factura_fiscal = NEW.factura_fiscal
                         AND    empresa_id = NEW.empresa_id)
      WHERE glosa_id = NEW.glosa_id;
    END IF;
  RETURN NEW;
  END IF;

  IF TG_OP = 'UPDATE' THEN
    IF NEW.sw_glosa_total_factura <> OLD.sw_glosa_total_factura THEN
      IF NEW.sw_estado <> '0' THEN
        IF NEW.sw_glosa_total_factura = '1' THEN
          UPDATE glosas
          SET valor_glosa = (SELECT CASE WHEN saldo > 0 THEN saldo 
                       ELSE total_factura END
                       FROM fac_facturas
                 WHERE prefijo = NEW.prefijo
                 AND factura_fiscal = NEW.factura_fiscal
                 AND empresa_id = NEW.empresa_id)
          WHERE glosa_id = OLD.glosa_id;
        ELSE
          UPDATE glosas
          SET valor_glosa = 0
          WHERE glosa_id = OLD.glosa_id;
        END IF;
      END IF;
    END IF;
    
    IF NEW.valor_glosa <> OLD.valor_glosa OR NEW.valor_aceptado <> OLD.valor_aceptado OR NEW.valor_no_aceptado <> OLD.valor_no_aceptado THEN
      cantidad := COALESCE(( SELECT  COUNT(*)
                    FROM    notas_credito_glosas
                    WHERE   glosa_id = OLD.glosa_id ),0);
      IF cantidad = 0 THEN
        cantidad := COALESCE(( SELECT  COUNT(*)
                      FROM    auditoria_glosas_no_aceptadas
                      WHERE   glosa_id = OLD.glosa_id ),0);
      END IF;
      
      cantidad_acta := COALESCE((SELECT COUNT(*)
                        FROM    actas_conciliacion_glosas AG,
                                actas_conciliacion_glosas_detalle AD
                        WHERE   AG.acta_conciliacion_id = AD.acta_conciliacion_id
                        AND     AG.sw_activo = '0'
                        AND     AD.glosa_id = OLD.glosa_id ),0);
                      
      valor1 := NEW.valor_glosa;
      IF valor1 ISNULL THEN
        valor1 := OLD.valor_glosa;
      END IF;
      
      valor2 := NEW.valor_aceptado;
      IF valor2 ISNULL THEN
        valor2 := OLD.valor_aceptado;
      END IF;
      
      valor3 := NEW.valor_no_aceptado;
      IF valor3 ISNULL THEN
        valor3 := OLD.valor_no_aceptado;
      END IF;
      
      valorp := NEW.valor_pendiente;
      estado := '1';
      IF NEW.valor_glosa = 0 THEN
        estado := '0';
      END IF;
      IF NEW.valor_aceptado > 0 OR NEW.valor_no_aceptado > 0 THEN 
        estado := '2';
      END IF;
      IF valorp = 0 AND cantidad > 0 AND cantidad_acta = 0 THEN
        estado := '3';
      END IF;

      IF NEW.sw_estado = '4' AND valorp > 0 THEN
        estado := '4';
      END IF;
      
      --RAISE EXCEPTION 'estado %',estado;
      
      UPDATE  glosas
      SET     valor_pendiente = valorp,
              sw_estado = estado
      WHERE   glosa_id = OLD.glosa_id;

    END IF;
    RETURN NEW;
  END IF;
END;

______________________________________________________________________________________________________________________
--Reporte NIF

SELECT a.numerodecuenta,
    a.fecha_registro::date AS fecha_cuenta,
	ig.ingreso,
    ig.fecha_ingreso::date AS fecha_ingreso,
	ig.tipo_id_paciente,
    ig.paciente_id,
	ff.prefijo,
	ff.factura_fiscal,
	CASE  WHEN ff.estado = '0' THEN 'FACTURADO'
	WHEN ff.estado = '1' THEN 'PAGADO'
	WHEN ff.estado = '2' THEN 'ANULADO'
	WHEN ff.estado = '3' THEN 'ANULADA CON NOTA'
	WHEN ff.estado IS NULL THEN 'SIN FACTURA'
	ELSE 'SIN ESTADO'
	END AS estado_factura,
	ff.fecha_registro AS fecha_factura,
    ce.descripcion AS estado_cuenta,
	a.fecha_cierre::date AS fec_cierre_cta, 
    cd.departamento,
    cd.cargo_prod,
	cd.descripcion,
    cd.grupo_actividad,
	g.tipo_tercero_id,
    g.tercero_id,
	g.plan_descripcion,
    cd.cantidad,
    cd.vlr_unt,
    cd.vlr_total,
    cd.valor_nocubierto,
    cd.valor_cubierto,
    cd.cargo_cups,
	cd.desc_cargo_cups,
	cd.fecha_cargo,
    cd.fecha_registro,
	ins.fecha_registro::date as fecha_registro_salida,
	cd.departamento_solicitud,
	cd.cargo_procedimiento,
	cd.desc_procedimiento,
	cd.consecutivo_procedimiento,
	cd.secuencia,
	cd.porcentaje,
	cd.tipo_cargo_qx_id,
	cd.cargo_cups_proced,
	cd.desc_cargo_cups_proced,
	cd.suma_proc
	--cd.identifacion_cirujano,
	--cd.nombre_cirujano,
	--cd.especialidad
	
   FROM ( SELECT c.numerodecuenta,
            c.cargo as cargo_prod,
            c.cargo_cups,
			cu.descripcion as desc_cargo_cups,
            c.tarifario_id,
            e.descripcion,
            c.cantidad,
            c.precio AS vlr_unt,
            c.valor_cargo AS vlr_total,
            c.valor_nocubierto,
            c.valor_cubierto,
            c.fecha_cargo::date AS fecha_cargo,
            c.fecha_registro::date AS fecha_registro,
            d.descripcion AS departamento,
            f.descripcion AS grupo_actividad,
			c.departamento_solicitud,
            qx.cargo AS cargo_procedimiento,
            tdq.descripcion AS desc_procedimiento,
			qx.consecutivo_procedimiento,
			qx.secuencia,
			qx.porcentaje,
			qx.tipo_cargo_qx_id,
			qxc.cargo_cups AS cargo_cups_proced,
			cup.descripcion AS desc_cargo_cups_proced,
			ab.suma_proc
			--pro.tipo_id_tercero||' '||pro.tercero_id AS identifacion_cirujano,
			--pro.nombre as nombre_cirujano,
			--esp.descripcion as especialidad

           FROM cuentas_detalle c
             JOIN departamentos d ON c.departamento::text = d.departamento::text
             JOIN tarifarios_detalle e ON c.cargo::text = e.cargo::text AND c.tarifario_id::text = e.tarifario_id::text
             JOIN grupos_tipos_cargo f ON e.grupo_tipo_cargo::text = f.grupo_tipo_cargo::text
			 LEFT JOIN cups cu ON c.cargo_cups=cu.cargo
             LEFT JOIN cuentas_cargos_qx_procedimientos qx ON c.transaccion = qx.transaccion
             LEFT JOIN tarifarios_detalle tdq ON qx.cargo::text = tdq.cargo::text AND qx.tarifario_id::text = tdq.tarifario_id::text
			 LEFT JOIN (SELECT SUM (cd.precio) AS suma_proc,qx.cargo,qx.consecutivo_procedimiento,qx.secuencia
				FROM cuentas_detalle cd,
				cuentas_cargos_qx_procedimientos qx
				WHERE qx.transaccion=cd.transaccion
				GROUP BY 2,3,4
				ORDER BY 2
				) ab ON  (ab.cargo=qx.cargo AND ab.consecutivo_procedimiento=qx.consecutivo_procedimiento AND ab.secuencia=qx.secuencia)
			 LEFT JOIN cuentas_liquidaciones_qx_procedimientos qxc ON (qx.consecutivo_procedimiento=qxc.consecutivo_procedimiento)
			 LEFT JOIN cups cup ON (qxc.cargo_cups=cup.cargo)
			--LEFT JOIN profesionales as pro ON pro.tercero_id = qxc.cirujano_id AND qxc.tipo_id_cirujano=pro.tipo_id_tercero
			--LEFT JOIN profesionales_especialidades as pe ON pe.tercero_id = pro.tercero_id AND pe.tipo_id_tercero=pro.tipo_id_tercero
			--LEFT JOIN especialidades as esp ON esp.especialidad = pe.especialidad
          WHERE c.consecutivo IS NULL
		  AND c.facturado='1'
		  AND (c.sw_paquete_facturado IS NULL OR c.sw_paquete_facturado='1')
        UNION ALL
         SELECT c.numerodecuenta,
            iv.codigo_producto AS cargo_prod,
            ''::character varying AS cargo_cups,
			 ''::character varying AS desc_cargo_cups,
            'IMD'::character varying AS tarifario_id,
            c.descripcion,
            c.cantidad,
            c.valor_cargo AS vlr_unt,
            c.valor_cargo AS vlr_total,
            0 AS valor_nocubierto,
            c.valor_cubierto,
            c.fecha_cargo::date AS fecha_cargo,
            c.fecha_cargo::date AS fecha_registro,
            c.departamento_descripcion AS departamento,
            ig.descripcion AS grupo_actividad,
			''::character varying AS departamento_solicitud,
            ''::character varying AS cargo_procedimiento,
            ''::character varying AS desc_procedimiento,
			0 AS consecutivo_procedimiento,
			''::character varying AS secuencia,
			0 AS porcentaje,
			''::character varying AS tipo_cargo_qx_id,
			''::character varying AS cargo_cups_proced,
			''::character varying AS desc_cargo_cups_proced,
			0 AS suma_proc
			--''::character varying AS identifacion_cirujano,
			--''::character varying AS nombre_cirujano,
			--''::character varying AS especialidad
           FROM view_cuentas_detalle_productos c
           INNER JOIN inventarios_productos iv ON c.codigo_producto::text = iv.codigo_producto::text 
           INNER JOIN inv_grupos_inventarios ig ON iv.grupo_id=ig.grupo_id
		) cd,
    cuentas a
	INNER JOIN cuentas_estados ce ON a.estado = ce.estado
    INNER JOIN ingresos ig ON a.ingreso = ig.ingreso 
	INNER JOIN planes g ON a.plan_id = g.plan_id 
	LEFT JOIN ingresos_salidas ins ON ig.ingreso=ins.ingreso
	LEFT JOIN (
                    select  f.*,
                            ffc.numerodecuenta
                    from    fac_facturas f
                        left join fac_facturas_cuentas ffc on (f.empresa_id = ffc.empresa_id and f.prefijo = ffc.prefijo and f.factura_fiscal = ffc.factura_fiscal)
                    where f.estado NOT IN ('2','3')
					and f.tipo_factura != '0'
                ) ff on (ff.numerodecuenta = a.numerodecuenta)
  WHERE a.numerodecuenta = cd.numerodecuenta
  AND a.numerodecuenta IN ( '482385',
'485017',
'479105',
'485504',
'487636',
'492680',
'485317',
'485495',
'492720')






SELECT tarifario_id, cargo FROM tarifarios_detalle WHERE tarifario_id='0017'

DELETE FROM tarifarios_detalle WHERE tarifario_id='0017' AND cargo='';


UPDATE tarifarios_detalle SET cargo = REPLACE(cargo, ' ', '') WHERE cargo ILIKE '547505P%'
UPDATE tarifarios_detalle SET cargo = '547505P' WHERE cargo ILIKE '547505P%'
UPDATE excepciones_auditoria_eliminadas SET cargo = '547505P' WHERE cargo ILIKE '547505P%'


UPDATE tarifarios_detalle SET cargo = '547505P' WHERE cargo ILIKE '% %'


________________________________________________________________________________________________________________________
--INSERT PARA CUPS
INSERT INTO cups(cargo,descripcion,grupo_tarifario_id,subgrupo_tarifario_id,grupo_tipo_cargo,tipo_cargo,nivel,concepto_rips,precio,gravamen,sw_cantidad,sw_honorarios,sw_uvrs,nivel_autorizador_id,sw_pos,grupos_mapipos,grupo_qx,sw_bilateral,sw_internacion,sw_estado,sw_costo_variable,sw_notaoperatoria,sw_activo,sw_estadoa,sw_vacuna,sw_odontologia,sexo_id,sw_parto,sw_add_perfusion,sw_add_hemodilucion,bys_producto_id) VALUES('088903','LIGADURA Y ESCISIÓN DE SAFENA EXTERNA','07','38','07','38','3','04',1052100,0,'1','0','0','1','1','0','NULL','0',0,'1','0','NULL','1','1','0','NULL','NULL','NULL','0','0','NULL')

UPDATE cups SET B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,AA,AB,AC,AD,AE,AF WHERE

=CONCATENAR("INSERT INTO 
cups(";$B$1;"= '";B2;"', ";$C$1;"= '";C2;"', ";$D$1;"= '";D2;"', ";$E$1;"= '";E2;"', ";$F$1;"= '";F2;"', ";$G$1;"= '";G2;"', ";$H$1;"= '";H2;"', ";$I$1;"= ";I2;", ";$J$1;"= ";J2;", ";$K$1;"= '";K2;"', ";$L$1;"= '";L2;"', ";$M$1;"= '";M2;"', ";$N$1;"= '";N2;"', ";$O$1;"= '";O2;"', ";$P$1;"= '";P2;"', ";$Q$1;"= '";Q2;"', ";$R$1;"= ";R2;", ";$S$1;"= '";S2;"', ";$T$1;"= '";T2;"', ";$U$1;"= '";U2;"', ";$V$1;"= '";V2;"', ";$W$1;"= '";W2;"', ";$X$1;"= '";X2;"', ";$Y$1;"= '";Y2;"', ";$Z$1;"= '";Z2;"', ";A$A$1;"= ";AA2;", ";A$B$1;"= ";AB2;", ";A$C$1;"= '";AC2;"', ";A$D$1;"= '";AD2;"', ";A$E$1;"= '";AE2;"', ";A$F$1;"= '";AF2;"'")


____________________________________________________________________________________________________________________
SELECT 
rc.fecha_ingcaja,
rc.prefijo,
rc.recibo_caja,
rc.total_abono,
rc.tipo_id_tercero,
rc.tercero_id,
CASE WHEN rc.estado = '0' THEN 'Activo' WHEN rc.estado = '1' THEN 'Inactivo' WHEN rc.estado = '2' THEN 'Cerrado' END AS estado,
rc.fecha_registro,
rc.total_cuota,
'rc_detalle_saldos_anticipos ---->' AS tabla_compara1,
rcdsa.prefijo AS prefijo,
rcdsa.recibo_caja,
rcdsa.valor_anticipo,
rcdsa.saldo_anticipo,
'rc_detalle_cruce_saldos_anticipos --->' AS tabla_compara,
rcdcsa.prefijo,
rcdcsa.recibo_caja,
rcdcsa.prefijo_cruce,
rcdcsa.recibo_caja_cruce,
rcdcsa.valor_cruce
FROM recibos_caja rc
LEFT JOIN rc_detalle_saldos_anticipos rcdsa ON rcdsa.prefijo = rc.prefijo AND rcdsa.recibo_caja = rc.recibo_caja
LEFT JOIN rc_detalle_cruce_saldos_anticipos rcdcsa ON rcdcsa.prefijo = rc.prefijo AND rcdcsa.recibo_caja = rc.recibo_caja
WHERE rc.prefijo = 'RTA' OR rc.prefijo = 'RTC'
ORDER BY rc.fecha_ingcaja


287,
288,
307,
311,
345,
349,
387,
396,
429,
451,
477,
646
____________________________________________________________________________________________________________________________________________________________________________________________________
SELECT 
'recibos_caja ---->' AS TABLA1,
rc.documento_id,
rd.descripcion,
rc.fecha_ingcaja,
rc.prefijo,
rc.recibo_caja,
rc.total_abono,
rc.tipo_id_tercero,
rc.tercero_id,
rc.observacion,
CASE WHEN rc.estado = '0' THEN 'Activo' WHEN rc.estado = '1' THEN 'Inactivo' WHEN rc.estado = '2' THEN 'Cerrado' END AS estado,
rc.fecha_registro,
rc.total_cuota,
'rc_detalle_saldos_anticipos ---->' AS tabla_compara1,
rcdsa.prefijo AS prefijo,
rcdsa.recibo_caja,
rcdsa.valor_anticipo,
rcdsa.saldo_anticipo,
'rc_detalle_cruce_saldos_anticipos --->' AS tabla_compara2,
rcdcsa.prefijo,
rcdcsa.recibo_caja,
rcdcsa.prefijo_cruce,
rcdcsa.recibo_caja_cruce,
rcdcsa.valor_cruce
FROM recibos_caja rc
LEFT JOIN rc_detalle_saldos_anticipos rcdsa ON rcdsa.prefijo = rc.prefijo AND rcdsa.recibo_caja = rc.recibo_caja
LEFT JOIN rc_detalle_cruce_saldos_anticipos rcdcsa ON rcdcsa.prefijo = rc.prefijo AND rcdcsa.recibo_caja = rc.recibo_caja
INNER JOIN rc_tipos_documentos rd ON (rc.rc_tipo_documento = rd.rc_tipo_documento)
WHERE rc.prefijo = 'RTA' OR rc.prefijo = 'RTC'
ORDER BY rc.fecha_ingcaja DESC


________________________

SELECT 
rc.prefijo,
rc.recibo_caja,
to_char(rc.fecha_registro, 'YYYY-MM-DD') as fecha_registro,
rc.total_abono,
rc.total_efectivo,
rc.total_cheques,
rc.total_tarjetas,
rc.tipo_id_tercero,
rc.tercero_id,
rd.descripcion,
CASE WHEN rc.estado = '2' THEN 'CERRADO' WHEN rc.estado = '1' THEN 'INACTIVO' WHEN rc.estado = '0' THEN 'ACTIVO' END AS Estado
FROM  
  recibos_caja rc
    INNER JOIN rc_tipos_documentos rd ON (rc.rc_tipo_documento = rd.rc_tipo_documento)
WHERE rd.sw_cruzar_anticipos = '1'
ORDER BY rc.fecha_registro DESC;

________________________

SELECT 
    rcs.prefijo,
    rcs.recibo_caja,
    rcs.valor_anticipo,
    rcs.saldo_anticipo,
    to_char(rc.fecha_registro, 'YYYY-MM-DD') as fecha_registro
FROM rc_detalle_saldos_anticipos rcs
LEFT JOIN recibos_caja rc ON (rcs.prefijo=rc.prefijo AND rcs.recibo_caja=rc.recibo_caja)

WHERE rcs.prefijo='RTA'
ORDER BY fecha_registro DESC;



SELECT 
'recibos_caja ---->' AS TABLA1,
rc.documento_id,
rd.descripcion,
rc.fecha_ingcaja,
rc.prefijo,
rc.recibo_caja,
rc.total_abono,
rc.tipo_id_tercero,
rc.tercero_id,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(rc.observacion, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', '-'),'  ', '') AS observacion,
CASE WHEN rc.estado = '0' THEN 'Activo' WHEN rc.estado = '1' THEN 'Inactivo' WHEN rc.estado = '2' THEN 'Cerrado' END AS estado,
rc.fecha_registro,
rc.total_cuota,
'rc_detalle_saldos_anticipos ---->' AS tabla_compara1,
rcdsa.prefijo AS prefijo,
rcdsa.recibo_caja,
rcdsa.valor_anticipo,
rcdsa.saldo_anticipo,
'rc_detalle_cruce_saldos_anticipos --->' AS tabla_compara2,
rcdcsa.prefijo,
rcdcsa.recibo_caja,
rcdcsa.prefijo_cruce,
rcdcsa.recibo_caja_cruce,
rcdcsa.valor_cruce
FROM recibos_caja rc
LEFT JOIN rc_detalle_saldos_anticipos rcdsa ON rcdsa.prefijo = rc.prefijo AND rcdsa.recibo_caja = rc.recibo_caja
LEFT JOIN rc_detalle_cruce_saldos_anticipos rcdcsa ON rcdcsa.prefijo = rc.prefijo AND rcdcsa.recibo_caja = rc.recibo_caja
INNER JOIN rc_tipos_documentos rd ON (rc.rc_tipo_documento = rd.rc_tipo_documento)
WHERE rc.prefijo = 'RTA' OR rc.prefijo = 'RTC'
AND rc.fecha_ingcaja  BETWEEN '_1' AND '_2'
ORDER BY rc.fecha_ingcaja DESC


____________________________________________________________________________________________________________________________________________________________________________________________________

SELECT
hcl.usuario,
syu.nombre,
syu.descripcion,
hcl.fecha::DATE AS fecha,
hcl.fecha::TIME AS hora,
CASE WHEN hcl.estado_v = 1 THEN 'visualizacion' WHEN hcl.estado_v = 2 THEN 'impresion' END AS accion,
syl.ip_address AS direccion_ip
FROM hc_log hcl
JOIN system_usuarios syu ON hcl.usuario = syu.usuario_id
JOIN ingresos ing ON hcl.ingreso_n = ing.ingreso
JOIN system_usuarios_log syl ON hcl.usuario = syl.usuario_id AND hcl.fecha::DATE AND hcl.fecha::DATE = suy.fecha::DATE
WHERE ing.paciente_id = '1061803096'
ORDER BY hcl.fecha DESC

_______________________________________________________________________
-- Validacion soat-ingresos que tengan la misma cedula.

SELECT
i.ingreso,
i.tipo_id_paciente AS tipo_doc_ingreso,
i.paciente_id AS documento_ingreso,
(pac.primer_nombre ||' '|| pac.segundo_nombre ||' '|| pac.primer_apellido ||' '|| pac.segundo_apellido ) AS full_name_ingreso,
' --comparacion-- ' AS compara,
e.evento,
e.tipo_id_paciente AS tipo_doc_evento,
e.paciente_id AS pacienteID_evento,
(paci.primer_nombre ||' '|| paci.segundo_nombre ||' '|| paci.primer_apellido ||' '|| paci.segundo_apellido ) AS full_name_evento
FROM ingresos_soat iso
JOIN ingresos i ON iso.ingreso = i.ingreso
JOIN soat_eventos e ON iso.evento = e.evento
JOIN pacientes pac ON i.paciente_id = pac.paciente_id AND i.tipo_id_paciente = pac.tipo_id_paciente
JOIN pacientes paci ON i.paciente_id = paci.paciente_id AND i.tipo_id_paciente = paci.tipo_id_paciente
ORDER BY e.fecha_registro


SELECT
i.fecha_ingreso,
i.ingreso,
i.tipo_id_paciente AS tipo_doc_ingreso,
i.paciente_id AS documento_ingreso,
  (
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(pac.primer_nombre, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', '-'),'  ', '') ||' '|| 
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(pac.segundo_nombre, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', '-'),'  ', '') ||' '|| 
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(pac.primer_apellido, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', '-'),'  ', '') ||' '||
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(pac.segundo_apellido, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', '-'),'  ', '')
  ) AS full_name_ingreso,
syu2.nombre AS quien_ingreso,
syu2.descripcion AS cargo,
e.fecha_registro AS fecha_evento,
e.evento,
e.tipo_id_paciente AS tipo_doc_evento,
e.paciente_id AS pacienteID_evento,
(paci.primer_nombre ||' '|| paci.segundo_nombre ||' '|| paci.primer_apellido ||' '|| paci.segundo_apellido ) AS full_name_evento,
syu.nombre AS quien_asocio_evento,
syu.descripcion AS cargo_doliente
FROM ingresos_soat iso
JOIN ingresos i ON iso.ingreso = i.ingreso
JOIN soat_eventos e ON iso.evento = e.evento
JOIN pacientes pac ON i.paciente_id = pac.paciente_id AND i.tipo_id_paciente = pac.tipo_id_paciente
JOIN pacientes paci ON e.paciente_id = paci.paciente_id AND e.tipo_id_paciente = paci.tipo_id_paciente
JOIN system_usuarios syu ON e.usuario_id = syu.usuario_id
JOIN system_usuarios syu2 ON i.usuario_id = syu2.usuario_id
WHERE i.paciente_id != e.paciente_id
ORDER BY 11, e.fecha_registro


SELECT
i.fecha_ingreso,
i.ingreso,
i.tipo_id_paciente AS tipo_doc_ingreso,
i.paciente_id AS documento_ingreso,
TRIM(BOTH(
  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(pac.primer_nombre, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', ''),'  ', '') ||' '|| 
  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(pac.segundo_nombre, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', ''),'  ', '') ||' '|| 
  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(pac.primer_apellido, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', ''),'  ', '') ||' '||
  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(pac.segundo_apellido, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', ''),'  ', '')
)) AS full_name_ingreso,
TRIM(BOTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(syu2.nombre, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', ' '),'  ', ''))) AS quien_ingreso,
TRIM(BOTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(syu2.descripcion, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', ' '),'  ', ''))) AS cargo,
e.fecha_registro AS fecha_evento,
e.evento,
e.tipo_id_paciente AS tipo_doc_evento,
e.paciente_id AS pacienteID_evento,
TRIM(BOTH(
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(paci.primer_nombre, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', ''),'  ', '') ||' '|| 
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(paci.segundo_nombre, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', ''),'  ', '') ||' '|| 
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(paci.primer_apellido, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', ''),'  ', '') ||' '||
    REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(paci.segundo_apellido, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', ''),'  ', '')
  )) AS full_name_evento,
TRIM(BOTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(syu.nombre, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', ' '),'  ', ''))) AS quien_asocio_evento,
TRIM(BOTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(syu.descripcion, '"', ''), ',', ''), CHR(13), ''), CHR(10), ''),' ', ' '),'  ', ''))) AS cargo_doliente
FROM ingresos_soat iso
JOIN ingresos i ON iso.ingreso = i.ingreso
JOIN soat_eventos e ON iso.evento = e.evento
JOIN pacientes pac ON i.paciente_id = pac.paciente_id AND i.tipo_id_paciente = pac.tipo_id_paciente
JOIN pacientes paci ON e.paciente_id = paci.paciente_id AND e.tipo_id_paciente = paci.tipo_id_paciente
JOIN system_usuarios syu ON e.usuario_id = syu.usuario_id
JOIN system_usuarios syu2 ON i.usuario_id = syu2.usuario_id
WHERE i.paciente_id != e.paciente_id
ORDER BY 11, e.fecha_registro


-------------------------------------------------------------
parametrizar para que pueda contener 8 caracteres estaciones_enfermeria_reservas_camas
--
DEPARTAMENTO Gineco
INSERT INTO departamentos VALUES ('01', '01', '0001', 'HPGINE', 'Hospitalizacion Ginecologia', '1', '1', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', NULL, NULL, NULL, '3', '1', '0', '1', '0', '1', '0', '1', NULL, '0', NULL, 1, '0', '1', '0', '0', NULL, NULL);
ESTACION GINECO
INSERT INTO estaciones_enfermeria VALUES ('HPGN', 'Hospitalizacion Ginecologia - P4 TA', 'HPGINE', 'Hospitalizacion', 'EnfermeriaHosp', 'UrgenciasConsulta', 'Hospitalizacion Ginecologia - Piso o 4 Torre A', 2, '1', '0', '0', NULL, 'QX_Cirujano', '', '', '', '', 'EnfermeriaHosp', '0', '0', 2, '2023-11-25 13:12:02.221463', '0', '0', '1', '1', '0', 0, NULL, '1', '1', '1', NULL, '0', '0', NULL, NULL, NULL);
piezas o habitaciones para hospi gineco
INSERT INTO piezas VALUES('HB1GN','HPGN','HAB GINECOLOGIA 1',1,'HAB GINECOLOGIA 1',NULL,2,NOW());
INSERT INTO piezas VALUES('HB2GN','HPGN','HAB GINECOLOGIA 2',1,'HAB GINECOLOGIA 2',NULL,2,NOW());
INSERT INTO piezas VALUES('HB3GN','HPGN','HAB GINECOLOGIA 3',1,'HAB GINECOLOGIA 3',NULL,2,NOW());
INSERT INTO piezas VALUES('HB4GN','HPGN','HAB GINECOLOGIA 4',1,'HAB GINECOLOGIA 4',NULL,2,NOW());
INSERT INTO piezas VALUES('HB5GN','HPGN','HAB GINECOLOGIA 5',1,'HAB GINECOLOGIA 5',NULL,2,NOW());
INSERT INTO piezas VALUES('HB6GN','HPGN','HAB GINECOLOGIA 6',1,'HAB GINECOLOGIA 6',NULL,2,NOW());
INSERT INTO piezas VALUES('HB7GN','HPGN','HAB GINECOLOGIA 7',1,'HAB GINECOLOGIA 7',NULL,2,NOW());
INSERT INTO piezas VALUES('HB8GN','HPGN','HAB GINECOLOGIA 8',1,'HAB GINECOLOGIA 8',NULL,2,NOW());
cups de la habitacion S11201
camas para gineco
INSERT INTO camas VALUES ('HB1GN', 'HB1C1GN', 'S11201',1,'HOSP GINECO P4 TA H1', 'CAMA PERSONAL HOSPITALIZACION GINECOLOGIA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB2GN', 'HB2C1GN', 'S11201',1,'HOSP GINECO P4 TA H2', 'CAMA PERSONAL HOSPITALIZACION GINECOLOGIA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB3GN', 'HB3C1GN', 'S11201',1,'HOSP GINECO P4 TA H3', 'CAMA PERSONAL HOSPITALIZACION GINECOLOGIA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB4GN', 'HB4C1GN', 'S11201',1,'HOSP GINECO P4 TA H4', 'CAMA PERSONAL HOSPITALIZACION GINECOLOGIA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB5GN', 'HB5C1GN', 'S11201',1,'HOSP GINECO P4 TA H5', 'CAMA PERSONAL HOSPITALIZACION GINECOLOGIA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB6GN', 'HB6C1GN', 'S11201',1,'HOSP GINECO P4 TA H6', 'CAMA PERSONAL HOSPITALIZACION GINECOLOGIA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB7GN', 'HB7C1GN', 'S11201',1,'HOSP GINECO P4 TA H7', 'CAMA PERSONAL HOSPITALIZACION GINECOLOGIA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB8GN', 'HB8C1GN', 'S11201',1,'HOSP GINECO P4 TA H8', 'CAMA PERSONAL HOSPITALIZACION GINECOLOGIA', 1, 14, 2, NOW(), 2);
Insertar a los usuarios
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('HPGN', '2803','10');

--------------------------------------------------------
ADULTOS
--------------------------------------------------------
--DEPARTAMENTO ADULTOS
INSERT INTO departamentos VALUES ('01', '01', '0001', 'HPADU', 'Hospitalizacion Adultos', '1', '1', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', NULL, NULL, NULL, '3', '1', '0', '1', '0', '1', '0', '1', NULL, '0', NULL, 1, '0', '1', '0', '0', NULL, NULL);
--ESTACION ADULTOS
INSERT INTO estaciones_enfermeria VALUES ('HPAD', 'Hospitalizacion Adultos - P4 TB', 'HPADU', 'Hospitalizacion', 'EnfermeriaHosp', 'UrgenciasConsulta', 'Hospitalizacion Ginecologia - Piso o 4 Torre B', 2, '1', '0', '0', NULL, 'QX_Cirujano', '', '', '', '', 'EnfermeriaHosp', '0', '0', 2, NOW(), '0', '0', '1', '1', '0', 0, NULL, '1', '1', '1', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para hospi ADULTOS
INSERT INTO piezas VALUES('HB1AD','HPAD','HAB ADULTOS 1',1,'HAB ADULTOS 1',NULL,2,NOW());
INSERT INTO piezas VALUES('HB2AD','HPAD','HAB ADULTOS 2',1,'HAB ADULTOS 2',NULL,2,NOW());
INSERT INTO piezas VALUES('HB3AD','HPAD','HAB ADULTOS 3',1,'HAB ADULTOS 3',NULL,2,NOW());
INSERT INTO piezas VALUES('HB4AD','HPAD','HAB ADULTOS 4',1,'HAB ADULTOS 4',NULL,2,NOW());
INSERT INTO piezas VALUES('HB5AD','HPAD','HAB ADULTOS 5',1,'HAB ADULTOS 5',NULL,2,NOW());
INSERT INTO piezas VALUES('HB6AD','HPAD','HAB ADULTOS 6',1,'HAB ADULTOS 6',NULL,2,NOW());
INSERT INTO piezas VALUES('HB7AD','HPAD','HAB ADULTOS 7',1,'HAB ADULTOS 7',NULL,2,NOW());
INSERT INTO piezas VALUES('HB8AD','HPAD','HAB ADULTOS 8',1,'HAB ADULTOS 8',NULL,2,NOW());
--cups de la habitacion S11201
--camas para adultos
INSERT INTO camas VALUES ('HB1AD', 'HB1C1AD', 'S11201',1,'HOSP ADULTO P4 TB H1', 'CAMA PERSONAL HOSPITALIZACION ADULTOS', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB2AD', 'HB2C1AD', 'S11201',1,'HOSP ADULTO P4 TB H2', 'CAMA PERSONAL HOSPITALIZACION ADULTOS', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB3AD', 'HB3C1AD', 'S11201',1,'HOSP ADULTO P4 TB H3', 'CAMA PERSONAL HOSPITALIZACION ADULTOS', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB4AD', 'HB4C1AD', 'S11201',1,'HOSP ADULTO P4 TB H4', 'CAMA PERSONAL HOSPITALIZACION ADULTOS', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB5AD', 'HB5C1AD', 'S11201',1,'HOSP ADULTO P4 TB H5', 'CAMA PERSONAL HOSPITALIZACION ADULTOS', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB6AD', 'HB6C1AD', 'S11201',1,'HOSP ADULTO P4 TB H6', 'CAMA PERSONAL HOSPITALIZACION ADULTOS', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB7AD', 'HB7C1AD', 'S11201',1,'HOSP ADULTO P4 TB H7', 'CAMA PERSONAL HOSPITALIZACION ADULTOS', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB8AD', 'HB8C1AD', 'S11201',1,'HOSP ADULTO P4 TB H8', 'CAMA PERSONAL HOSPITALIZACION ADULTOS', 1, 14, 2, NOW(), 2);
--Insertar a los usuarios para ADULTOS
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('HPAD', '2803','10');


--------------------------------------------------------
PEDIATRICA
--------------------------------------------------------
DEPARTAMENTO PEDIATRICA
--empresa_id	centro_utilidad	unidad_funcional	departamento	descripcion	sw_internacion	servicio	codigo_alterno	ubicacion	telefono	text1	text2	formato_cumplimiento	sw_control_placas	sw_maneja_vitros	sw_tomado_automatico	sw_tomado_vitros	sw_cargos_adicionales	sw_sv_uci	sw_cerrar_evolucion	tipo_atencion_plano_factura_id	sw_sv_hemodialisis	interface_externa_id	sw_estado	pyp	sw_paquete	sw_fecha_toma	sw_autorizacion_automatica	rips_modalidad_grupo_servicio_id	rips_grupo_servicio_id
INSERT INTO departamentos VALUES ('01', '01', '0001', 'HPPED', 'Hospitalizacion Pediatrica', '1', '1', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', NULL, NULL, NULL, '3', '1', '0', '1', '0', '1', '0', '1', NULL, '0', NULL, 1, '0', '1', '0', '0', NULL, NULL);
--ESTACION ADULTOS
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO estaciones_enfermeria VALUES ('HPPD', 'Hospitalizacion Pediatrica - P7 TA', 'HPPED', 'Hospitalizacion', 'EnfermeriaHosp', 'UrgenciasConsulta', 'Hospitalizacion Ginecologia - Piso 7 Torre A', 2, '1', '0', '0', NULL, 'QX_Cirujano', '', '', '', '', 'EnfermeriaHosp', '0', '0', 2, NOW(), '0', '0', '1', '1', '0', 0, NULL, '1', '1', '1', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para hospi ADULTOS
--pieza	estacion_id	descripcion	cantidad_camas	ubicacion	sw_virtual	usuario_id	fecha_registro
INSERT INTO piezas VALUES('HB1PD','HPPD','HAB PEDIATRICA 1',1,'HAB PED 1',NULL,2,NOW());
INSERT INTO piezas VALUES('HB2PD','HPPD','HAB PEDIATRICA 2',1,'HAB PED 2',NULL,2,NOW());
INSERT INTO piezas VALUES('HB3PD','HPPD','HAB PEDIATRICA 3',1,'HAB PED 3',NULL,2,NOW());
INSERT INTO piezas VALUES('HB4PD','HPPD','HAB PEDIATRICA 4',1,'HAB PED 4',NULL,2,NOW());
INSERT INTO piezas VALUES('HB5PD','HPPD','HAB PEDIATRICA 5',1,'HAB PED 5',NULL,2,NOW());
INSERT INTO piezas VALUES('HB6PD','HPPD','HAB PEDIATRICA 6',1,'HAB PED 6',NULL,2,NOW());
INSERT INTO piezas VALUES('HB7PD','HPPD','HAB PEDIATRICA 7',1,'HAB PED 7',NULL,2,NOW());
INSERT INTO piezas VALUES('HB8PD','HPPD','HAB PEDIATRICA 8',1,'HAB PED 8',NULL,2,NOW());
INSERT INTO piezas VALUES('HB9PD','HPPD','HAB PEDIATRICA 9',1,'HAB PED 9',NULL,2,NOW());
--cups de la habitacion S11201
--camas para adultos
--pieza	cama	cargo	estado	ubicacion	descripcion	sw_virtual	tipo_cama_id	usuario_id	fecha_registro	virtual_real
INSERT INTO camas VALUES ('HB1PD', 'HB1C1PD', 'S11201',1,'HOSP PEDIAT P4 TB H1', 'CAMA PERSONAL HOSPITALIZACION PEDIATRICA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB2PD', 'HB2C1PD', 'S11201',1,'HOSP PEDIAT P4 TB H2', 'CAMA PERSONAL HOSPITALIZACION PEDIATRICA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB3PD', 'HB3C1PD', 'S11201',1,'HOSP PEDIAT P4 TB H3', 'CAMA PERSONAL HOSPITALIZACION PEDIATRICA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB4PD', 'HB4C1PD', 'S11201',1,'HOSP PEDIAT P4 TB H4', 'CAMA PERSONAL HOSPITALIZACION PEDIATRICA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB5PD', 'HB5C1PD', 'S11201',1,'HOSP PEDIAT P4 TB H5', 'CAMA PERSONAL HOSPITALIZACION PEDIATRICA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB6PD', 'HB6C1PD', 'S11201',1,'HOSP PEDIAT P4 TB H6', 'CAMA PERSONAL HOSPITALIZACION PEDIATRICA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB7PD', 'HB7C1PD', 'S11201',1,'HOSP PEDIAT P4 TB H7', 'CAMA PERSONAL HOSPITALIZACION PEDIATRICA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB8PD', 'HB8C1PD', 'S11201',1,'HOSP PEDIAT P4 TB H8', 'CAMA PERSONAL HOSPITALIZACION PEDIATRICA', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB9PD', 'HB9C1PD', 'S11201',1,'HOSP PEDIAT P4 TB H9', 'CAMA PERSONAL HOSPITALIZACION PEDIATRICA', 1, 14, 2, NOW(), 2);
--Insertar a los usuarios para ADULTOS
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('HPPD', '2803','10');

--------------------------------------------------------
HEMODINAMIA
--------------------------------------------------------
--DEPARTAMENTO HEMODINAMIA
INSERT INTO departamentos VALUES ('01', '01', '0001', 'HEMOD', 'Hemodinamia', '1', '8', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', NULL, NULL, NULL, '3', '1', '0', '1', '0', '1', '0', '1', NULL, '0', NULL, 1, '0', '1', '0', '0', NULL, NULL);
--ESTACION HEMODINAMIA
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO estaciones_enfermeria VALUES ('HPHE', 'Hospitalizacion Hemodinamia', 'HEMOD', 'Hospitalizacion', 'EnfermeriaHosp', 'UrgenciasConsulta', 'Hospitalizacion Hemodinamia', 2, '1', '0', '0', NULL, 'QX_Cirujano', '', '', '', '', 'EnfermeriaHosp', '0', '0', 2, NOW(), '0', '0', '1', '1', '0', 0, NULL, '1', '1', '1', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para hospi HEMODINAMIA
--pieza	estacion_id	descripcion	cantidad_camas	ubicacion	sw_virtual	usuario_id	fecha_registro
INSERT INTO piezas VALUES('HB1HE','HPHE','HAB HEMODINAMIA 1',1,'HAB PED 1',NULL,2,NOW());
INSERT INTO piezas VALUES('HB2HE','HPHE','HAB HEMODINAMIA 2',1,'HAB PED 2',NULL,2,NOW());
INSERT INTO piezas VALUES('HB3HE','HPHE','HAB HEMODINAMIA 3',1,'HAB PED 3',NULL,2,NOW());
INSERT INTO piezas VALUES('HB4HE','HPHE','HAB HEMODINAMIA 4',1,'HAB PED 4',NULL,2,NOW());
INSERT INTO piezas VALUES('HB5HE','HPHE','HAB HEMODINAMIA 5',1,'HAB PED 5',NULL,2,NOW());
INSERT INTO piezas VALUES('HB6HE','HPHE','HAB HEMODINAMIA 6',1,'HAB PED 6',NULL,2,NOW());
INSERT INTO piezas VALUES('HB7HE','HPHE','HAB HEMODINAMIA 7',1,'HAB PED 7',NULL,2,NOW());
INSERT INTO piezas VALUES('HB8HE','HPHE','HAB HEMODINAMIA 8',1,'HAB PED 8',NULL,2,NOW());
INSERT INTO piezas VALUES('HB9HE','HPHE','HAB HEMODINAMIA 9',1,'HAB PED 9',NULL,2,NOW());
INSERT INTO piezas VALUES('HB10HE','HPHE','HAB HEMODINAMIA 10',1,'HAB PED 10',NULL,2,NOW());
INSERT INTO piezas VALUES('HB11HE','HPHE','HAB HEMODINAMIA 11',1,'HAB PED 11',NULL,2,NOW());
--cups de la habitacion S11201
--camas para HEMODINAMIA
--pieza	cama	cargo	estado	ubicacion	descripcion	sw_virtual	tipo_cama_id	usuario_id	fecha_registro	virtual_real
INSERT INTO camas VALUES ('HB1HE', 'HB1C1HE', 'S11201',1,'HOSP HEMOD H1', 'CAMA PERSONAL HOSPITALIZACION HEMODI', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB2HE', 'HB2C1HE', 'S11201',1,'HOSP HEMOD H2', 'CAMA PERSONAL HOSPITALIZACION HEMODI', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB3HE', 'HB3C1HE', 'S11201',1,'HOSP HEMOD H3', 'CAMA PERSONAL HOSPITALIZACION HEMODI', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB4HE', 'HB4C1HE', 'S11201',1,'HOSP HEMOD H4', 'CAMA PERSONAL HOSPITALIZACION HEMODI', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB5HE', 'HB5C1HE', 'S11201',1,'HOSP HEMOD H5', 'CAMA PERSONAL HOSPITALIZACION HEMODI', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB6HE', 'HB6C1HE', 'S11201',1,'HOSP HEMOD H6', 'CAMA PERSONAL HOSPITALIZACION HEMODI', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB7HE', 'HB7C1HE', 'S11201',1,'HOSP HEMOD H7', 'CAMA PERSONAL HOSPITALIZACION HEMODI', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB8HE', 'HB8C1HE', 'S11201',1,'HOSP HEMOD H8', 'CAMA PERSONAL HOSPITALIZACION HEMODI', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB9HE', 'HB9C1HE', 'S11201',1,'HOSP HEMOD H9', 'CAMA PERSONAL HOSPITALIZACION HEMODI', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB10HE', 'HB10C1HE', 'S11201',1,'HOSP HEMOD H10', 'CAMA PERSONAL HOSPITALIZACION HEMODI', 1, 14, 2, NOW(), 2);
INSERT INTO camas VALUES ('HB11HE', 'HB11C1HE', 'S11201',1,'HOSP HEMOD H11', 'CAMA PERSONAL HOSPITALIZACION HEMODI', 1, 14, 2, NOW(), 2);
--Insertar a los usuarios para HEMODINAMIA
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('HPHE', '2803','10');


--------------------------------------------------------
SALA DE PROCEDIMIENTOS
--------------------------------------------------------
--DEPARTAMENTO SALA DE PROCEDIMIENTOS
INSERT INTO departamentos VALUES ('01', '01', '0001', 'SPROC', 'Sala Procedimientos', '1', '1', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', NULL, NULL, NULL, '3', '1', '0', '1', '0', '1', '0', '1', NULL, '0', NULL, 1, '0', '1', '0', '0', NULL, NULL);
--ESTACION HEMODINAMIA
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO estaciones_enfermeria VALUES ('SAPR', 'Sala Procedimientos', 'SPROC', 'Hospitalizacion', 'EnfermeriaHosp', 'UrgenciasConsulta', 'Sala Procedimientos', 2, '1', '0', '0', NULL, 'QX_Cirujano', '', '', '', '', 'EnfermeriaHosp', '0', '0', 2, NOW(), '0', '0', '1', '1', '0', 0, NULL, '1', '1', '1', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para hospi HEMODINAMIA
--pieza	estacion_id	descripcion	cantidad_camas	ubicacion	sw_virtual	usuario_id	fecha_registro
INSERT INTO piezas VALUES('SP1','SAPR','SALA PROCEDIMIENTO 1',1,'SAL PRO 1',NULL,2,NOW());

--cups de la habitacion S11201
--camas para HEMODINAMIA
--pieza	cama	cargo	estado	ubicacion	descripcion	sw_virtual	tipo_cama_id	usuario_id	fecha_registro	virtual_real
INSERT INTO camas VALUES ('SP1', 'SAPR1', 'S11201',1,'SAL PRO 1', 'PROCEDIMIENTOS', 1, 14, 2, NOW(), 2);
--Insertar a los usuarios para HEMODINAMIA
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('SAPR', '2803','10');

--------------------------------------------------------
UCI ADULTOS
--------------------------------------------------------
--DEPARTAMENTO UCI ADULTO
INSERT INTO departamentos VALUES ('01', '01', '0001', 'UCIADU', 'UCI ADULTO P3 TB', '1', '7', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', NULL, NULL, NULL, '3', '1', '0', '1', '0', '1', '1', '1', NULL, '0', NULL, 1, '0', '1', '0', '0', NULL, NULL);
--ESTACION UCI ADULTO
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO estaciones_enfermeria VALUES ('UCAD', 'UCI ADULTO', 'UCIADU', 'UCI', 'EnfermeriaUCI', 'UrgenciasConsulta', 'UCI ADULTO', 3, '1', '0', '0', NULL, 'QX_Cirujano', '', '', '', '', 'EnfermeriaUCI', '0', '0', 2, NOW(), '0', '1', '1', '1', '0', 0, NULL, '1', '1', '0', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para hospi UCI ADULTO
--pieza	estacion_id	descripcion	cantidad_camas	ubicacion	sw_virtual	usuario_id	fecha_registro
INSERT INTO piezas VALUES('UCI1AD','UCAD','HAB UCI 1',1,'HAB UCI 1',NULL,2,NOW());
INSERT INTO piezas VALUES('UCI2AD','UCAD','HAB UCI 2',1,'HAB UCI 2',NULL,2,NOW());
INSERT INTO piezas VALUES('UCI3AD','UCAD','HAB UCI 3',1,'HAB UCI 3',NULL,2,NOW());
INSERT INTO piezas VALUES('UCI4AD','UCAD','HAB UCI 4',1,'HAB UCI 4',NULL,2,NOW());
INSERT INTO piezas VALUES('UCI5AD','UCAD','HAB UCI 5',1,'HAB UCI 5',NULL,2,NOW());
INSERT INTO piezas VALUES('UCI6AD','UCAD','HAB UCI 6',1,'HAB UCI 6',NULL,2,NOW());
INSERT INTO piezas VALUES('UCI7AD','UCAD','HAB UCI 7',1,'HAB UCI 7',NULL,2,NOW());
INSERT INTO piezas VALUES('UCI8AD','UCAD','HAB UCI 8',1,'HAB UCI 8',NULL,2,NOW());
INSERT INTO piezas VALUES('UCI9AD','UCAD','HAB UCI 9',1,'HAB UCI 9',NULL,2,NOW());
--cups de la habitacion S11201
--camas para UCI ADULTO
--pieza	cama	cargo	estado	ubicacion	descripcion	sw_virtual	tipo_cama_id	usuario_id	fecha_registro	virtual_real
INSERT INTO camas VALUES ('UCI1AD', 'HB1C1UA', 'S12103',1,'UCI ADULTO H1', 'CAMA PERSONAL UCI ADULTO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UCI2AD', 'HB2C1UA', 'S12103',1,'UCI ADULTO H2', 'CAMA PERSONAL UCI ADULTO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UCI3AD', 'HB3C1UA', 'S12103',1,'UCI ADULTO H3', 'CAMA PERSONAL UCI ADULTO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UCI4AD', 'HB4C1UA', 'S12103',1,'UCI ADULTO H4', 'CAMA PERSONAL UCI ADULTO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UCI5AD', 'HB5C1UA', 'S12103',1,'UCI ADULTO H5', 'CAMA PERSONAL UCI ADULTO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UCI6AD', 'HB6C1UA', 'S12103',1,'UCI ADULTO H6', 'CAMA PERSONAL UCI ADULTO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UCI7AD', 'HB7C1UA', 'S12103',1,'UCI ADULTO H7', 'CAMA PERSONAL UCI ADULTO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UCI8AD', 'HB8C1UA', 'S12103',1,'UCI ADULTO H8', 'CAMA PERSONAL UCI ADULTO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UCI9AD', 'HB9C1UA', 'S12103',1,'UCI ADULTO H9', 'CAMA PERSONAL UCI ADULTO', 1, 3, 2, NOW(), 2);
--Insertar a los usuarios para UCI ADULTO
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('UCAD', '2803','10');

--------------------------------------------------------
UCI NEO
--------------------------------------------------------
--DEPARTAMENTO UCI NEO
INSERT INTO departamentos VALUES ('01', '01', '0001', 'UCINEO', 'UCI NEO P3 TB', '1', '7', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', NULL, NULL, NULL, '3', '1', '0', '1', '0', '1', '1', '1', NULL, '0', NULL, 1, '0', '1', '0', '0', NULL, NULL);
--ESTACION UCI NEO
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO estaciones_enfermeria VALUES ('UCNE', 'UCI NEO', 'UCINEO', 'UCI', 'EnfermeriaUCI', 'UrgenciasConsulta', 'UCI NEO', 3, '1', '0', '0', NULL, 'QX_Cirujano', '', '', '', '', 'EnfermeriaUCI', '0', '0', 2, NOW(), '0', '1', '1', '1', '0', 0, NULL, '1', '1', '0', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para hospi UCI NEO
--pieza	estacion_id	descripcion	cantidad_camas	ubicacion	sw_virtual	usuario_id	fecha_registro
INSERT INTO piezas VALUES('UC1NE','UCNE','CUNA BASICA 1',1,'CUNA BASICA 1',NULL,2,NOW());
INSERT INTO piezas VALUES('UC2NE','UCNE','CUNA BASICA 2',1,'CUNA BASICA 2',NULL,2,NOW());
INSERT INTO piezas VALUES('UC3NE','UCNE','CUNA BASICA 3',1,'CUNA BASICA 3',NULL,2,NOW());
INSERT INTO piezas VALUES('UC4NE','UCNE','CUNA INTERMEDIA 1',1,'CUNA INTERMEDIA 1',NULL,2,NOW());
INSERT INTO piezas VALUES('UC5NE','UCNE','CUNA INTERMEDIA 2',1,'CUNA INTERMEDIA 2',NULL,2,NOW());
INSERT INTO piezas VALUES('UC6NE','UCNE','CUNA INTERMEDIA 3',1,'CUNA INTERMEDIA 3',NULL,2,NOW());
INSERT INTO piezas VALUES('UC7NE','UCNE','CUNA INTERMEDIA 4',1,'CUNA INTERMEDIA 4',NULL,2,NOW());
INSERT INTO piezas VALUES('UC8NE','UCNE','CUNA INTERMEDIA 5',1,'CUNA INTERMEDIA 5',NULL,2,NOW());
INSERT INTO piezas VALUES('UC9NE','UCNE','CUNA INTENSIVA 1',1,'CUNA INTENSIVA 1',NULL,2,NOW());
INSERT INTO piezas VALUES('UC10NE','UCNE','CUNA INTENSIVA 2',1,'CUNA INTENSIVA 2',NULL,2,NOW());
INSERT INTO piezas VALUES('UC11NE','UCNE','CUNA INTENSIVA 3',1,'CUNA INTENSIVA 3',NULL,2,NOW());
INSERT INTO piezas VALUES('UC12NE','UCNE','CUNA INTENSIVA 4',1,'CUNA INTENSIVA 4',NULL,2,NOW());
INSERT INTO piezas VALUES('UC13NE','UCNE','CUNA INTENSIVA 5',1,'CUNA INTENSIVA 5',NULL,2,NOW());
--cups de la habitacion S11201
--camas para UCI NEO
--pieza	cama	cargo	estado	ubicacion	descripcion	sw_virtual	tipo_cama_id	usuario_id	fecha_registro	virtual_real
INSERT INTO camas VALUES ('UC1NE', 'HB1C1NE', 'S12103',1,'UCI NEO H1', 'CUNA BASICA UCI NEO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC2NE', 'HB2C1NE', 'S12103',1,'UCI NEO H2', 'CUNA BASICA UCI NEO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC3NE', 'HB3C1NE', 'S12103',1,'UCI NEO H3', 'CUNA BASICA UCI NEO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC4NE', 'HB4C1NE', 'S12103',1,'UCI NEO H4', 'CUNA INTERMEDIO UCI NEO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC5NE', 'HB5C1NE', 'S12103',1,'UCI NEO H5', 'CUNA INTERMEDIO UCI NEO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC6NE', 'HB6C1NE', 'S12103',1,'UCI NEO H6', 'CUNA INTERMEDIO UCI NEO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC7NE', 'HB7C1NE', 'S12103',1,'UCI NEO H7', 'CUNA INTERMEDIO UCI NEO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC8NE', 'HB8C1NE', 'S12103',1,'UCI NEO H8', 'CUNA INTERMEDIO UCI NEO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC9NE', 'HB9C1NE', 'S12103',1,'UCI NEO H9', 'CUNA INTENSIVA UCI NEO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC10NE', 'HB10C1NE', 'S12103',1,'UCI NEO H10', 'CAMA INTENSIVA UCI NEO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC11NE', 'HB11C1NE', 'S12103',1,'UCI NEO H11', 'CAMA INTENSIVA UCI NEO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC12NE', 'HB12C1NE', 'S12103',1,'UCI NEO H12', 'CAMA INTENSIVA UCI NEO', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC13NE', 'HB13C1NE', 'S12103',1,'UCI NEO H13', 'CAMA INTENSIVA UCI NEO', 1, 3, 2, NOW(), 2);
--Insertar a los usuarios para UCI NEO
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('UCNE', '2803','10');

--------------------------------------------------------
UCI PEDIATRICA
--------------------------------------------------------

--DEPARTAMENTO UCI PEDIATRICA
INSERT INTO departamentos VALUES ('01', '01', '0001', 'UCIPED', 'UCI PEDIATRICA', '1', '7', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', NULL, NULL, NULL, '3', '1', '0', '1', '0', '1', '1', '1', NULL, '0', NULL, 1, '0', '1', '0', '0', NULL, NULL);
--ESTACION UCI PEDIATRICA
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO estaciones_enfermeria VALUES ('UCPE', 'UCI PEDIATRICA', 'UCIPED', 'UCI', 'EnfermeriaUCI', 'UrgenciasConsulta', 'UCI PEDIATRICA', 3, '1', '0', '0', NULL, 'QX_Cirujano', '', '', '', '', 'EnfermeriaUCI', '0', '0', 2, NOW(), '0', '1', '1', '1', '0', 0, NULL, '1', '1', '0', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para hospi UCI PEDIATRICA
--pieza	estacion_id	descripcion	cantidad_camas	ubicacion	sw_virtual	usuario_id	fecha_registro
INSERT INTO piezas VALUES('UC1PE','UCPE','UCI INTERMEDIA PED 1',1,'UCI INTERMEDIA PED 1',NULL,2,NOW());
INSERT INTO piezas VALUES('UC2PE','UCPE','UCI INTERMEDIA PED 2',1,'UCI INTERMEDIA PED 2',NULL,2,NOW());
INSERT INTO piezas VALUES('UC3PE','UCPE','UCI INTERMEDIA PED 3',1,'UCI INTERMEDIA PED 3',NULL,2,NOW());
INSERT INTO piezas VALUES('UC4PE','UCPE','UCI INTENSIVA PED 1',1,'UCI INTENSIVA PED 1',NULL,2,NOW());
INSERT INTO piezas VALUES('UC5PE','UCPE','UCI INTENSIVA PED 2',1,'UCI INTENSIVA PED 2',NULL,2,NOW());
INSERT INTO piezas VALUES('UC6PE','UCPE','UCI INTENSIVA PED 3',1,'UCI INTENSIVA PED 3',NULL,2,NOW());
INSERT INTO piezas VALUES('UC7PE','UCPE','UCI INTENSIVA PED 4',1,'UCI INTENSIVA PED 4',NULL,2,NOW());
INSERT INTO piezas VALUES('UC8PE','UCPE','UCI INTENSIVA PED 5',1,'UCI INTENSIVA PED 5',NULL,2,NOW());
--cups de la habitacion S11201
--camas para UCI PEDIATRICA
--pieza	cama	cargo	estado	ubicacion	descripcion	sw_virtual	tipo_cama_id	usuario_id	fecha_registro	virtual_real
INSERT INTO camas VALUES ('UC1PE', 'HB1C1PE', 'S12103',1,'UCI PEDIATRICA H1', 'HABITACION INTERMEDIA UCI PEDIATRICA', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC2PE', 'HB2C1PE', 'S12103',1,'UCI PEDIATRICA H2', 'HABITACION INTERMEDIA UCI PEDIATRICA', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC3PE', 'HB3C1PE', 'S12103',1,'UCI PEDIATRICA H3', 'HABITACION INTERMEDIA UCI PEDIATRICA', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC4PE', 'HB4C1PE', 'S12103',1,'UCI PEDIATRICA H4', 'HABITAICON INTENSIVA UCI PEDIATRICA', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC5PE', 'HB5C1PE', 'S12103',1,'UCI PEDIATRICA H5', 'HABITAICON INTENSIVA UCI PEDIATRICA', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC6PE', 'HB6C1PE', 'S12103',1,'UCI PEDIATRICA H6', 'HABITAICON INTENSIVA UCI PEDIATRICA', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC7PE', 'HB7C1PE', 'S12103',1,'UCI PEDIATRICA H7', 'HABITAICON INTENSIVA UCI PEDIATRICA', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC8PE', 'HB8C1PE', 'S12103',1,'UCI PEDIATRICA H8', 'HABITAICON INTENSIVA UCI PEDIATRICA', 1, 3, 2, NOW(), 2);
--Insertar a los usuarios para UCI PEDIATRICA
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('UCPE', '2803','10');

--------------------------------------------------------
TRABAJO DE PARTO
--------------------------------------------------------
--DEPARTAMENTO TRABAJO DE PARTO
INSERT INTO departamentos VALUES ('01', '01', '0001', 'TRAPA', 'Trabajo De Parto', '1', '7', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', NULL, NULL, NULL, '3', '1', '0', '1', '0', '1', '1', '1', NULL, '0', NULL, 1, '0', '1', '0', '0', NULL, NULL);
--ESTACION TRABAJO DE PARTO
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO estaciones_enfermeria VALUES ('TRPA', 'TRABAJO DE PARTO', 'TRAPA', 'UCI', 'EnfermeriaUCI', 'UrgenciasConsulta', 'TRABAJO DE PARTO', 3, '1', '0', '0', NULL, 'QX_Cirujano', '', '', '', '', 'EnfermeriaUCI', '0', '0', 2, NOW(), '0', '1', '1', '1', '0', 0, NULL, '1', '1', '0', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para hospi TRABAJO DE PARTO
--pieza	estacion_id	descripcion	cantidad_camas	ubicacion	sw_virtual	usuario_id	fecha_registro
INSERT INTO piezas VALUES('UC1TP','TRPA','SALA PARTOS 1',1,'SALA PARTOS 1',NULL,2,NOW());
INSERT INTO piezas VALUES('UC2TP','TRPA','SALA PARTOS 2',1,'SALA PARTOS 2',NULL,2,NOW());
INSERT INTO piezas VALUES('UC3TP','TRPA','SALA PARTOS 3',1,'SALA PARTOS 3',NULL,2,NOW());
INSERT INTO piezas VALUES('UC4TP','TRPA','SALA PARTOS 4',1,'SALA PARTOS 4',NULL,2,NOW());
--cups de la habitacion S11201
--camas para TRABAJO DE PARTO
--pieza	cama	cargo	estado	ubicacion	descripcion	sw_virtual	tipo_cama_id	usuario_id	fecha_registro	virtual_real
INSERT INTO camas VALUES ('UC1TP', 'SA1C1TP', 'S12103',1,'SALA PARTOS H1', 'SALA PARTOS', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC2TP', 'SA2C1TP', 'S12103',1,'SALA PARTOS H2', 'SALA PARTOS', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC3TP', 'SA3C1TP', 'S12103',1,'SALA PARTOS H3', 'SALA PARTOS', 1, 3, 2, NOW(), 2);
INSERT INTO camas VALUES ('UC4TP', 'SA4C1TP', 'S12103',1,'SALA PARTOS H4', 'SALA PARTOS', 1, 3, 2, NOW(), 2);
--Insertar a los usuarios para UCI PEDIATRICA
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('TRPA', '2803','10');

--------------------------------------------------------
URGENCIAS
--------------------------------------------------------
--DEPARTAMENTO URGENCIAS
INSERT INTO departamentos VALUES ('01', '01', '0001', 'URG', 'URGENCIAS', '1', '4', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', '', '', '', '3', '1', '0', '1', '0', '1', '0', '1', NULL, '0', NULL, 1, '0', '1', '0', '0', NULL, NULL);
--ESTACION URGENCIAS
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO estaciones_enfermeria VALUES ('URG', 'URGENCIAS', 'URG', 'UrgenciasConsulta', 'Estacion_Enfermeria_Urgencias', 'UrgenciasConsulta', 'URGENCIAS', 1, '1', '0', '1', '0', 'QX_Cirujano', '', '', '', '', 'Estacion_Enfermeria_Urgencias', '0', '0', 2, '2016-03-29 21:52:51.171449', '0', '0', '1', '1', '0', 0, NULL, '1', '1', '0', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para hospi URGENCIAS
--pieza	estacion_id	descripcion	cantidad_camas	ubicacion	sw_virtual	usuario_id	fecha_registro
INSERT INTO piezas VALUES('UR1C','URG','CAMILLA URGENCIAS 1',1,'CAMILLA URGENCIAS 1',NULL,2,NOW());
INSERT INTO piezas VALUES('UR2C','URG','CAMILLA URGENCIAS 2',1,'CAMILLA URGENCIAS 2',NULL,2,NOW());
INSERT INTO piezas VALUES('UR3C','URG','CAMILLA URGENCIAS 3',1,'CAMILLA URGENCIAS 3',NULL,2,NOW());
INSERT INTO piezas VALUES('UR4C','URG','CAMILLA URGENCIAS 4',1,'CAMILLA URGENCIAS 4',NULL,2,NOW());
INSERT INTO piezas VALUES('UR5C','URG','CAMILLA URGENCIAS 5',1,'CAMILLA URGENCIAS 5',NULL,2,NOW());
INSERT INTO piezas VALUES('UR6C','URG','CAMILLA URGENCIAS 6',1,'CAMILLA URGENCIAS 6',NULL,2,NOW());
INSERT INTO piezas VALUES('UR7C','URG','CAMILLA URGENCIAS 7',1,'CAMILLA URGENCIAS 7',NULL,2,NOW());
INSERT INTO piezas VALUES('UR8C','URG','CAMILLA URGENCIAS 8',1,'CAMILLA URGENCIAS 8',NULL,2,NOW());
INSERT INTO piezas VALUES('UR9C','URG','CAMILLA URGENCIAS 9',1,'CAMILLA URGENCIAS 9',NULL,2,NOW());
INSERT INTO piezas VALUES('UR10C','URG','CAMILLA URGENCIAS 10',1,'CAMILLA URGENCIAS 10',NULL,2,NOW());
INSERT INTO piezas VALUES('UR11C','URG','CAMILLA URGENCIAS 11',1,'CAMILLA URGENCIAS 11',NULL,2,NOW());
INSERT INTO piezas VALUES('UR12C','URG','CAMILLA URGENCIAS 12',1,'CAMILLA URGENCIAS 12',NULL,2,NOW());
INSERT INTO piezas VALUES('UR13C','URG','CAMILLA URGENCIAS 13',1,'CAMILLA URGENCIAS 13',NULL,2,NOW());
INSERT INTO piezas VALUES('UR14C','URG','CAMILLA URGENCIAS 14',1,'CAMILLA URGENCIAS 14',NULL,2,NOW());
--cups de la habitacion S20100
--camas para URGENCIAS
--pieza	cama	cargo	estado	ubicacion	descripcion	sw_virtual	tipo_cama_id	usuario_id	fecha_registro	virtual_real
INSERT INTO camas VALUES ('UR1C', 'CM1C1UR', 'S20100',1,'CAMILLA URGENCIAS 1', 'CAMILLA URGENCIAS', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR2C', 'CM2C1UR', 'S20100',1,'CAMILLA URGENCIAS 2', 'CAMILLA URGENCIAS', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR3C', 'CM3C1UR', 'S20100',1,'CAMILLA URGENCIAS 3', 'CAMILLA URGENCIAS', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR4C', 'CM4C1UR', 'S20100',1,'CAMILLA URGENCIAS 4', 'CAMILLA URGENCIAS', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR5C', 'CM5C1UR', 'S20100',1,'CAMILLA URGENCIAS 5', 'CAMILLA URGENCIAS', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR6C', 'CM6C1UR', 'S20100',1,'CAMILLA URGENCIAS 6', 'CAMILLA URGENCIAS', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR7C', 'CM7C1UR', 'S20100',1,'CAMILLA URGENCIAS 7', 'CAMILLA URGENCIAS', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR8C', 'CM8C1UR', 'S20100',1,'CAMILLA URGENCIAS 8', 'CAMILLA URGENCIAS', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR9C', 'CM9C1UR', 'S20100',1,'CAMILLA URGENCIAS 9', 'CAMILLA URGENCIAS', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR10C', 'CM10C1UR', 'S20100',1,'CAMILLA URGENCIAS 10', 'CAMILLA URGENCIAS', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR11C', 'CM11C1UR', 'S20100',1,'CAMILLA URGENCIAS 11', 'CAMILLA URGENCIAS', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR12C', 'CM12C1UR', 'S20100',1,'CAMILLA URGENCIAS 12', 'CAMILLA URGENCIAS', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR13C', 'CM13C1UR', 'S20100',1,'CAMILLA URGENCIAS 13', 'CAMILLA URGENCIAS', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR14C', 'CM14C1UR', 'S20100',1,'CAMILLA URGENCIAS 14', 'CAMILLA URGENCIAS', 1, 68, 2, NOW(), 2);
--Insertar a los usuarios para UCI PEDIATRICA
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('URG', '2803','10');

--------------------------------------------------------
URGENCIAS PEDIATRIA
--------------------------------------------------------
--DEPARTAMENTO URGENCIAS PEDIATRIA
INSERT INTO departamentos VALUES ('01', '01', '0001', 'URGPE', 'URGENCIAS PEDIATRIA', '1', '4', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', '', '', '', '3', '1', '0', '1', '0', '1', '0', '1', NULL, '0', NULL, 1, '0', '1', '0', '0', NULL, NULL);
--ESTACION URGENCIAS PEDIATRIA
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO estaciones_enfermeria VALUES ('URPE', 'URGENCIAS PEDIATRIA', 'URGPE', 'UrgenciasConsulta', 'Estacion_Enfermeria_Urgencias', 'UrgenciasConsulta', 'URGENCIAS', 1, '1', '0', '1', '0', 'QX_Cirujano', '', '', '', '', 'Estacion_Enfermeria_Urgencias', '0', '0', 2, '2016-03-29 21:52:51.171449', '0', '0', '1', '1', '0', 0, NULL, '1', '1', '0', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para hospi URGENCIAS PEDIATRIA
--pieza	estacion_id	descripcion	cantidad_camas	ubicacion	sw_virtual	usuario_id	fecha_registro
INSERT INTO piezas VALUES('UR1P','URPE','CAMILLA URG PEDIAT 1',1,'CAMILLA URG PEDIAT 1',NULL,2,NOW());
INSERT INTO piezas VALUES('UR2P','URPE','CAMILLA URG PEDIAT 2',1,'CAMILLA URG PEDIAT 2',NULL,2,NOW());
INSERT INTO piezas VALUES('UR3P','URPE','CAMILLA URG PEDIAT 3',1,'CAMILLA URG PEDIAT 3',NULL,2,NOW());
INSERT INTO piezas VALUES('UR4P','URPE','CAMILLA URG PEDIAT 4',1,'CAMILLA URG PEDIAT 4',NULL,2,NOW());
INSERT INTO piezas VALUES('UR5P','URPE','CAMILLA URG PEDIAT 5',1,'CAMILLA URG PEDIAT 5',NULL,2,NOW());
--cups de la habitacion S20100
--camas para URGENCIAS PEDIATRIA
--pieza	cama	cargo	estado	ubicacion	descripcion	sw_virtual	tipo_cama_id	usuario_id	fecha_registro	virtual_real
INSERT INTO camas VALUES ('UR1P', 'CM1URPE', 'S20100',1,'URGENCIA PEDIATRIA 1', 'CAMILLA URGENCIAS PEDIATRIA', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR2P', 'CM2URPE', 'S20100',1,'URGENCIA PEDIATRIA 2', 'CAMILLA URGENCIAS PEDIATRIA', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR3P', 'CM3URPE', 'S20100',1,'URGENCIA PEDIATRIA 3', 'CAMILLA URGENCIAS PEDIATRIA', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR4P', 'CM4URPE', 'S20100',1,'URGENCIA PEDIATRIA 4', 'CAMILLA URGENCIAS PEDIATRIA', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('UR5P', 'CM5URPE', 'S20100',1,'URGENCIA PEDIATRIA 5', 'CAMILLA URGENCIAS PEDIATRIA', 1, 68, 2, NOW(), 2);
--Insertar a los usuarios para URGENCIA PEDIATRICA
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('URPE', '2803','10');

--------------------------------------------------------
SALA ERA PEDIATRIA
--------------------------------------------------------
--DEPARTAMENTO SALA ERA PEDIATRIA
INSERT INTO departamentos VALUES ('01', '01', '0001', 'ERAPE', 'SALA ERA PEDIATRIA', '1', '4', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', '', '', '', '3', '1', '0', '1', '0', '1', '0', '1', NULL, '0', NULL, 1, '0', '1', '0', '0', NULL, NULL);
--ESTACION SALA ERA PEDIATRIA
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO estaciones_enfermeria VALUES ('ERPE', 'SALA ERA PEDIATRIA', 'ERAPE', 'UrgenciasConsulta', 'Estacion_Enfermeria_Urgencias', 'UrgenciasConsulta', 'URGENCIAS', 1, '1', '0', '1', '0', 'QX_Cirujano', '', '', '', '', 'Estacion_Enfermeria_Urgencias', '0', '0', 2, '2016-03-29 21:52:51.171449', '0', '0', '1', '1', '0', 0, NULL, '1', '1', '0', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para hospi SALA ERA PEDIATRIA
--pieza	estacion_id	descripcion	cantidad_camas	ubicacion	sw_virtual	usuario_id	fecha_registro
INSERT INTO piezas VALUES('ER1P','ERPE','SILLA ERA PEDIAT 1',1,'SILLA ERA PEDIAT 1',NULL,2,NOW());
INSERT INTO piezas VALUES('ER2P','ERPE','SILLA ERA PEDIAT 2',1,'SILLA ERA PEDIAT 2',NULL,2,NOW());
INSERT INTO piezas VALUES('ER3P','ERPE','SILLA ERA PEDIAT 3',1,'SILLA ERA PEDIAT 3',NULL,2,NOW());
INSERT INTO piezas VALUES('ER4P','ERPE','SILLA ERA PEDIAT 4',1,'SILLA ERA PEDIAT 4',NULL,2,NOW());
INSERT INTO piezas VALUES('ER5P','ERPE','SILLA ERA PEDIAT 5',1,'SILLA ERA PEDIAT 5',NULL,2,NOW());
--cups de la habitacion S20100
--camas para SALA ERA PEDIATRIA
--pieza	cama	cargo	estado	ubicacion	descripcion	sw_virtual	tipo_cama_id	usuario_id	fecha_registro	virtual_real
INSERT INTO camas VALUES ('ER1P', 'SI1ERPE', 'S20100',1,'SILLA ERA 1', 'SALA ERA PEDIATRIA', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('ER2P', 'SI2ERPE', 'S20100',1,'SILLA ERA 2', 'SALA ERA PEDIATRIA', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('ER3P', 'SI3ERPE', 'S20100',1,'SILLA ERA 3', 'SALA ERA PEDIATRIA', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('ER4P', 'SI4ERPE', 'S20100',1,'SILLA ERA 4', 'SALA ERA PEDIATRIA', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('ER5P', 'SI5ERPE', 'S20100',1,'SILLA ERA 5', 'SALA ERA PEDIATRIA', 1, 68, 2, NOW(), 2);
--Insertar a los usuarios para SALA ERA PEDIATRICA
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('ERPE', '2803','10');

--------------------------------------------------------
SALA EDA PEDIATRIA
--------------------------------------------------------
--DEPARTAMENTO SALA EDA PEDIATRIA
INSERT INTO departamentos VALUES ('01', '01', '0001', 'EDAPE', 'SALA EDA PEDIATRIA', '1', '4', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', '', '', '', '3', '1', '0', '1', '0', '1', '0', '1', NULL, '0', NULL, 1, '0', '1', '0', '0', NULL, NULL);
--ESTACION SALA EDA PEDIATRIA
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO estaciones_enfermeria VALUES ('EDPE', 'SALA EDA PEDIATRIA', 'EDAPE', 'UrgenciasConsulta', 'Estacion_Enfermeria_Urgencias', 'UrgenciasConsulta', 'URGENCIAS', 1, '1', '0', '1', '0', 'QX_Cirujano', '', '', '', '', 'Estacion_Enfermeria_Urgencias', '0', '0', 2, '2016-03-29 21:52:51.171449', '0', '0', '1', '1', '0', 0, NULL, '1', '1', '0', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para hospi SALA ERA PEDIATRIA
--pieza	estacion_id	descripcion	cantidad_camas	ubicacion	sw_virtual	usuario_id	fecha_registro
INSERT INTO piezas VALUES('ED1P','EDPE','SILLA EDA PEDIAT 1',1,'SILLA EDA PEDIAT 1',NULL,2,NOW());
--cups de la habitacion S20100
--camas para SALA ERA PEDIATRIA
--pieza	cama	cargo	estado	ubicacion	descripcion	sw_virtual	tipo_cama_id	usuario_id	fecha_registro	virtual_real
INSERT INTO camas VALUES ('ED1P', 'SI1EDPE', 'S20100',1,'SILLA EDA 1', 'SALA EDA PEDIATRIA', 1, 68, 2, NOW(), 2);
--Insertar a los usuarios para SALA EDA PEDIATRICA
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('EDPE', '2803','10');

--------------------------------------------------------
CIRUGIA
--------------------------------------------------------
--DEPARTAMENTO CIRUGIA
INSERT INTO public.departamentos VALUES ('01', '01', '0001', 'CIRUUR', 'Cirugia', '1', '6', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', '', '', '', '3', '1', '0', '1', '0', '1', '0', '1', NULL, '0', NULL, 1, '0', '1', '0', '1', NULL, NULL);
--ESTACION CIRUGIA
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO public.estaciones_enfermeria VALUES ('QXUR', 'Cirugia Urgencias', 'CIRUUR', 'QX_Cirujano', 'Estacion_Enfermeria_Urgencias', 'QX_Cirujano', 'CIRUGIA', 4, '0', '0', '0', '1', 'QX_Cirujano', 'QX_Anestesiologo', 'QX_Cirujano', 'EnfermeriaQx', 'QX_Instrumentador', 'EnfermeriaQx', '0', '0', 2, NOW(), '0', '0', '1', '1', '0', 0, NULL, '1', '1', '1', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para hospi CIRUGIA
--quirofano	descripcion	estado	departamento	abreviatura	tipo_sala_id	sw_programacion	usuario_id	fecha_registro
INSERT INTO public.qx_quirofanos VALUES ('QXU1', 'QUIROFANO 1', '1', 'CIRUUR', 'QX1', '01', '1', 2, NOW());
INSERT INTO public.qx_quirofanos VALUES ('QXU2', 'QUIROFANO 2', '1', 'CIRUUR', 'QX2', '01', '1', 2, NOW());
INSERT INTO public.qx_quirofanos VALUES ('QXU3', 'QUIROFANO 3', '1', 'CIRUUR', 'QX3', '01', '1', 2, NOW());
--Insertar a los usuarios para CIRUGIA
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('QXUR', '2803','10');

--------------------------------------------------------
CIRUGIA Obstetricia
--------------------------------------------------------
--DEPARTAMENTO CIRUGIA Obstetricia
INSERT INTO public.departamentos VALUES ('01', '01', '0001', 'CIRUOB', 'Cirugia Obstetricia', '1', '6', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', '', '', '', '3', '1', '0', '1', '0', '1', '0', '1', NULL, '0', NULL, 1, '0', '1', '0', '1', NULL, NULL);
--ESTACION CIRUGIA
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO public.estaciones_enfermeria VALUES ('QXOB', 'Cirugia Obstetricia', 'CIRUOB', 'QX_Cirujano', 'Estacion_Enfermeria_Urgencias', 'QX_Cirujano', 'CIRUGIA', 4, '0', '0', '0', '1', 'QX_Cirujano', 'QX_Anestesiologo', 'QX_Cirujano', 'EnfermeriaQx', 'QX_Instrumentador', 'EnfermeriaQx', '0', '0', 2, NOW(), '0', '0', '1', '1', '0', 0, NULL, '1', '1', '1', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para hospi CIRUGIA Obstetricia
--quirofano	descripcion	estado	departamento	abreviatura	tipo_sala_id	sw_programacion	usuario_id	fecha_registro
INSERT INTO public.qx_quirofanos VALUES ('QXO1', 'QUIROFANO 1', '1', 'CIRUOB', 'QXO1', '01', '1', 2, NOW());
--Insertar a los usuarios para CIRUGIA Obstetricia
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('QXOB', '2803','10');

--------------------------------------------------------
RECUPERACION CIRUGIA
--------------------------------------------------------
--DEPARTAMENTO RECUPERACION CIRUGIA
INSERT INTO public.departamentos VALUES ('01', '01', '0001', 'RECIRU', 'Recuperacion Cirugia', '1', '6', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', '', '', '', '3', '1', '0', '1', '0', '1', '0', '1', NULL, '0', NULL, 1, '0', '1', '0', '1', NULL, NULL);
--ESTACION RECUPERACION CIRUGIA
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO public.estaciones_enfermeria VALUES ('REQX', 'Recuperacion Cirugia', 'RECIRU', 'QX_Cirujano', 'Estacion_Enfermeria_Urgencias', 'QX_Cirujano', 'CIRUGIA', 4, '0', '0', '0', '1', 'QX_Cirujano', 'QX_Anestesiologo', 'QX_Cirujano', 'EnfermeriaQx', 'QX_Instrumentador', 'EnfermeriaQx', '0', '0', 2, NOW(), '0', '0', '1', '1', '0', 0, NULL, '1', '1', '1', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para   RECUPERACION CIRUGIA
--pieza	estacion_id	descripcion	cantidad_camas	ubicacion	sw_virtual	usuario_id	fecha_registro
INSERT INTO piezas VALUES('RQX1','REQX','HAB RECUPERACION QX1',1,'HAB RECUPERACION QX1',NULL,2,NOW());
INSERT INTO piezas VALUES('RQX2','REQX','HAB RECUPERACION QX2',1,'HAB RECUPERACION QX2',NULL,2,NOW());
INSERT INTO piezas VALUES('RQX3','REQX','HAB RECUPERACION QX3',1,'HAB RECUPERACION QX3',NULL,2,NOW());
INSERT INTO piezas VALUES('RQX4','REQX','HAB RECUPERACION QX4',1,'HAB RECUPERACION QX4',NULL,2,NOW());
INSERT INTO piezas VALUES('RQX5','REQX','HAB RECUPERACION QX5',1,'HAB RECUPERACION QX5',NULL,2,NOW());
INSERT INTO piezas VALUES('RQX6','REQX','HAB RECUPERACION QX6',1,'HAB RECUPERACION QX6',NULL,2,NOW());
--cups de la habitacion S20100
--camas para RECUPERACION CIRUGIA
--pieza	cama	cargo	estado	ubicacion	descripcion	sw_virtual	tipo_cama_id	usuario_id	fecha_registro	virtual_real
INSERT INTO camas VALUES ('RQX1', 'CRQX1', 'S20100',1,'CAMA REC QX 1', 'CAMA REC QX 1', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('RQX2', 'CRQX2', 'S20100',1,'CAMA REC QX 2', 'CAMA REC QX 2', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('RQX3', 'CRQX3', 'S20100',1,'CAMA REC QX 3', 'CAMA REC QX 3', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('RQX4', 'CRQX4', 'S20100',1,'CAMA REC QX 4', 'CAMA REC QX 4', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('RQX5', 'CRQX5', 'S20100',1,'CAMA REC QX 5', 'CAMA REC QX 5', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ('RQX6', 'CRQX6', 'S20100',1,'CAMA REC QX 6', 'CAMA REC QX 6', 1, 68, 2, NOW(), 2);
--Insertar a los usuarios para SALA ERA PEDIATRICA
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('REQX', '2803','10');

--------------------------------------------------------
ADMISION PACIENTE CIRUGIA
--------------------------------------------------------
--DEPARTAMENTO ADMISION PACIENTE CIRUGIA
INSERT INTO public.departamentos VALUES ('01', '01', '0001', 'ADQX', 'Adm Paciente Cirugia', '1', '6', NULL, 'Avenida 3 Norte # 32AN-40, Cali, Valle del Cauca', '', '', '', '3', '1', '0', '1', '0', '1', '0', '1', NULL, '0', NULL, 1, '0', '1', '0', '1', NULL, NULL);
--ESTACION ADMISION PACIENTE CIRUGIA
--estacion_id	descripcion	departamento	hc_modulo_medico	hc_modulo_enfermera	hc_modulo_consulta_urgencias	titulo_atencion_pacientes	tipo_atencion_estacion_id	sw_solicita_dietas	sw_observacion_urgencia	sw_consulta_urgencia	sw_estacion_cirugia	hc_modulo_cirujano	hc_modulo_anestesiologo	hc_modulo_ayudante	hc_modulo_circulante	hc_modulo_instrumentador	hc_modulo_enfermeria	copiar_evolucion	sw_atiende_especialista	usuario_id	fecha_registro	sw_ordenes_urgentes	seleccion_medico_avalista	sw_productos_pendientes	sw_productos_confirmar	sw_eliminar_glucometria	tiempo_nota	hora_corte	permitir_solicitudes	suministro_rapido	sw_estado	sw_estacion_hemodiaisis	correo_ingreso	correo_egreso	plantilla_correo_ingreso	plantilla_correo_egreso	rips_servicio_id
INSERT INTO public.estaciones_enfermeria VALUES ('ADQX', 'Adm Paciente Cirugia', 'ADQX', 'QX_Cirujano', 'Estacion_Enfermeria_Urgencias', 'QX_Cirujano', 'CIRUGIA', 4, '0', '0', '0', '1', 'QX_Cirujano', 'QX_Anestesiologo', 'QX_Cirujano', 'EnfermeriaQx', 'QX_Instrumentador', 'EnfermeriaQx', '0', '0', 2, NOW(), '0', '0', '1', '1', '0', 0, NULL, '1', '1', '1', NULL, '0', '0', NULL, NULL, NULL);
--piezas o habitaciones para   ADMISION PACIENTE CIRUGIA
--pieza	estacion_id	descripcion	cantidad_camas	ubicacion	sw_virtual	usuario_id	fecha_registro
INSERT INTO piezas VALUES('AQX1','ADQX','ADM PACIENTES QX 1',1,'ADM PACIENTES QX 1',NULL,2,NOW());
INSERT INTO piezas VALUES('AQX2','ADQX','ADM PACIENTES QX 2',1,'ADM PACIENTES QX 2',NULL,2,NOW());
INSERT INTO piezas VALUES('AQX3','ADQX','ADM PACIENTES QX 3',1,'ADM PACIENTES QX 3',NULL,2,NOW());
INSERT INTO piezas VALUES('AQX4','ADQX','ADM PACIENTES QX 4',1,'ADM PACIENTES QX 4',NULL,2,NOW());
INSERT INTO piezas VALUES('AQX5','ADQX','ADM PACIENTES QX 5',1,'ADM PACIENTES QX 5',NULL,2,NOW());
INSERT INTO piezas VALUES('AQX6','ADQX','ADM PACIENTES QX 6',1,'ADM PACIENTES QX 6',NULL,2,NOW());
--cups de la habitacion S20100
--camas para ADMISION PACIENTE CIRUGIA
--pieza	cama	cargo	estado	ubicacion	descripcion	sw_virtual	tipo_cama_id	usuario_id	fecha_registro	virtual_real
INSERT INTO camas VALUES ( 'AQX1', 'CQX1', 'S20100',1,'CM ADM PACIENTES QX1', 'CAMA ADM PACIENTES QX 1', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ( 'AQX2', 'CQX2', 'S20100',1,'CM ADM PACIENTES QX2', 'CAMA ADM PACIENTES QX 2', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ( 'AQX3', 'CQX3', 'S20100',1,'CM ADM PACIENTES QX3', 'CAMA ADM PACIENTES QX 3', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ( 'AQX4', 'CQX4', 'S20100',1,'CM ADM PACIENTES QX4', 'CAMA ADM PACIENTES QX 4', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ( 'AQX5', 'CQX5', 'S20100',1,'CM ADM PACIENTES QX5', 'CAMA ADM PACIENTES QX 5', 1, 68, 2, NOW(), 2);
INSERT INTO camas VALUES ( 'AQX6', 'CQX6', 'S20100',1,'CM ADM PACIENTES QX6', 'CAMA ADM PACIENTES QX 6', 1, 68, 2, NOW(), 2);
--Insertar a los usuarios para ADMISION PACIENTE CIRUGIA
INSERT INTO estaciones_enfermeria_usuarios (estacion_id , usuario_id, estacion_perfil_id) VALUES ('ADQX', '2803','10');

-- Insertar los puntos de atencion de admisiones
INSERT INTO puntos_admisiones_estaciones VALUES (1,'HPGN', 'Hospitalizacion Ginecologia' );
INSERT INTO puntos_admisiones_estaciones VALUES (1,'HPAD', 'Hospitalizacion Adultos' );
INSERT INTO puntos_admisiones_estaciones VALUES (1,'HPPD', 'Hospitalizacion Pediatria' );
INSERT INTO puntos_admisiones_estaciones VALUES (1,'HPHE', 'Hospitalizacion Hemodinamia' );
INSERT INTO puntos_admisiones_estaciones VALUES (1,'SAPR', 'Sala Procedimientos' );
INSERT INTO puntos_admisiones_estaciones VALUES (1,'UCAD', 'Unidad Cuidados Intensivos Adultos' );
INSERT INTO puntos_admisiones_estaciones VALUES (1,'UCNE', 'Unidad Cuidados Intensivos Neonatales' );
INSERT INTO puntos_admisiones_estaciones VALUES (1,'UCPE', 'Unidad Cuidados Intensivos Pediatricos' );
INSERT INTO puntos_admisiones_estaciones VALUES (2,'TRPA', 'Trabajo De Parto' );
INSERT INTO puntos_admisiones_estaciones VALUES (1,'URG', 'Urgencias' );
INSERT INTO puntos_admisiones_estaciones VALUES (1,'URPE', 'Urgencias Pediatria' );
INSERT INTO puntos_admisiones_estaciones VALUES (1,'ERPE', 'Sala ERA Pediatrica' );
INSERT INTO puntos_admisiones_estaciones VALUES (1,'EDPE', 'Sala EDA Pediatrica' );
INSERT INTO puntos_admisiones_estaciones VALUES (2,'QXUR', 'Cirugia Urgencias' );
INSERT INTO puntos_admisiones_estaciones VALUES (2,'REQX', 'Recuperacion Cirugia' );


UPDATE soat_eventos SET evento = 154598 WHERE evento = 999999;
UPDATE soat_eventos SET evento = 134702 WHERE evento = 154598;
UPDATE soat_eventos SET evento = 999999 WHERE evento = 134702;

-- ver el perfil, usuario y nombre de colaborador.
SELECT 
usu.usuario,
usu.nombre,
usu.descripcion,
sp.descripcion
FROM 
system_usuarios usu
JOIN system_usuarios_perfiles sup ON usu.usuario_id = sup.usuario_id
JOIN system_perfiles sp ON sup.perfil_id = sp.perfil_id
WHERE sp.descripcion ILIKE ('%ADMISION%')
AND usu.activo = '1'

--pasar pacientes de urg a urgc
UPDATE
pacientes_urgencias
SET 
estacion_id = 'URGC'
WHERE
estacion_id = 'URG'

--quitar permisos de enfermeria
DELETE FROM estaciones_enfermeria_usuarios WHERE estacion_id='URG'

-- cambiar solicitud cargos
UPDATE
solicitud_autorizacion_cargos
SET
ubicacion = 'URGENC'
FROM
ubicacion = 'URG'

UPDATE
solicitud_autorizacion_cargos
SET
ubicacion = 'UP3'
WHERE
ubicacion = 'UCI005'

-- cambiar depto en solicitudes medicamentos
UPDATE
hc_solicitudes_medicamentos
SET
estacion_id = 'URGC'
WHERE
estacion_id = 'URG'

-- actualizar precio regulado en inventarios_productos
UPDATE 
inventarios_productos
SET
sw_precio_regulado='";;"',
precio_regulado=";;",
resolucion='";;"',
fecha_resolucion='";;"'
WHERE
codigo_producto='";;"'

-- refrescar tabla
UPDATE
soat_eventos
SET
evento = evento

UPDATE
cuentas_detalle
SET
numerodecuenta = numerodecuenta

-- insertar cp a todas las 
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'VUCN', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'VUC7', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'VUC6', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'VUC5', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'VUC4', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'URPE', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'URGC', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'URG8', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'UP3', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'UCPE', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'UCP4', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'UCNE', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'UCAD', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'QXOB', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'OBSE', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'OBS1', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'HPV8', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'HPPD', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'HPHE', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'HPAD', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'HP7', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'HP6', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'HP5', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'HP4', '0');
INSERT INTO bodegas_estaciones VALUES ('02', '01', 'CP', 'CX01', '0');



--permisos en pefil estacion enfermeria
UPDATE 
estaciones_enfermeria_usuarios
SET 
estacion_perfil_id = '10'
WHERE
usuario_id = 1239

--permisos en pefil estacion enfermeria
UPDATE 
estaciones_enfermeria_usuarios
SET 
estacion_perfil_id = '10'
WHERE
usuario_id = 1622

--permisos en pefil estacion enfermeria
UPDATE 
estaciones_enfermeria_usuarios
SET 
estacion_perfil_id = '02'
WHERE
usuario_id = 2803

--camas 

INSERT INTO piezas VALUES('OBU1','OBS1','CAMILLA OBSERVACION',1,'PISO 8',NULL,2,NOW());
INSERT INTO piezas VALUES('OBU2','OBS1','CAMILLA OBSERVACION',1,'PISO 8',NULL,2,NOW());
INSERT INTO piezas VALUES('OBU3','OBS1','CAMILLA OBSERVACION',1,'PISO 8',NULL,2,NOW());
INSERT INTO piezas VALUES('OBU4','OBS1','CAMILLA OBSERVACION',1,'PISO 8',NULL,2,NOW());
INSERT INTO piezas VALUES('OBU5','OBS1','CAMILLA OBSERVACION',1,'PISO 8',NULL,2,NOW());
INSERT INTO piezas VALUES('OBU6','OBS1','CAMILLA OBSERVACION',1,'PISO 8',NULL,2,NOW());
INSERT INTO piezas VALUES('OBU7','OBS1','CAMILLA OBSERVACION',1,'PISO 8',NULL,2,NOW());
INSERT INTO piezas VALUES('OBU8','OBS1','CAMILLA OBSERVACION',1,'PISO 8',NULL,2,NOW());
INSERT INTO piezas VALUES('OBU9','OBS1','CAMILLA OBSERVACION',1,'PISO 8',NULL,2,NOW());
INSERT INTO piezas VALUES('OBU10','OBS1','CAMILLA OBSERVACION',1,'PISO 8',NULL,2,NOW());

INSERT INTO camas VALUES ( 'OBU1', 'OBU1', '5DSA01',1,'OBS URG PISO 1', 'SALA OBSERVACION URGENCIAS P 1', 1, 128, 2, NOW(), 2);
INSERT INTO camas VALUES ( 'OBU2', 'OBU2', '5DSA01',1,'OBS URG PISO 1', 'SALA OBSERVACION URGENCIAS P 1', 1, 128, 2, NOW(), 2);
INSERT INTO camas VALUES ( 'OBU3', 'OBU3', '5DSA01',1,'OBS URG PISO 1', 'SALA OBSERVACION URGENCIAS P 1', 1, 128, 2, NOW(), 2);
INSERT INTO camas VALUES ( 'OBU4', 'OBU4', '5DSA01',1,'OBS URG PISO 1', 'SALA OBSERVACION URGENCIAS P 1', 1, 128, 2, NOW(), 2);
INSERT INTO camas VALUES ( 'OBU5', 'OBU5', '5DSA01',1,'OBS URG PISO 1', 'SALA OBSERVACION URGENCIAS P 1', 1, 128, 2, NOW(), 2);
INSERT INTO camas VALUES ( 'OBU6', 'OBU6', '5DSA01',1,'OBS URG PISO 1', 'SALA OBSERVACION URGENCIAS P 1', 1, 128, 2, NOW(), 2);
INSERT INTO camas VALUES ( 'OBU7', 'OBU7', '5DSA01',1,'OBS URG PISO 1', 'SALA OBSERVACION URGENCIAS P 1', 1, 128, 2, NOW(), 2);
INSERT INTO camas VALUES ( 'OBU8', 'OBU8', '5DSA01',1,'OBS URG PISO 1', 'SALA OBSERVACION URGENCIAS P 1', 1, 128, 2, NOW(), 2);
INSERT INTO camas VALUES ( 'OBU9', 'OBU9', '5DSA01',1,'OBS URG PISO 1', 'SALA OBSERVACION URGENCIAS P 1', 1, 128, 2, NOW(), 2);
INSERT INTO camas VALUES ( 'OBU10', 'OBU10', '5DSA01',1,'OBS URG PISO 1', 'SALA OBSERVACION URGENCIAS P 1', 1, 128, 2, NOW(), 2);


-- medicamentos de uso controlado
UPDATE
medicamentos
SET
sw_uso_controlado = '1'
WHERE
codigo_medicamento IN(
'0101020168',
'0101020234',
'0101020233',
'0101020137',
'0101020216',
'0101020210',
'0101020180',
'0101010020',
'0101010024',
'0101010025',
'0101020013',
'0101020014',
'0101020037',
'0101020136',
'0101020171',
'0101020209',
'0102010050',
'0102010114',
'0102010077',
'0102010113',
'0102010115',
'0102010116',
'0102010123',
'0102010126',
'0102010136',
'0102010186',
'0102010188',
'0102010229',
'0102010260',
'0102010261',
'0102070004',
'0102010254',
'0102010247',
'0102100001'
)


SELECT  i.ingreso,
  c.numerodecuenta,
  b.tipo_id_paciente,
  b.paciente_id,
  TRIM(BOTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(b.primer_nombre, '"', ' '), ',', ' '), CHR(13), ' '), CHR(10), ' '),' ', ' '),'  ', ' '))) AS primer_nombre,
  TRIM(BOTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(b.segundo_nombre, '"', ' '), ',', ' '), CHR(13), ' '), CHR(10), ' '),' ', ' '),'  ', ' '))) AS segundo_nombre,
  TRIM(BOTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(b.primer_apellido, '"', ' '), ',', ' '), CHR(13), ' '), CHR(10), ' '),' ', ' '),'  ', ' '))) AS primer_apellido,
  TRIM(BOTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(b.segundo_apellido, '"', ' '), ',', ' '), CHR(13), ' '), CHR(10), ' '),' ', ' '),'  ', ' '))) AS segundo_apellido,
  b.residencia_telefono AS telefono,
  b.residencia_direccion,
  i.fecha_ingreso,
  i.fecha_cierre,
  TRIM(BOTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(p.plan_descripcion, '"', ' '), ',', ' '), CHR(13), ' '), CHR(10), ' '),' ', ' '),'  ', ' '))) AS plan_descripcion,
  u.nombre as usuario_registro_ingreso,
  ab.tipo_diagnostico_id as dx_ingreso,
  ab.diagnostico_nombre as dx_ingreso_nombre,
  eb.tipo_diagnostico_id as dx_egreso,
  eb.diagnostico_nombre as dx_egreso_nombre,
  d.descripcion as departamento_ingreso,
  e.descripcion as departamento_actual,
  EXTRACT(YEAR FROM age(b.fecha_nacimiento)) AS edad,
  t.nivel_triage_id,
  pr.centro_remision,
  TRIM(BOTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(cr.descripcion, '"', ' '), ',', ' '), CHR(13), ' '), CHR(10), ' '),' ', ' '),'  ', ' '))) AS descripcion,
  pr.fecha_remision,
  se.evento,
  sp.poliza,
  ter.nombre_tercero,
  sp.placa_vehiculo,
  sp.marca_vehiculo,
  sp.tipo_vehiculo,
  sa.fecha_accidente,
  sa.sitio_accidente,
  TRIM(BOTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(sa.informe_accidente, '"', ' '), ',', ' '), CHR(13), ' '), CHR(10), ' '),' ', ' '),'  ', ' '))) AS informe_accidente,
  sp.vigencia_desde,
  sp.vigencia_hasta

           
FROM   ingresos i
INNER JOIN pacientes b ON (i.tipo_id_paciente = b.tipo_id_paciente AND i.paciente_id = b.paciente_id)
INNER JOIN (select	min(numerodecuenta) as cuenta,ingreso from cuentas where estado!='5' group by 2) ct ON (ct.ingreso=i.ingreso)
INNER JOIN cuentas c ON (ct.cuenta=c.numerodecuenta AND i.ingreso = c.ingreso)
INNER JOIN departamentos d ON (i.departamento = d.departamento)
INNER JOIN departamentos e ON (i.departamento_actual = e.departamento)
INNER JOIN planes p ON (c.plan_id = p.plan_id)
INNER JOIN system_usuarios u ON (i.usuario_id = u.usuario_id)
LEFT JOIN (select dx.tipo_diagnostico_id, d.diagnostico_nombre, he.ingreso, dx.evolucion_id 
  from hc_diagnosticos_ingreso dx, hc_evoluciones he, diagnosticos d
  where he.evolucion_id=dx.evolucion_id and dx.tipo_diagnostico_id=d.diagnostico_id 
  and dx.sw_principal='1') as ab ON (ab.ingreso=i.ingreso)
LEFT JOIN (select dx.tipo_diagnostico_id, d.diagnostico_nombre, he.ingreso, dx.evolucion_id 
  from hc_diagnosticos_egreso dx, hc_evoluciones he, diagnosticos d
  where he.evolucion_id=dx.evolucion_id and dx.tipo_diagnostico_id=d.diagnostico_id 
  and dx.sw_principal='1') as eb ON (eb.ingreso=i.ingreso)
LEFT JOIN ingresos_soat io ON (i.ingreso=io.ingreso)
LEFT JOIN soat_eventos se ON (io.evento=se.evento)
LEFT JOIN soat_accidente sa ON (se.accidente_id=sa.accidente_id)
LEFT JOIN triages t ON (i.ingreso=t.ingreso)
LEFT JOIN pacientes_remitidos pr ON (i.ingreso=pr.ingreso)
LEFT JOIN centros_remision cr ON (pr.centro_remision=cr.centro_remision)
LEFT JOIN soat_polizas sp ON (se.poliza = sp.poliza)
LEFT JOIN terceros ter ON (sp.tercero_id = ter.tercero_id AND sp.tipo_id_tercero = ter.tipo_id_tercero)
WHERE    i.estado<>'5'
  --AND    i.fecha_ingreso::date BETWEEN _1 AND _2
  ORDER BY 1;


-- pos no pos

SELECT
codigo_producto,
grupo_id,
clase_id,
sub_clase_id,
producto_id,
descripcion,
descripcion_abreviada,
codigo_invima,
pos_npos,
sw_pos
inventarios_productos


--- hospi5
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 01' , ubicacion='PISO5 HOSPB 01' WHERE pieza='HP5B01';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 02' , ubicacion='PISO5 HOSPB 02' WHERE pieza='HP5B02';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 03' , ubicacion='PISO5 HOSPB 03' WHERE pieza='HP5B03';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 04' , ubicacion='PISO5 HOSPB 04' WHERE pieza='HP5B04';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 05' , ubicacion='PISO5 HOSPB 05' WHERE pieza='HP5B05';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 06' , ubicacion='PISO5 HOSPB 06' WHERE pieza='HP5B06';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 07' , ubicacion='PISO5 HOSPB 07' WHERE pieza='HP5B07';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 08' , ubicacion='PISO5 HOSPB 08' WHERE pieza='HP5B08';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 09' , ubicacion='PISO5 HOSPB 09' WHERE pieza='HP5B09';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 10' , ubicacion='PISO5 HOSPB 10' WHERE pieza='HP5B10';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 11' , ubicacion='PISO5 HOSPB 11' WHERE pieza='HP5B11';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 12' , ubicacion='PISO5 HOSPB 12' WHERE pieza='HP5B12';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 13' , ubicacion='PISO5 HOSPB 13' WHERE pieza='HP5B13';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 14' , ubicacion='PISO5 HOSPB 14' WHERE pieza='HP5B14';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 15' , ubicacion='PISO5 HOSPB 15' WHERE pieza='HP5B15';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 16' , ubicacion='PISO5 HOSPB 16' WHERE pieza='HP5B16';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 17' , ubicacion='PISO5 HOSPB 17' WHERE pieza='HP5B17';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 18' , ubicacion='PISO5 HOSPB 18' WHERE pieza='HP5B18';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 19' , ubicacion='PISO5 HOSPB 19' WHERE pieza='HP5B19';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 20' , ubicacion='PISO5 HOSPB 20' WHERE pieza='HP5B20';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 21' , ubicacion='PISO5 HOSPB 21' WHERE pieza='HP5B21';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 22' , ubicacion='PISO5 HOSPB 22' WHERE pieza='HP5B22';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 23' , ubicacion='PISO5 HOSPB 23' WHERE pieza='HP5B23';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 24' , ubicacion='PISO5 HOSPB 24' WHERE pieza='HP5B24';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 25' , ubicacion='PISO5 HOSPB 25' WHERE pieza='HP5B25';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 26' , ubicacion='PISO5 HOSPB 26' WHERE pieza='HP5B26';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 27' , ubicacion='PISO5 HOSPB 27' WHERE pieza='HP5B27';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 28' , ubicacion='PISO5 HOSPB 28' WHERE pieza='HP5B28';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 29' , ubicacion='PISO5 HOSPB 29' WHERE pieza='HP5B29';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 30' , ubicacion='PISO5 HOSPB 30' WHERE pieza='HP5B30';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 31' , ubicacion='PISO5 HOSPB 31' WHERE pieza='HP5B31';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 32' , ubicacion='PISO5 HOSPB 32' WHERE pieza='HP5B32';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 33' , ubicacion='PISO5 HOSPB 33' WHERE pieza='HP5B33';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 34' , ubicacion='PISO5 HOSPB 34' WHERE pieza='HP5B34';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 35' , ubicacion='PISO5 HOSPB 35' WHERE pieza='HP5B35';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 36' , ubicacion='PISO5 HOSPB 36' WHERE pieza='HP5B36';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 37' , ubicacion='PISO5 HOSPB 37' WHERE pieza='HP5B37';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 38' , ubicacion='PISO5 HOSPB 38' WHERE pieza='HP5B38';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 39' , ubicacion='PISO5 HOSPB 39' WHERE pieza='HP5B39';
UPDATE piezas SET descripcion='HABITACION UNIPERSONAL PISO 5 HOSPITALIZACION ADULTOS 40' , ubicacion='PISO5 HOSPB 40' WHERE pieza='HP5B40';

INSERT INTO piezas VALUES('HP5B01','HP5B','HAB 01 HOSPI 5 B',1,'HAB 01 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B02','HP5B','HAB 02 HOSPI 5 B',1,'HAB 02 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B03','HP5B','HAB 03 HOSPI 5 B',1,'HAB 03 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B04','HP5B','HAB 04 HOSPI 5 B',1,'HAB 04 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B05','HP5B','HAB 05 HOSPI 5 B',1,'HAB 05 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B06','HP5B','HAB 06 HOSPI 5 B',1,'HAB 06 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B07','HP5B','HAB 07 HOSPI 5 B',1,'HAB 07 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B08','HP5B','HAB 08 HOSPI 5 B',1,'HAB 08 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B09','HP5B','HAB 09 HOSPI 5 B',1,'HAB 09 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B10','HP5B','HAB 10 HOSPI 5 B',1,'HAB 10 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B11','HP5B','HAB 11 HOSPI 5 B',1,'HAB 11 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B12','HP5B','HAB 12 HOSPI 5 B',1,'HAB 12 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B13','HP5B','HAB 13 HOSPI 5 B',1,'HAB 13 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B14','HP5B','HAB 14 HOSPI 5 B',1,'HAB 14 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B15','HP5B','HAB 15 HOSPI 5 B',1,'HAB 15 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B16','HP5B','HAB 16 HOSPI 5 B',1,'HAB 16 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B17','HP5B','HAB 17 HOSPI 5 B',1,'HAB 17 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B18','HP5B','HAB 18 HOSPI 5 B',1,'HAB 18 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B19','HP5B','HAB 19 HOSPI 5 B',1,'HAB 19 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B20','HP5B','HAB 20 HOSPI 5 B',1,'HAB 20 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B21','HP5B','HAB 21 HOSPI 5 B',1,'HAB 21 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B22','HP5B','HAB 22 HOSPI 5 B',1,'HAB 22 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B23','HP5B','HAB 23 HOSPI 5 B',1,'HAB 23 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B24','HP5B','HAB 24 HOSPI 5 B',1,'HAB 24 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B25','HP5B','HAB 25 HOSPI 5 B',1,'HAB 25 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B26','HP5B','HAB 26 HOSPI 5 B',1,'HAB 26 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B27','HP5B','HAB 27 HOSPI 5 B',1,'HAB 27 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B28','HP5B','HAB 28 HOSPI 5 B',1,'HAB 28 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B29','HP5B','HAB 29 HOSPI 5 B',1,'HAB 29 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B30','HP5B','HAB 30 HOSPI 5 B',1,'HAB 30 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B31','HP5B','HAB 31 HOSPI 5 B',1,'HAB 31 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B32','HP5B','HAB 32 HOSPI 5 B',1,'HAB 32 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B33','HP5B','HAB 33 HOSPI 5 B',1,'HAB 33 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B34','HP5B','HAB 34 HOSPI 5 B',1,'HAB 34 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B35','HP5B','HAB 35 HOSPI 5 B',1,'HAB 35 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B36','HP5B','HAB 36 HOSPI 5 B',1,'HAB 36 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B37','HP5B','HAB 37 HOSPI 5 B',1,'HAB 37 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B38','HP5B','HAB 38 HOSPI 5 B',1,'HAB 38 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B39','HP5B','HAB 39 HOSPI 5 B',1,'HAB 39 HP 5B',NULL,2,NOW());
INSERT INTO piezas VALUES('HP5B40','HP5B','HAB 40 HOSPI 5 B',1,'HAB 40 HP 5B',NULL,2,NOW());
--cups de la habitacion S11201
--camas para adultos
INSERT INTO camas VALUES ('HP5B01', 'HP5B01', '10A001',1,'CAMA 01 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B02', 'HP5B02', '10A001',1,'CAMA 02 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B03', 'HP5B03', '10A001',1,'CAMA 03 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B04', 'HP5B04', '10A001',1,'CAMA 04 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B05', 'HP5B05', '10A001',1,'CAMA 05 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B06', 'HP5B06', '10A001',1,'CAMA 06 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B07', 'HP5B07', '10A001',1,'CAMA 07 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B08', 'HP5B08', '10A001',1,'CAMA 08 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B09', 'HP5B09', '10A001',1,'CAMA 09 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B10', 'HP5B10', '10A001',1,'CAMA 10 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B11', 'HP5B11', '10A001',1,'CAMA 11 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B12', 'HP5B12', '10A001',1,'CAMA 12 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B13', 'HP5B13', '10A001',1,'CAMA 13 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B14', 'HP5B14', '10A001',1,'CAMA 14 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B15', 'HP5B15', '10A001',1,'CAMA 15 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B16', 'HP5B16', '10A001',1,'CAMA 16 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B17', 'HP5B17', '10A001',1,'CAMA 17 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B18', 'HP5B18', '10A001',1,'CAMA 18 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B19', 'HP5B19', '10A001',1,'CAMA 19 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B20', 'HP5B20', '10A001',1,'CAMA 20 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B21', 'HP5B21', '10A001',1,'CAMA 21 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B22', 'HP5B22', '10A001',1,'CAMA 22 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B23', 'HP5B23', '10A001',1,'CAMA 23 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B24', 'HP5B24', '10A001',1,'CAMA 24 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B25', 'HP5B25', '10A001',1,'CAMA 25 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B26', 'HP5B26', '10A001',1,'CAMA 26 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B27', 'HP5B27', '10A001',1,'CAMA 27 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B28', 'HP5B28', '10A001',1,'CAMA 28 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B29', 'HP5B29', '10A001',1,'CAMA 29 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B30', 'HP5B30', '10A001',1,'CAMA 30 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B31', 'HP5B31', '10A001',1,'CAMA 31 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B32', 'HP5B32', '10A001',1,'CAMA 32 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B33', 'HP5B33', '10A001',1,'CAMA 33 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B34', 'HP5B34', '10A001',1,'CAMA 34 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B35', 'HP5B35', '10A001',1,'CAMA 35 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B36', 'HP5B36', '10A001',1,'CAMA 36 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B37', 'HP5B37', '10A001',1,'CAMA 37 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B38', 'HP5B38', '10A001',1,'CAMA 38 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B39', 'HP5B39', '10A001',1,'CAMA 39 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);
INSERT INTO camas VALUES ('HP5B40', 'HP5B40', '10A001',1,'CAMA 40 HOSP 5 B', 'CAMA PERSONAL HOSPITALIZACION', 1, 109, 2, NOW(), 2);


UPDATE departamentos_cargos SET interface_externo='1' WHERE departamento='RAYOSX'

	''RAYOSX',	RAYOS X
  ''RESONA',	RESONANCIA MAGNETICA / ESCANOGRAFIA
	''IMAGEN',	IMAGENOLOGIA
	''ECOGRA',	ECOGRAFIA / ULTRASONIDO


UPDATE departamentos_cargos SET departamento='IMAGEN' WHERE cargo IN (
'883101',
'883102',
)

INSERT INTO hc_sub_procedimientos_realizados_cups_dpto VALUES cargo_cups departamento tipo_profesional




-- codigo de contratacion
SELECT
inv.codigo_producto,
invp.descripcion,
inv.grupo_contratacion_id,
invg.descripcion
FROM
inventarios inv
JOIN inventarios_productos invp ON inv.codigo_producto = invp.codigo_producto
JOIN inv_grupos_contrataciones invg ON inv.grupo_contratacion_id = invg.grupo_contratacion_id
WHERE
inv.grupo_contratacion_id = '0'
ORDER BY inv.codigo_producto


-- cambiar grupo de contratacion
CONCATENAR("UPDATE
inventarios
SET
grupo_contratacion_id = ";'C2';"
WHERE
codigo_producto = ";'A2';";")


-- 
SELECT a.empresa_id,
    a.bodega,
    a.centro_utilidad,
    a.codigo_producto,
    sum(a.cantidad) AS cantidad,
    a.fecha_vencimiento,
    a.lote,
    qr
   FROM ( SELECT hm.empresa_id,
            hm.bodega,
            hm.centro_utilidad,
            dd.codigo_producto,
            sum(dd.cantidad) AS cantidad,
            dd.fecha_vencimiento,
            dd.lote,
            'QUERY 1' AS qr
           FROM hc_solicitudes_medicamentos hm,
            bodegas_documento_despacho_med bd,
            bodegas_documento_despacho_med_d dd,
            hc_solicitudes_medicamentos_d hi
          WHERE hm.sw_estado = '1'::bpchar AND hm.solicitud_id = hi.solicitud_id AND hm.documento_despacho = bd.documento_despacho_id AND bd.documento_despacho_id = dd.documento_despacho_id AND dd.consecutivo_solicitud = hi.consecutivo_d
          GROUP BY hm.empresa_id, hm.bodega, hm.centro_utilidad, dd.codigo_producto, dd.fecha_vencimiento, dd.lote, qr
        UNION ALL
         SELECT hm.empresa_id,
            hm.bodega,
            hm.centro_utilidad,
            dd.codigo_producto,
            sum(dd.cantidad) AS cantidad,
            dd.fecha_vencimiento,
            dd.lote,
            'QUERY 2' AS qr
           FROM hc_solicitudes_medicamentos hm,
            bodegas_documento_despacho_med bd,
            bodegas_documento_despacho_ins_d dd,
            hc_solicitudes_insumos_d hi
          WHERE hm.sw_estado = '1'::bpchar AND hm.solicitud_id = hi.solicitud_id AND hm.documento_despacho = bd.documento_despacho_id AND bd.documento_despacho_id = dd.documento_despacho_id AND dd.consecutivo_solicitud = hi.consecutivo_d
          GROUP BY hm.empresa_id, hm.bodega, hm.centro_utilidad, dd.codigo_producto, dd.fecha_vencimiento, dd.lote, qr
        UNION ALL
         SELECT hs.empresa_id,
            hs.bodega,
            hs.centro_utilidad,
            sc.codigo_producto_d AS codigo_producto,
            sum(sc.cantidad) AS cantidad,
            sc.fecha_vencimiento,
            sc.lote,
            'QUERY 3' AS qr
           FROM hc_solicitudes_suministros_estacion hs,
            hc_solicitudes_suministros_estacion_detalle hd,
            hc_solicitudes_suministros_est_x_confirmar sc
          WHERE hs.solicitud_id = hd.solicitud_id AND (hd.sw_estado = ANY (ARRAY['1'::bpchar, '2'::bpchar])) AND hd.consecutivo = sc.consecutivo AND sc.estado = '1'::bpchar AND sc.bodegas_doc_id IS NULL AND sc.numeracion IS NULL
          GROUP BY hs.empresa_id, hs.bodega, hs.centro_utilidad, sc.codigo_producto_d, sc.fecha_vencimiento, sc.lote, qr
        UNION ALL
         SELECT bn.empresa_id,
            bn.bodega,
            bn.centro_utilidad,
            dd.codigo_producto,
            sum(dd.cantidad) AS cantidad,
            dd.fecha_vencimiento,
            dd.lote,
            'QUERY 4' AS qr
           FROM tmp_bodegas_documentos_d dd,
            bodegas_doc_numeraciones bn
          WHERE dd.bodegas_doc_id = bn.bodegas_doc_id
          GROUP BY bn.empresa_id, bn.bodega, bn.centro_utilidad, dd.codigo_producto, dd.fecha_vencimiento, dd.lote, qr
        UNION ALL
         SELECT hc_dispensacion_medicamentos_tmp.empresa_id,
            hc_dispensacion_medicamentos_tmp.bodega,
            hc_dispensacion_medicamentos_tmp.centro_utilidad,
            hc_dispensacion_medicamentos_tmp.codigo_producto,
            sum(hc_dispensacion_medicamentos_tmp.cantidad_despachada) AS cantidad,
            hc_dispensacion_medicamentos_tmp.fecha_vencimiento,
            hc_dispensacion_medicamentos_tmp.lote,
            'QUERY 5' AS qr
           FROM hc_dispensacion_medicamentos_tmp
          GROUP BY hc_dispensacion_medicamentos_tmp.empresa_id, hc_dispensacion_medicamentos_tmp.bodega, hc_dispensacion_medicamentos_tmp.centro_utilidad, hc_dispensacion_medicamentos_tmp.codigo_producto, hc_dispensacion_medicamentos_tmp.fecha_vencimiento, hc_dispensacion_medicamentos_tmp.lote, qr
        UNION ALL
         SELECT ds_dispensacion_medicamentos_tmp.empresa_id,
            ds_dispensacion_medicamentos_tmp.bodega,
            ds_dispensacion_medicamentos_tmp.centro_utilidad,
            ds_dispensacion_medicamentos_tmp.codigo_producto,
            sum(ds_dispensacion_medicamentos_tmp.cantidad_despachada) AS cantidad,
            ds_dispensacion_medicamentos_tmp.fecha_vencimiento,
            ds_dispensacion_medicamentos_tmp.lote,
            'QUERY 6' AS qr
           FROM ds_dispensacion_medicamentos_tmp
          GROUP BY ds_dispensacion_medicamentos_tmp.empresa_id, ds_dispensacion_medicamentos_tmp.bodega, ds_dispensacion_medicamentos_tmp.centro_utilidad, ds_dispensacion_medicamentos_tmp.codigo_producto, ds_dispensacion_medicamentos_tmp.fecha_vencimiento, ds_dispensacion_medicamentos_tmp.lote, qr
        UNION ALL
         SELECT tm_despachos_productos.empresa_id,
            tm_despachos_productos.bodega,
            tm_despachos_productos.centro_utilidad,
            tm_despachos_productos.codigo_producto,
            sum(tm_despachos_productos.cantidad_despachada) AS cantidad,
            tm_despachos_productos.fecha_vencimiento,
            tm_despachos_productos.lote,
            'QUERY 7' AS qr
           FROM tm_despachos_productos
          GROUP BY tm_despachos_productos.empresa_id, tm_despachos_productos.bodega, tm_despachos_productos.centro_utilidad, tm_despachos_productos.codigo_producto, tm_despachos_productos.fecha_vencimiento, tm_despachos_productos.lote, qr
        UNION ALL
         SELECT tm.empresa_id,
            tm.bodega,
            tm.centro_utilidad,
            tm.codigo_producto,
            sum(tm.cantidad) AS cantidad,
            tm.fecha_vencimiento,
            tm.lote,
            'QUERY 8' AS qr
           FROM inv_bodegas_movimiento_tmp_d tm
          GROUP BY tm.empresa_id, tm.bodega, tm.centro_utilidad, tm.codigo_producto, tm.fecha_vencimiento, tm.lote, qr
        UNION ALL
         SELECT tm.empresa_id,
            tm.bodega,
            tm.centro_utilidad,
            tm.codigo_producto,
            sum(tm.cantidad) AS cantidad,
            tm.fecha_vencimiento,
            tm.lote,
            'QUERY 9' AS qr
           FROM ( SELECT tm_1.empresa_id,
                    tm_1.bodega,
                    tm_1.centro_utilidad,
                    tm_1.codigo_producto,
                    sum(tm_1.cantidad - COALESCE(td.cantidad, 0::numeric)) AS cantidad,
                    tm_1.fecha_vencimiento,
                    tm_1.lote,
                    'QUERY 9' AS qr
                   FROM estacion_enfermeria_qx_iym tm_1
                     LEFT JOIN ( SELECT sum(estacion_enfermeria_qx_iym_devoluciones.cantidad) AS cantidad,
                            estacion_enfermeria_qx_iym_devoluciones.codigo_producto,
                            estacion_enfermeria_qx_iym_devoluciones.programacion_id,
                            estacion_enfermeria_qx_iym_devoluciones.fecha_vencimiento,
                            estacion_enfermeria_qx_iym_devoluciones.lote
                           FROM estacion_enfermeria_qx_iym_devoluciones
                          WHERE estacion_enfermeria_qx_iym_devoluciones.estado = '0'::bpchar
                          GROUP BY estacion_enfermeria_qx_iym_devoluciones.codigo_producto, 
                          estacion_enfermeria_qx_iym_devoluciones.programacion_id, 
                          estacion_enfermeria_qx_iym_devoluciones.fecha_vencimiento, 
                          estacion_enfermeria_qx_iym_devoluciones.lote) td 
                          ON tm_1.programacion_id = td.programacion_id 
                          AND tm_1.codigo_producto::text = td.codigo_producto::text 
                          AND tm_1.fecha_vencimiento = td.fecha_vencimiento 
                          AND tm_1.lote::text = td.lote::text
                  WHERE tm_1.estado = '0'::bpchar
                  GROUP BY tm_1.empresa_id, tm_1.bodega, tm_1.centro_utilidad, tm_1.codigo_producto, tm_1.fecha_vencimiento, tm_1.lote, qr) tm
          WHERE tm.cantidad > 0::numeric
          GROUP BY tm.empresa_id, tm.bodega, tm.centro_utilidad, tm.codigo_producto, tm.fecha_vencimiento, tm.lote, qr
        UNION ALL
         SELECT tm.empresa_id,
            tm.bodega,
            tm.centro_utilidad,
            tm.codigo_producto,
            sum(tm.cantidad) AS cantidad,
            tm.fecha_vencimiento,
            tm.lote,
            'QUERY 10' AS qr
           FROM tmp_cuenta_insumos tm
          GROUP BY tm.empresa_id, tm.bodega, tm.centro_utilidad, tm.codigo_producto, tm.fecha_vencimiento, tm.lote, qr
        UNION ALL
         SELECT dd.empresa_id,
            dd.bodega,
            dd.centro_utilidad,
            dd.codigo_producto,
            sum(dd.cantidad_despachada) AS cantidad,
            dd.fecha_vencimiento,
            dd.lote,
            'QUERY 11' AS qr
           FROM tm_despachos_medicamentos_cm dd
          GROUP BY dd.empresa_id, dd.bodega, dd.centro_utilidad, dd.codigo_producto, dd.fecha_vencimiento, dd.lote, qr
        UNION ALL
         SELECT dd.empresa_id,
            dd.bodega,
            dd.centro_utilidad,
            dd.codigo_producto,
            sum(dd.cantidad_despachada) AS cantidad,
            dd.fecha_vencimiento,
            dd.lote,
            'QUERY 12' AS qr
           FROM tm_despachos_insumos_cm dd
          GROUP BY dd.empresa_id, dd.bodega, dd.centro_utilidad, dd.codigo_producto, dd.fecha_vencimiento, dd.lote, qr
        UNION ALL
         SELECT cs.empresa_id,
            cs.bodega,
            cs.centro_utilidad,
            dd.codigo_producto,
            sum(dd.cantidad) - sum(dd.cantidad_dev) AS cantidad,
            dd.fecha_vencimiento,
            dd.lote,
            'QUERY 13' AS qr
           FROM bodegas_doc_despacho_medicamentos_cm dd,
            bodegas_documento_despacho_cm cm,
            central_mezclas_solicitudes cs
          WHERE dd.documento_desp_cm_id = cm.documento_desp_cm_id AND cm.cm_solicitud_id = cs.cm_solicitud_id AND (cm.sw_estado = ANY (ARRAY['1'::bpchar, '3'::bpchar]))
          GROUP BY cs.empresa_id, cs.bodega, cs.centro_utilidad, dd.codigo_producto, dd.fecha_vencimiento, dd.lote, qr
        UNION ALL
         SELECT cs.empresa_id,
            cs.bodega,
            cs.centro_utilidad,
            dd.codigo_producto,
            sum(dd.cantidad) - sum(dd.cantidad_dev) AS cantidad,
            dd.fecha_vencimiento,
            dd.lote,
            'QUERY 14' AS qr
           FROM bodegas_doc_despacho_insumos_cm dd,
            bodegas_documento_despacho_cm cm,
            central_mezclas_solicitudes cs
          WHERE dd.documento_desp_cm_id = cm.documento_desp_cm_id AND cm.cm_solicitud_id = cs.cm_solicitud_id AND (cm.sw_estado = ANY (ARRAY['1'::bpchar, '3'::bpchar]))
          GROUP BY cs.empresa_id, cs.bodega, cs.centro_utilidad, dd.codigo_producto, dd.fecha_vencimiento, dd.lote, qr
        UNION ALL
         SELECT dd.empresa_id,
            dd.bodega,
            dd.centro_utilidad,
            dd.codigo_producto,
            sum(dd.cantidad_despachada) AS cantidad,
            dd.fecha_vencimiento,
            dd.lote,
            'QUERY 15' AS qr
           FROM tmp_despachos_pre_medicamentos dd
          GROUP BY dd.empresa_id, dd.bodega, dd.centro_utilidad, dd.codigo_producto, dd.fecha_vencimiento, dd.lote, qr
        UNION ALL
         SELECT dd.empresa_id,
            dd.bodega,
            dd.centro_utilidad,
            dd.codigo_producto,
            sum(dd.cantidad_despachada) AS cantidad,
            dd.fecha_vencimiento,
            dd.lote,
            'QUERY 16' AS qr
           FROM tmp_despachos_pre_insumos dd
          GROUP BY dd.empresa_id, dd.bodega, dd.centro_utilidad, dd.codigo_producto, dd.fecha_vencimiento, dd.lote, qr
        UNION ALL
         SELECT q.empresa_id,
            q.bodega,
            q.centro_utilidad,
            dd.codigo_producto,
            sum(dd.cantidad) AS cantidad,
            dd.fecha_vencimiento,
            dd.lote,
            'QUERY 17' AS qr
           FROM despacho_premedicados_medicamentos dd,
            despacho_premedicados d,
            qx_medicamentos q
          WHERE d.dep_premedicados_id = dd.dep_premedicados_id AND dd.qx_medicamento_id = q.qx_medicamento_id AND d.sw_estado = '1'::bpchar
          GROUP BY q.empresa_id, q.bodega, q.centro_utilidad, dd.codigo_producto, dd.fecha_vencimiento, dd.lote, qr
        UNION ALL
         SELECT q.empresa_id,
            q.bodega,
            q.centro_utilidad,
            dd.codigo_producto,
            sum(dd.cantidad) AS cantidad,
            dd.fecha_vencimiento,
            dd.lote,
            'QUERY 18' AS qr
           FROM despacho_premedicados_insumos dd,
            despacho_premedicados d,
            qx_insumos_programacion q
          WHERE d.dep_premedicados_id = dd.dep_premedicados_id AND dd.qx_insumos_id = q.qx_insumos_id AND d.sw_estado = '1'::bpchar
          GROUP BY q.empresa_id, q.bodega, q.centro_utilidad, dd.codigo_producto, dd.fecha_vencimiento, dd.lote, qr) a
  GROUP BY a.empresa_id, a.bodega, a.centro_utilidad, a.codigo_producto, a.fecha_vencimiento, a.lote, a.qr;

  -- estaciones para ginecologia