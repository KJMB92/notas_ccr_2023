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
cd.numerodecuenta = 2060979


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
e.descripcion,
f.cuenta_liquidacion_qx_id AS acto_qx
FROM 
cuentas_detalle a, 
bodegas_documentos_d b,
bodegas_documentos c, 
bodegas_doc_numeraciones d,
system_usuarios e,
cuentas_codigos_agrupamiento f
WHERE a.consecutivo=b.consecutivo 
AND a.numerodecuenta=2071558  
AND b.codigo_producto ='0206082458' 
AND b.numeracion=c.numeracion 
AND b.bodegas_doc_id=c.bodegas_doc_id 
AND c.bodegas_doc_id=d.bodegas_doc_id  
AND c.usuario_id=e.usuario_id 
AND a.codigo_agrupamiento_id=f.codigo_agrupamiento_id
ORDER BY f.cuenta_liquidacion_qx_id, a.cargo DESC

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
AND b.codigo_producto='0101021546' 
AND b.numeracion=c.numeracion 
AND b.bodegas_doc_id=c.bodegas_doc_id 
AND c.bodegas_doc_id=d.bodegas_doc_id  
AND c.usuario_id=e.usuario_id 
ORDER BY a.cargo DESC
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
-- para realizar el cambio del plan en las ordenes de servicio que tengan un mal plan malo
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

5358197
3501327
25067
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
------------------------------------------------------------------------------------------------------------------------------
-- tablas para corregir el plan malo en las citas medicas
------------------------------------------------------------------------------------------------------------------------------
os_ordenes_servicios
cuentas
os_maestro
hc_os_solicitudes

orden 3578993
cuenta 2087221

Error al Guardar en Bases de Datos - inv_solicitudes_devolucion_d SQL estado[1]
Error DB : ERROR: EL REGISTRO DE LA DEVOLUCION QUE ESTA CANCELANDO NO SE ENCUENTRA EN LA TABLA [bodega_paciente] CONTEXT: funciÃ³n PL/pgSQL bodega_paciente_control_bodegas() en la lÃ­nea 699 en RAISE
------------------------------------------------------------------------------------------------------------------------------
-- valores negativos en cuenta, no deja cuadrar, para ver la transaccion de un producto.
------------------------------------------------------------------------------------------------------------------------------
SELECT 
cd.transaccion ,  
bd.codigo_producto , 
cd.numerodecuenta , 
cd.cargo , 
cd.departamento ,  
cd.cantidad ,  
cd.precio , 
Cd.facturado,
cd.paquete_codigo_id,
cd.sw_paquete_facturado
FROM cuentas_detalle cd  
INNER JOIN bodegas_documentos_d bd ON cd.consecutivo=bd.consecutivo  
WHERE cd.numerodecuenta=2026530
AND bd.codigo_producto = '0206082513'
ORDER BY cd.paquete_codigo_id

------------------------------------------------------------------------------------------------------------------------------
-- INSERT SELECT - permisos en interface de siesa
------------------------------------------------------------------------------------------------------------------------------
userpermisos_tipos_doc_generales
INSERT INTO userpermisos_tipos_doc_generales (usuario_id, tipo_doc_general_id)
SELECT 3192, tipo_doc_general_id
FROM userpermisos_tipos_doc_generales
WHERE usuario_id = 2670;

------------------------------------------------------------------------------------------------------------------------------
-- Si el medico no le deja formular, revisar su departametno e insertar
------------------------------------------------------------------------------------------------------------------------------
INSERT INTO profesionales_estado (tipo_id_tercero, tercero_id, departamento, estado, empresa_id)
SELECT 'CC', '1144085748', departamento, '1', '01'
FROM profesionales_departamentos
WHERE tipo_id_tercero= 'CC'
AND tercero_id= '1144085748'


SELECT
    a.tipo_tercero_id,
    a.tercero_id,
    c.departamento,
    d.especialidad,
    d.universidad,
    f.nombre,
    f.primer_nombre,
    f.segundo_nombre,
    f.primer_apellido,
    f.segundo_apellido,
    f.tipo_profesional,
    f.tarjeta_profesional,
    f.sexo_id,
    f.observacion,
    f.registro_salud_departamental,
    f.tipo_equipo_id,
    g.tipo_pais_id,
    g.tipo_dpto_id,
    g.tipo_mpio_id,
    g.direccion,
    g.telefono,
    g.fax,
    g.email,
    g.celular,
    g.nombre_tercero
FROM
    profesionales_usuarios a,
    profesionales_estado b,
    profesionales_departamentos c,
    profesionales_especialidades d,
    profesionales_empresas e,
    profesionales f,
    terceros g
WHERE
    a.usuario_id = '3416'
    AND a.tipo_tercero_id = b.tipo_id_tercero
    AND a.tercero_id = b.tercero_id
    AND b.estado = '1'
    AND b.departamento = c.departamento
    AND b.tipo_id_tercero = c.tipo_id_tercero
    AND b.tercero_id = c.tercero_id
    AND a.tipo_tercero_id = d.tipo_id_tercero
    AND a.tercero_id = d.tercero_id
    AND a.tipo_tercero_id = e.tipo_id_tercero
    AND a.tercero_id = e.tercero_id
    AND b.empresa_id = e.empresa_id
    AND a.tipo_tercero_id = f.tipo_id_tercero
    AND a.tercero_id = f.tercero_id
    AND f.estado = '1'
    AND g.tipo_id_tercero = a.tipo_tercero_id
    AND g.tercero_id = a.tercero_id

------------------------------------------------------------------------------------------------------------------------------
-- Errores de siesa
------------------------------------------------------------------------------------------------------------------------------
Luz helena, jefe de contabilidad, errores de siesa
------------------------------------------------------------------------------------------------------------------------------
-- INSERT SELECT para insertar permisos de aprobacion de permisos para gestion humana
------------------------------------------------------------------------------------------------------------------------------
INSERT INTO nomina.procesos_areas_usuarios (proceso_id, area_id, usuario_id, sw_estado)
SELECT proceso_id, area_id, 93, sw_estado
FROM nomina.procesos_areas_usuarios
WHERE usuario_id = 1973
------------------------------------------------------------------------------------------------------------------------------
-- solicitan cancelar una solicitud de medicamentos
------------------------------------------------------------------------------------------------------------------------------
cancelar solicutdes de medicamentos
hc_solicitudes_medicamentos
------------------------------------------------------------------------------------------------------------------------------
-- cambiar cups en nota operatoria
------------------------------------------------------------------------------------------------------------------------------
hc_notas_operatorias_cirugias
hc_notas_operatorias_procedimientos
------------------------------------------------------------------------------------------------------------------------------
-- cambiar cups en turno quirurgico
------------------------------------------------------------------------------------------------------------------------------
hc_os_solicitudes
hc_os_solicitudes_subprocedimientos
------------------------------------------------------------------------------------------------------------------------------
-- cambiar cups en cirugia
------------------------------------------------------------------------------------------------------------------------------
hc_notas_operatorias_cirugias
hc_notas_operatorias_procedimientos
------------------------------------------------------------------------------------------------------------------------------
-- historia clinica sin fecha de egreso
------------------------------------------------------------------------------------------------------------------------------
validar en cual de estas no tiene registro
ingresos_salidas
hc_vistosok_salida_detalle
hc_ordenes_medicas
si es hospitalaria, va en ingresos_salidas
si es ambulatoria va en hc_ordenes_medicas
si no esta, insertar con la oredn de la tabla hc_ordenes_medicas, tomando la fecha de ahi, pero el departamento de la evolucion.
------------------------------------------------------------------------------------------------------------------------------
-- error en devolucion de medicamentos, que no se va el medicamento o el insumo
------------------------------------------------------------------------------------------------------------------------------
para que se vea el boton para poder entrar a hacer la devolucion, 
tomamos el paquete de vancomicina o el paquete que esta malo
este debe estar con los productos en 0 en la bodega_pacientes 
y en bodega_paciente_preparaciones debe estar con unidades el paquete
enotnces, cuando ingresemos al boton que titila, 
podemos ver dentro, el boton verde de devolucion, si el caso es que se devuelva
todo, se le da click al boton verde, sin mas, 
si el caso es que se devuelva solo el medicamento, poner en 0 las unidades en la tabla bodega_paciente_preparaciones y luego hacer
clik en el boton verde de devolucion
si el caso es que se devuelva solo los insumos, poner en 0 los medicamentos en la tabla bodega_paciente_preparaciones y luego hacer
clik en el boton verde de devolucion
------------------------------------------------------------------------------------------------------------------------------
-- para verificar el instrumentador en las notas operatorias de cirugia
------------------------------------------------------------------------------------------------------------------------------
SELECT  x.tercero_id,
c.nombre_tercero as nombre,
x.tipo_id_tercero
FROM    
profesionales x,
profesionales_departamentos y,
especialidades z,
profesionales_especialidades l,
terceros c,
system_usuarios su
WHERE   x.tipo_id_tercero=y.tipo_id_tercero 
AND     x.tercero_id=y.tercero_id 
AND     y.departamento='010109'
AND     z.especialidad=l.especialidad 
AND     z.sw_instrumentista='1' 
AND     x.tercero_id=l.tercero_id 
AND     x.tipo_id_tercero=l.tipo_id_tercero  
AND     x.tercero_id=c.tercero_id 
AND     x.tipo_id_tercero=c.tipo_id_tercero 
AND     profesional_activo(c.tipo_id_tercero,c.tercero_id,'010109')='1' 
AND	   su.usuario_id = x.usuario_id
AND     su.activo = '1'
ORDER BY c.nombre_tercero
------------------------------------------------------------------------------------------------------------------------------
-- error de las impresiones con el codigo diferente en la impresion de pdf
------------------------------------------------------------------------------------------------------------------------------
hc_os_solicitudes, la orden se valida aca, con el numero de ingreso, evolucion o cuenta
cuando cambie una orden medica 
hay que cambiarla en hc_os_solicitudes_cargos_equivalentes
por que las impresiones deben de cambiar tambien
------------------------------------------------------------------------------------------------------------------------------
-- Duplicacion de recibos
------------------------------------------------------------------------------------------------------------------------------
rc_detalle_hosp, el recibo cuplicado se elimina de esta tabla
recibos_caja, el recibo cuplicado se elimina de esta tabla
otros_tipos_abonos_recibos, si hay algun recibo en esta tabla, relacionado al recibo malo, actualizarlo al recibo correcto. por lo general son 2
------------------------------------------------------------------------------------------------------------------------------
-- Error en cuentas con centro de costos para departamento cirugia 61201001
------------------------------------------------------------------------------------------------------------------------------
DELETE FROM cg_conf.doc_fv01_cargos_por_cc WHERE cargo='586300';



INSERT INTO
cg_conf.doc_fv01_cargos_por_cc
SELECT '01', tarifario_id, '586300', 612001, 412001, 'C', 612001, 417520, 61201001, '001', null, null, null
FROM
tarifarios_detalle
WHERE
cargo='586300'


INSERT INTO
cg_conf.doc_fv01_cargos_por_cc
VALUES (
/*empresa*/                     '01',
/*tarifario_id*/                '0079',
/*cargo*/                       '858701',
/*centro de costo*/             612001,
/*cuenta*/                      412001,
/*cuenta naturaleza*/           'C',
/*centro de costo destino*/     612001,
/*cuenta glosa*/                417520,
/*cuenta honorario*/            61201001,
/*centro de operacion*/         '001',
/*centro de operacion*/         null,
/*id user configura cc*/        null,
/* descripcion configura cc*/   null
)


INSERT INTO
    cg_conf.doc_fv01_cargos_por_cc (
        empresa_id,
        tarifario_id,
        cargo,
        centro_de_costo_id,
        cuenta,
        cuenta_naturaleza,
        centro_costo_destino,
        cuenta_glosa,
        cuenta_honorario,
        centro_de_operacion_id,
        centro_operacion_id,
        id_user_configura_cc,
        descripcion_configura_cc
    )
VALUES
    (
        '01',
        '1003',
        '542102',
        '612001',
        '412001',
        'C',
        '612001',
        '417520',
        '61201001',
        '001',
        NULL,
        NULL,
        NULL
    );

Actualmente no se tiene una parametrizacion de referencia para este cargo.

Se solicita inforamcion a centro de costos, estamos a la espera de su respuesta.


------------------------------------------------------------------------------------------------------------------------------
-- Error en cuentas con centro de costos para cualquier otro departamento que no sea cirugia
------------------------------------------------------------------------------------------------------------------------------
cargo 865201
tarifario 1003 
centro de costo 610504

DELETE FROM cg_conf.doc_fv01_cargos_por_cc WHERE cargo='890502';

INSERT INTO
cg_conf.doc_fv01_cargos_por_cc
SELECT
/*empresa*/                     '01',
/*tarifario_id*/                tarifario_id,
/*cargo*/                       '890502',
/*centro de costo*/             611506,
/*cuenta*/                      410501,
/*cuenta naturaleza*/           'C',
/*centro de costo destino*/     611506,
/*cuenta glosa*/                417520,
/*cuenta honorario*/            61051001,
/*centro de operacion*/         '001',
/*centro de operacion*/         null,
/*id user configura cc*/        null,
/* descripcion configura cc*/   null
FROM
tarifarios_detalle
WHERE
cargo='890502'


INSERT INTO
cg_conf.doc_fv01_cargos_por_cc
VALUES (
/*empresa*/                     '01',
/*tarifario_id*/                '0079',
/*cargo*/                       '790302',
/*centro de costo*/             610504,
/*cuenta*/                      412001,
/*cuenta naturaleza*/           'C',
/*centro de costo destino*/     610504,
/*cuenta glosa*/                417520,
/*cuenta honorario*/            61201001,
/*centro de operacion*/         '001',
/*centro de operacion*/         null,
/*id user configura cc*/        null,
/* descripcion configura cc*/   null
)

=CONCATENATE("INSERT INTO
cg_conf.doc_fv01_cargos_por_cc
VALUES (
/*empresa*/                     '01',
/*tarifario_id*/                '00";A139;"',
/*cargo*/                       '";C139;"',
/*centro de costo*/             ";E139;",
/*cuenta*/                      ";F139;",
/*cuenta naturaleza*/           '";G139;"',
/*centro de costo destino*/     ";H139;",
/*cuenta glosa*/                ";I139;",
/*cuenta honorario*/            null,
/*centro de operacion*/         '001',
/*centro de operacion*/         null,
/*id user configura cc*/        null,
/* descripcion configura cc*/   null
)")
------------------------------------------------------------------------------------------------------------------------------
-- Error en cuentas con centro de costos para productos que no son gases medicinales (solo cambiar producto)
------------------------------------------------------------------------------------------------------------------------------
INSERT INTO
cg_conf.doc_fv01_inv_productos_por_cc
VALUES (
'01',
'613007',
'0102011255',
'413501',
'C',
'613007',
'613007',
'001'
)
------------------------------------------------------------------------------------------------------------------------------
-- paciente no aparece en censo para registrar el acompañante
------------------------------------------------------------------------------------------------------------------------------
ingresos_porteria
se ingresa el paciente en esta tabla y listo, se revisa en ingresos porteria y se debe evidenciar que el paciente este ahi
------------------------------------------------------------------------------------------------------------------------------
-- cambiar la X de procedimiento principal en la nota operatoria
------------------------------------------------------------------------------------------------------------------------------
hc_evoluciones
hc_notas_operatorias_cirugias
hc_notas_operatorias_procedimientos


recibos_caja_auditoria_impresion
rc_detalle_hosp
otros_tipos_abonos_recibos
------------------------------------------------------------------------------------------------------------------------------
-- asignar permisos para aprobar pedidos
------------------------------------------------------------------------------------------------------------------------------
Solo debe de asignarse a una persona por departamento.
lideres_proceso
------------------------------------------------------------------------------------------------------------------------------
-- No aparece medico en la creacion de agenda medica
------------------------------------------------------------------------------------------------------------------------------
se debe validar que tenga la especialidad y los departamentos correspondientes a su especialidad y consultas externas
------------------------------------------------------------------------------------------------------------------------------
-- Error en la ordenes medicas en la interface de imagenes con ajoveco
------------------------------------------------------------------------------------------------------------------------------
error en las ordenes de imagenes, en la interface
revisar con el numero de acceso==numero_orden_id
en la tabla os_maestro_cargos
estudios_integracion
------------------------------------------------------------------------------------------------------------------------------
-- Error al guardar evolucion / nota 
-- Error de sintaxis "cuentas_detalle" al guardar definitivo
------------------------------------------------------------------------------------------------------------------------------


traer el plan del paciente a la tabla plan_tarifario
tomar el tarifario y buscar en tarifario_equivalencia 
ver si existe en ese tarifario algun plan con 2 en la columna sw_tipo_consulta
si no existe buscar el de otro plan, 1003, y parametrizarlo con el 2 en sw

------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM tarifarios_detalle WHERE tarifario_id='0094'

SELECT u.*
FROM tarifarios_detalle u
LEFT JOIN pedidos p ON u.id_usuario = p.id_usuario
WHERE p.id_usuario IS NULL;

SELECT *
FROM datos
ORDER BY id
LIMIT 1;

=CONCATENAR("SELECT * FROM tarifarios_detalle WHERE tarifario_id='0094' AND cargo='";A2;"' UNION ALL")

INSERT INTO tarifarios_detalle VALUES (tarifario_id, grupo_tarifario_id, subgrupo_tarifario_id, cargo, descripcion, precio, tipo_cargo, grupo_tipo_cargo, gravamen, sw_cantidad, nivel, sw_honorarios, concepto_rips, sw_uvrs, grupos_mapipos, tipo_unidad_id, porcentaje_default, sw_paquete) 
SELECT '0094', grupo_tarifario_id, subgrupo_tarifario_id, '";A1;"', descripcion, precio, tipo_cargo, grupo_tipo_cargo, gravamen, sw_cantidad, nivel, sw_honorarios, concepto_rips, sw_uvrs, grupos_mapipos, tipo_unidad_id, porcentaje_default, sw_paquete FROM tarifarios_detalle WHERE tarifario_id = '1004'

analisis

INSERT INTO tarifarios_detalle SELECT '0094',grupo_tarifario_id,subgrupo_tarifario_id,'";A1;"', descripcion,'0',tipo_cargo,grupo_tipo_cargo,'0','0','1','0','04','1','0', '02','0' FROM cups WHERE='"";A1;""';

INSERT INTO tarifarios_detalle SELECT '0094', grupo_tarifario_id, subgrupo_tarifario_id, '";A1;"',  descripcion, '0', tipo_cargo, grupo_tipo_cargo, '0', '0', '1', '0', '04', '1', '0', '02', '0' FROM cups WHERE cargo= '";A1;"';

UPDATE tarifarios_detalle SET tipo_unidad_id= '01', sw_uvrs=0 WHERE tarifario_id='0094'
------------------------------------------------------------------------------------------------------------------------------
-- SACAR paceitne de panel de sala de infusion
------------------------------------------------------------------------------------------------------------------------------
estacion_enfermeria_qx_pacientes_ingresados

------------------------------------------------------------------------------------------------------------------------------
-- cuendo no aparece un paciente para darle salida, para imprimir la boleta de salida
------------------------------------------------------------------------------------------------------------------------------
la tabla historias_clinicas  debe estar el registro de ese paciente. si no esta, insertarlo.
------------------------------------------------------------------------------------------------------------------------------
-- cuando se va a cargar una interconsulta y aparece el mensaje, NO TIENE EQUIVALENCIA, se debe agregar en la tabla 
-- hay que ver el plan_tarifario y comparar cual de estos
------------------------------------------------------------------------------------------------------------------------------
especialidades_cargos_tarifarios
------------------------------------------------------------------------------------------------------------------------------
-- BOTON SOLICITAR EN PLAN TERAPEUTICO
------------------------------------------------------------------------------------------------------------------------------
para que aparesca el boton de SOLICITAR en MP-PLAN TERAPEUTICO se debe de revisar que no tenga registro con ese ingreso  en la tabla hc_vistosok_salida_detalle
------------------------------------------------------------------------------------------------------------------------------
UPDATE 
cuentas_detalle
SET 
tarifario_id='0094'
WHERE
numerodecuenta=2052081 AND
tarifario_id='0078'
------------------------------------------------------------------------------------------------------------------------------
-- TIPO CORTE pos a noppos no-pos0
------------------------------------------------------------------------------------------------------------------------------
Buenos días, por este medio solicito el cambio de tipo de corte de NO pos a POS de la cuenta n°2053773, la cual se encuentra en estado cuadrado.+
en la tabla cuentas, al final en la columna tipo_corte, ahi queda realcionado.
tipo_corte

------------------------------------------------------------------------------------------------------------------------------
-- no deja cumplir una interconsulta de odontologia.
------------------------------------------------------------------------------------------------------------------------------
hc_sub_diagnosticos_odontologicos_diagnosticos
------------------------------------------------------------------------------------------------------------------------------
-- evoluciones
------------------------------------------------------------------------------------------------------------------------------
hc_evolucion_descripcion
hc_evoluciones_submodulos
hc_evoluciones

69500
19906574

1145
marilin

1125


cn 240859

2002467
------------------------------------------------------------------------------------------------------------------------------
-- error en la contabilizacion de documentos contables.
-- permiso para ver documentos en cg_mov para la interface en siesa
------------------------------------------------------------------------------------------------------------------------------
documentos
cg_mov_contable_01
userpermisos_tipos_doc_generales?: 
tipos_doc_generales
cg_mov_contable_01_202404

------------------------------------------------------------------------------------------------------------------------------
-- query para cambiar el tarifario a las cuentas que estan mal en cuestion del tarifario
------------------------------------------------------------------------------------------------------------------------------

UPDATE
cuentas_detalle
SET
tarifario_id='1003'
WHERE
numerodecuenta=2060979
AND tarifario_id='0089'

------------------------------------------------------------------------------------------------------------------------------
-- para cuando soliciten cambiar a cantidad de medicamento por dia, dentro de 1 dia de tratamiento
------------------------------------------------------------------------------------------------------------------------------
hc_formulacion_medicamentos
hc_formulacion_medicamentos_eventos
hc_auditoria_formulacion_medicamentos_eventos_tratamiento
------------------------------------------------------------------------------------------------------------------------------
-- Error de fecha en la interface SIESA facturacion
------------------------------------------------------------------------------------------------------------------------------
Se recuerda que a partir del 1 de Mayo la DIAN exige que la factura sea de la misma fecha del envio.
Para solucionar esto, se creo una solucion que por el momento solo la posee Miller, la jefe Julieth y la jefe Carolina.
Por favor reportarle a ellos esta falla para que la corrijan desde su SIIS.


------------------------------------------------------------------------------------------------------------------------------
-- query para validar si hay facturas con diferencias.
------------------------------------------------------------------------------------------------------------------------------
SELECT
a.prefijo, a.factura_fiscal,a.total_factura,b.total_debitos,b.total_creditos, a.estado,
SUM(b.total_debitos-b.total_creditos)
FROM fac_facturas a
LEFT  JOIN cg_mov_01.cg_mov_contable_01 b ON ( a.empresa_id=b.empresa_id 
AND a.prefijo=b.prefijo AND a.factura_fiscal=b.numero)
WHERE a.fecha_registro BETWEEN '2024-04-30' AND '2024-05-03'
AND a.prefijo='CN'
GROUP BY 1,2,3,4,5,6
ORDER BY  SUM(b.total_debitos-b.total_creditos) ASC

------------------------------------------------------------------------------------------------------------------------------
-- query para validar si hay facturas con diferencias.
------------------------------------------------------------------------------------------------------------------------------
revisar si en fac_facturas_cuentas hay mas de 1 factura relacionada a la cuenta
si es asi, canbiar el estado de las otras facturas en fac_facturas a 3 y re-interfazar.
<<<<<<< HEAD

------------------------------------------------------------------------------------------------------------------------------
-- precios en lista de precios
------------------------------------------------------------------------------------------------------------------------------
listas_precios_detalle
listas_precios
=======

------------------------------------------------------------------------------------------------------------------------------
-- cargos paragrafados
------------------------------------------------------------------------------------------------------------------------------
planes_paragrafados_cargos

--insertar paragrafado a partir de otro plan, insert select
INSERT INTO
planes_paragrafados_cargos
(plan_id, tarifario_id, cargo, servicio)
SELECT
'4441',
tarifario_id,
cargo,
servicio
FROM planes_paragrafados_cargos
WHERE plan_id= '3843'


------------------------------------------------------------------------------------------------------------------------------
-- productos  paragrafados
------------------------------------------------------------------------------------------------------------------------------
paragrafados_qx_listas_detalle
planes_paragrafados_medicamentos
------------------------------------------------------------------------------------------------------------------------------
-- query para revisar el caso recurrente de sayli, para ver las diferencias de la facturacion.
------------------------------------------------------------------------------------------------------------------------------

SELECT
a.prefijo, a.factura_fiscal,a.total_factura,b.total_debitos,b.total_creditos, a.estado,
SUM(b.total_debitos-b.total_creditos)
FROM
fac_facturas a
LEFT  JOIN cg_mov_01.cg_mov_contable_01 b ON ( a.empresa_id=b.empresa_id 
AND a.prefijo=b.prefijo AND a.factura_fiscal=b.numero)

WHERE
a.fecha_registro BETWEEN '2024-05-09' AND NOW()
AND a.prefijo='CN'
GROUP BY 1,2,3,4,5,6
ORDER BY  SUM(b.total_debitos-b.total_creditos) ASC

Se verifica desde la fecha del dia 05/08/2024 hasta el momento NOW() y no se encuentran diferencias.

------------------------------------------------------------------------------------------------------------------------------
-- ingresos porteria.
------------------------------------------------------------------------------------------------------------------------------
ingresos_porteria
cruce_ingresos_porteria
------------------------------------------------------------------------------------------------------------------------------
-- agregar permiso para que jefe de enfermeria pueda realizar desecho de suministro
------------------------------------------------------------------------------------------------------------------------------
userpermisos_suministro_diferente
------------------------------------------------------------------------------------------------------------------------------
-- SELECT para ver cuales cargos no existen para el tarifario
------------------------------------------------------------------------------------------------------------------------------


SELECT 
    CASE 
        WHEN EXISTS (
            SELECT *
            FROM tarifarios_detalle
            WHERE tarifario_id = '1010' AND cargo = '998702'
        ) THEN (
            SELECT cargo
            FROM tarifarios_detalle
            WHERE tarifario_id = '1010' AND cargo = '998702'
        )
        ELSE 'No existe'
    END AS resultado UNION ALL

------------------------------------------------------------------------------------------------------------------------------
-- IMAGENOLOGIA n puede cambiar el profesional de una orden
------------------------------------------------------------------------------------------------------------------------------
cuando no le permita cambiar el profesional de una orden, primero hay que revisar si ya esta facturado, si es asi, no le va a permitir.

------------------------------------------------------------------------------------------------------------------------------
-- PArametrizacion de cuentas contables por documentos, ticket recurrente de la jefe Estefania, de compras y suministros.
------------------------------------------------------------------------------------------------------------------------------
nos tiene que entregar el documento, ya sea SA NE NC, con este, en la tabla documentos traemos el tipo de documento y lo buscamos 
en este caso el SA es un E006, enotnces buscamos en la BD asi.
E006
y abrimos las tablas que tienen estos nombres parecidos.
doc_inv_e006_costos_parametros
doc_inv_e006_parametros
cuenta_debito  parametros,	cuenta_credito   costos_parametros
------------------------------------------------------------------------------------------------------------------------------
-- Quitar chulo a producto
------------------------------------------------------------------------------------------------------------------------------
se quita el chulo poniendo en estado 0 el sw_facturado de cuentas_detalle

------------------------------------------------------------------------------------------------------------------------------
-- No integra documentos contables a la DIAN o por medio de la interface contable FACTURE
------------------------------------------------------------------------------------------------------------------------------
Se debe de buscar en el modulo de contailidad, luego en integracion de documentos facture, y luego no integrados.
si aparece ahi debe de decir un mensaje que indique que no encuentra informacion de esta
por lo general es por que es una factura vieja y esta fue interfazada por el anterior gestor de interface, Carvajal.
entonces se debe de buscar la factura de este documento, esto lo hacemos en la tabla notas_credito, de ahi sacamos la factura
se revisa si existe, lo comun es que no se encuentre nada.
Si es asi, debemos ir a la tabla fact_electronica_registro_integracion, en esta debemos buscar con el prefijo que nos entregan
por ejemplo NE y a este lo cambiamos a estado 1 y le borramos el mensaje.

notas_credito
fact_electronica_registro_integracion

------------------------------------------------------------------------------------------------------------------------------
-- cancelar programacion de cirugias, y quirofano
------------------------------------------------------------------------------------------------------------------------------
estacion_enfermeria_qx_pacientes_ingresados

------------------------------------------------------------------------------------------------------------------------------
-- Cambio de lapso de vencimiento de formulas y ordenes medicas.
------------------------------------------------------------------------------------------------------------------------------
tabla: system_modulos_variables
modulo: Central_de_Autorizaciones
modulo_tipo: app
variable: vencimiento_formula_medica	
valor: 90
------------------------------------------------------------------------------------------------------------------------------
-- query para realcionar cargos a departameotns
------------------------------------------------------------------------------------------------------------------------------
INSERT INTO departamentos_cargos VALUES ('612502','890287',1,1,1,1,0,0,1,0);

------------------------------------------------------------------------------------------------------------------------------
-- actualizar estado de venta en listas precios
------------------------------------------------------------------------------------------------------------------------------
=CONCATENAR("UPDATE listas_precios SET sw_venta=0 WHERE codigo_lista='";B2;"';")
UPDATE listas_precios SET sw_venta=0 WHERE codigo_lista='0001';

SELECT
lis.codigo_lista,
lis.descripcion,
CASE
    WHEN lis.sw_venta='1' THEN 'ACTIVO'
    ELSE  'INACTIVO'
END AS estado,
lpr.codigo_producto,
ip.descripcion,
lpr.precio,
lpr.sw_porcentaje,
lpr.porcentaje,
lpr.valor_inicial
FROM listas_precios lis
JOIN listas_precios_detalle lpr ON lis.codigo_lista = lpr.codigo_lista
JOIN inventarios_productos ip ON lpr.codigo_producto = ip.codigo_producto

------------------------------------------------------------------------------------------------------------------------------
-- actualizar precio de producto en listas precios
------------------------------------------------------------------------------------------------------------------------------
UPDATE 
listas_precios_detalle 
SET 
precio= 301600
WHERE 
codigo_producto='0206082504';



SELECT 
*
 FROM "public"."listas_precios_detalle" 
 WHERE "codigo_producto" = '0206082504'

------------------------------------------------------------------------------------------------------------------------------
-- error de cuadre de cuenta, en citas medicamentos no aparece nada SOLICITUD MEDICAMENTOS APOYOS DX
------------------------------------------------------------------------------------------------------------------------------
hc_solicitudes_medicamentos
con el ingreso en la tabla 
hc_solicitudes_nmedicamentos
cuando son del departamento cercano a imagenologia la columna sw_apdx debe estar en 1

------------------------------------------------------------------------------------------------------------------------------
-- *cuando al hacer una devolucion resulta un erro que dice:
-- La consulta falloERROR:  INSERT tiene mÃ¡s expresiones que columnas de destino
-- LINE 1: ...LUES  (   435624,   '0206080985',   2,   3105722, 3105723  )...
------------------------------------------------------------------------------------------------------------------------------
*debemos de ver que los ultimos numeros que empiezan por 310... son los documento_despacho_id, estos encuentran mas de 1, por eso el error
*entonces hay 2 formas de arreglas este.
*buscamos en la tabla bodegas_documento_despacho_med con los codigos que encontramos en el error, vemos que estan ambos registrados.
*uno de ellos 2 esta malo, por lo tanto, hay que borrar 1.
*tomamos uno por uno de los codigos y buscamos en esta tabla, lo mejor es hacer la busqueda de todos los codigos al mismo tiempo, bodegas_documento_despacho_med_d
*si uno trae informacion y el otro no, se borra el que no trae inforamacion, lo borramos de la tabla bodegas_documento_despacho_med
*Si ninguno trae informacion, entonces vamos a la tabla de atras, hc_solicitudes_medicamentos y buscamos con los numeros documento_despacho_id
*si encuentra un solo documento, entonces borramos el que no tiene informacion de la tabla bodegas_documento_despacho_med, y listo, hacemos la devolucion y ya esta.

hc_solicitudes_medicamentos
bodegas_documento_despacho_med
bodegas_documento_despacho_med_d

------------------------------------------------------------------------------------------------------------------------------
-- Permisos Tinvas para llenar en evolucion de diligenciar una evolucion:
-- VALORACION
-- INSERCION
-- CURACION
-- SEGUIMIENTO
-- RETIRO
------------------------------------------------------------------------------------------------------------------------------
system_hc_submodulos_variables

SELECT "submodulo","variable","valor","descripcion" FROM "public"."system_hc_submodulos_variables" WHERE "variable" ILIKE '%tinva%'

EvolucionCompletaII
medicoTinvas
1468|1848|1452|2122	
usuario autirizado para realizar proyecto tinvas

------------------------------------------------------------------------------------------------------------------------------
-- verificar solicitudes de imagenologia
------------------------------------------------------------------------------------------------------------------------------
interface_datalab_solicitudes
interface_datalab_resultados
resultados_integracion
estudios_integracion

A90X | A970

A972 220
A91X 220

los demas 210

------------------------------------------------------------------------------------------------------------------------------
-- Cambio de fecha de vencimiento de ordenes medicas.
------------------------------------------------------------------------------------------------------------------------------
os_maestro WHERE numero_orden_id = '5358197'
os_ordenes_servicios WHERE orden_servicio_id = '3501327'



INSERT INTO cg_conf.doc_fv01_cargos_por_cc 
SELECT '01', tarifario_id, '865202', 610504, 410504, 'C', 611211, 417505, null, '001', null, null, null
FROM
tarifarios_detalle
WHERE
cargo='865202'


INSERT INTO cg_conf.doc_fv01_cargos_por_cc VALUES ('01', '0002', '865202', 610504, 410504, 'C', 611211, 417505, null, '001', null, null, null)

------------------------------------------------------------------------------------------------------------------------------
-- Insert de diagnosticos.
------------------------------------------------------------------------------------------------------------------------------

INSERT INTO diagnosticos (diagnostico_id, diagnostico_nombre, nivel, sexo_id, edad_min, edad_max, categoria, grupo, capitulo, grupo_ficha_id, sw_alerta, sw_ficha, sw_cancerigeno, var_ficha) VALUES('A971', 'DENGUE CON SIGNOS DE ALARMA', '3', NULL, NULL, 100, NULL, NULL, 'A97', NULL, '0', 5, '0', '220');
INSERT INTO diagnosticos (diagnostico_id, diagnostico_nombre, nivel, sexo_id, edad_min, edad_max, categoria, grupo, capitulo, grupo_ficha_id, sw_alerta, sw_ficha, sw_cancerigeno, var_ficha) VALUES('A972', 'DENGUE SEVERO', '3', NULL, NULL, 100, NULL, NULL, 'A97', NULL, '0', 5, '0', '220');
INSERT INTO diagnosticos (diagnostico_id, diagnostico_nombre, nivel, sexo_id, edad_min, edad_max, categoria, grupo, capitulo, grupo_ficha_id, sw_alerta, sw_ficha, sw_cancerigeno, var_ficha) VALUES('A979', 'DENGUE NO ESPECIFICADO', '3', NULL, NULL, 100, NULL, NULL, 'A97', NULL, '0', 5, '0', '210');
INSERT INTO diagnosticos (diagnostico_id, diagnostico_nombre, nivel, sexo_id, edad_min, edad_max, categoria, grupo, capitulo, grupo_ficha_id, sw_alerta, sw_ficha, sw_cancerigeno, var_ficha) VALUES('A970', 'DENGUE SIN SIGNOS DE ALARMA', '3', NULL, NULL, 100, NULL, NULL, 'A97', NULL, '0', 5, '0', '210');
INSERT INTO diagnosticos (diagnostico_id, diagnostico_nombre, nivel, sexo_id, edad_min, edad_max, categoria, grupo, capitulo, grupo_ficha_id, sw_alerta, sw_ficha, sw_cancerigeno, var_ficha) VALUES('A91X', 'FIEBRE DEL DENGUE HEMORRAGICO', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 5, '0', '220');
INSERT INTO diagnosticos (diagnostico_id, diagnostico_nombre, nivel, sexo_id, edad_min, edad_max, categoria, grupo, capitulo, grupo_ficha_id, sw_alerta, sw_ficha, sw_cancerigeno, var_ficha) VALUES('A90X', 'FIEBRE DEL DENGUE [DENGUE CLASICO]', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', 5, '0', '210');

------------------------------------------------------------------------------------------------------------------------------
-- formato de procedimientos a realizar para hacer un requerimiento correctamente.  INSTRUCTIVO GESTION DE DOCUMENTACION DE PROYECTO
------------------------------------------------------------------------------------------------------------------------------
https://docs.google.com/document/d/1mvmpyGYOr4DaD85lhrEO9dHVpDoh6lQr/edit?pli=1

------------------------------------------------------------------------------------------------------------------------------
-- ver movimientos de pacientes entre estaciones
------------------------------------------------------------------------------------------------------------------------------
estaciones_enfermeria_ingresos_pendientes
estaciones_enfermeria_ingresos_realizados

------------------------------------------------------------------------------------------------------------------------------
-- encuentra las facturas en VE, de venta de farmacia
------------------------------------------------------------------------------------------------------------------------------
fac_facturas_contado


-- Realizar un UPSERT
INSERT INTO listas_precios_detalle 
SELECT ('01', '0101021605', '0001', 6454200000, '0', 0, 0, NOW(), 3355
)
ON CONFLICT (codigo_producto, codigo_lista) DO UPDATE SET
    precio = 6454200000
WHERE listas_precios_detalle.codigo_producto = '0101021605';




(SELECT codigo_lista FROM listas_precios WHERE sw_venta=1)



SELECT
DISTINCT 
lp.*
FROM
listas_precios_detalle lpd
JOIN listas_precios lp ON lpd.codigo_lista = lp.codigo_lista
WHERE
lp.sw_venta='1'

 
INSERT INTO
listas_precios_detalle
SELECT SLE


INSERT INTO
cg_conf.doc_fv01_cargos_por_cc
SELECT '01', tarifario_id, '862326', 612001, 412001, 'C', 612001, 417520, 61201001, '001', null, null, null
FROM
tarifarios_detalle
WHERE
cargo='862326'


INSERT INTO
listas_precios_detalle
SELECT 
'01',
'0101010261',
lpd.codigo_lista,
10000000,
'0',
'0',
'0',
NOW(),
NULL
FROM 
listas_precios_detalle lpd
JOIN listas_precios lp ON lpd.codigo_lista = lp.codigo_lista
WHERE
lp.sw_venta='1'
ON CONFLICT (codigo_producto, codigo_lista) 
DO 
UPDATE listas_precios_detalle lpds
SET
lpds.precio = 2
WHERE codigo_producto='0101010261'

------------------------------------------------------------------------------------------------------------------------------
-- ERROR de bodega en las solicitud y las devoluciones de medicmaneots y devoluciones
------------------------------------------------------------------------------------------------------------------------------
--guardar las solicitudes que ya estan en FA

UPDATE 
hc_solicitudes_medicamentos
SET 
bodega='FA'
WHERE
ingreso=2055899 and bodega='UR'

--para devolver a todo como estaba, ejecutar el siguiente, teniendo en cuenta solo los que estaban en UR

UPDATE 
hc_solicitudes_medicamentos
SET 
bodega='UR'
WHERE
ingreso=2055899
AND bodega='FA'
AND solicitud_id IN(3271663,
3272104,
3272591,
3272592,
3271477,
3271467,
3271665,
3271464,
3271476)


------------------------------------------------------------------------------------------------------------------------------
-- cuando una interconsulta no le aparece para atender
------------------------------------------------------------------------------------------------------------------------------
especialidades_cargos_tarifarios
especialidades_cargos
especialidades

INSERT INTO
especialidades_cargos_tarifarios
SELECT
'102',
tarifario_id,
'890409'
FROM tarifarios_detalle
WHERE
cargo='890409'
AND
tarifario_id NOT IN (SELECT tarifario_id FROM especialidades_cargos_tarifarios
WHERE especialidad='102') 


------------------------------------------------------------------------------------------------------------------------------
-- cuando un paciente sequeda pegado en la estacion de consulta urgencias
------------------------------------------------------------------------------------------------------------------------------
buscar en la tabla pacientes_urgencias u poner estado en 5


------------------------------------------------------------------------------------------------------------------------------
-- 
------------------------------------------------------------------------------------------------------------------------------


cuando van a devolver una preparacion y no pasa del boton verde, se queda ahi sin hacer nada, 
debemos ir al debug del F12, entonces abrimos el F12, luego en RED, 
luego le damos click al boton verde y tomamos el ulñtimo

La consulta falloERROR:  INSERT tiene mÃ¡s expresiones que columnas de destino
LINE 1: ...LUES  (   448207,   '0102011325',   2,   3181314, 3181317  )...

hc_solicitudes_medicamentos







INSERT INTO bodegas_usuarios 
SELECT '01', '01', bodega, 3355 FROM bodegas


RC
1062341778
anestesiologia


no le permite hacer devoluciones.
paola andrea ramos guerrero
paola.ramos
urgencias 1