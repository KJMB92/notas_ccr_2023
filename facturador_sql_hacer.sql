SELECT  SOL.*, 
        frm.dosis, 
        frm.unidad_dosificacion, 
        frm.frecuencia
FROM (
        SELECT  HS.solicitud_id,
                TO_CHAR(HS.fecha_solicitud,'YYYY-MM-DD HH24:MI') AS fecha_solicitud,
                HS.sw_estado,
                I.ingreso,
                TO_CHAR(SI.fecha_registro,'YYYY-MM-DD HH24:MI') AS fecha_egreso,
                P.tipo_id_paciente,
                P.paciente_id,
                P.primer_nombre,
                P.segundo_nombre,
                P.primer_apellido,
                P.segundo_apellido,
                COALESCE((select   peso from  hc_signos_vitales sv where  sv.ingreso=I.ingreso  and sv.fecha_registro = (select max(fecha_registro) from hc_signos_vitales svs where svs.ingreso= I.ingreso)), (select a.signos_vitales_peso from signos_vitales_triages a inner join triages b on (a.triage_id = b.triage_id) where b.ingreso = I.ingreso)) peso_paciente,
                BDM.codigo_producto as codigo_producto_despachado,
                (	SELECT 	IV.descripcion
                FROM	inventarios_productos IV
                WHERE	IV.codigo_producto = BDM.codigo_producto
                ) as producto_despachado,
                HSM.medicamento_id as codigo_producto,
                round(BDM.cantidad) as cant_despachada,
                HS.bodegas_doc_id,
                EE.descripcion as estacion
        FROM    hc_solicitudes_medicamentos_d HSM
                LEFT JOIN bodegas_documento_despacho_med_d BDM ON (HSM.consecutivo_d = BDM.consecutivo_solicitud)
                LEFT JOIN bodegas_documento_despacho_med BD ON (BDM.documento_despacho_id = BD.documento_despacho_id)
                INNER JOIN hc_solicitudes_medicamentos HS ON (HS.solicitud_id = HSM.solicitud_id)
                LEFT JOIN bodegas_documentos B ON (HS.numeracion = B.numeracion)
                INNER JOIN estaciones_enfermeria EE ON (HS.estacion_id = EE.estacion_id)
                INNER JOIN ingresos I ON ( HS.ingreso = I.ingreso)
                LEFT JOIN ingresos_salidas SI ON (SI.ingreso = I.ingreso)
                INNER JOIN cuentas CU ON ( CU.ingreso = I.ingreso)
                INNER JOIN pacientes P ON ( I.tipo_id_paciente = P.tipo_id_paciente AND I.paciente_id = P.paciente_id)
                INNER JOIN medicamentos MDS ON (MDS.codigo_medicamento = HSM.medicamento_id)
        WHERE	HS.fecha_solicitud::DATE BETWEEN '2024-01-01' AND NOW()
        AND	CU.sw_corte = '0'
        UNION ALL
        SELECT	HS.solicitud_id,
                TO_CHAR(HS.fecha_solicitud,'YYYY-MM-DD HH24:MI') AS fecha_solicitud,
                HS.sw_estado,
                I.ingreso,
                TO_CHAR(SI.fecha_registro,'YYYY-MM-DD HH24:MI') AS fecha_egreso,
                P.tipo_id_paciente,
                P.paciente_id,
                P.primer_nombre,
                P.segundo_nombre,
                P.primer_apellido,
                P.segundo_apellido,
                COALESCE((select   peso from  hc_signos_vitales sv where  sv.ingreso=I.ingreso  and sv.fecha_registro = (select max(fecha_registro) from hc_signos_vitales svs where svs.ingreso= I.ingreso)), (select a.signos_vitales_peso from signos_vitales_triages a inner join triages b on (a.triage_id = b.triage_id) where b.ingreso = I.ingreso)) peso_paciente,
                BDI.codigo_producto as codigo_producto_despachado,        
                (	SELECT 	IV.descripcion
                FROM	inventarios_productos IV
                WHERE	IV.codigo_producto = BDI.codigo_producto
                ) as producto_despachado,
                HSI.codigo_producto,
                round(BDI.cantidad) as cant_despachada,
                HS.bodegas_doc_id,
                EE.descripcion as estacion
        FROM	hc_solicitudes_insumos_d HSI
                LEFT JOIN bodegas_documento_despacho_ins_d BDI ON (HSI.consecutivo_d = BDI.consecutivo_solicitud)
                LEFT JOIN bodegas_documento_despacho_med BD ON (BDI.documento_despacho_id = BD.documento_despacho_id)
                INNER JOIN hc_solicitudes_medicamentos HS ON (HS.solicitud_id = HSI.solicitud_id)
                LEFT JOIN bodegas_documentos B ON (HS.numeracion = B.numeracion)
                INNER JOIN estaciones_enfermeria EE ON (HS.estacion_id = EE.estacion_id)
                INNER JOIN ingresos I ON (HS.ingreso = I.ingreso)
                LEFT JOIN ingresos_salidas SI ON (SI.ingreso = I.ingreso)
                INNER JOIN cuentas CU ON (CU.ingreso = I.ingreso)
                INNER JOIN pacientes P ON (I.tipo_id_paciente = P.tipo_id_paciente AND I.paciente_id = P.paciente_id)
                LEFT JOIN medicamentos MDS ON (MDS.codigo_medicamento = HSI.codigo_producto)
        WHERE  HS.fecha_solicitud::DATE BETWEEN '2024-01-01' AND NOW()
        AND	CU.sw_corte = '0'
   ) AS SOL
        LEFT JOIN hc_formulacion_medicamentos fr ON ( SOL.codigo_producto = fr.codigo_producto AND SOL.ingreso = fr.ingreso )
        LEFT JOIN hc_formulacion_medicamentos_eventos frm ON (fr.codigo_producto = frm.codigo_producto AND fr.ingreso = frm.ingreso AND fr.num_reg = frm.num_reg )
        LEFT JOIN bodega_paciente bdp ON ( SOL.codigo_producto = bdp.codigo_producto AND SOL.ingreso = bdp.ingreso )




SELECT    b.signos_vitales_peso as peso,        
                            b.talla,
                            TO_CHAR(b.fecha, 'YYYY-MM-DD HH24:MI') AS fecha_registro,         
                            c.nombre 
                    FROM    triages a,          
                            signos_vitales_triages b,         
                            system_usuarios c 
                    WHERE    a.ingreso = 1947835 
                            AND    b.triage_id = a.triage_id 
                            AND    c.usuario_id = b.usuario_id
                    UNION
                    SELECT    ra.peso,        
                            ra.talla,         
                            TO_CHAR(ra.fecha_registro, 'YYYY-MM-DD HH24:MI') AS fecha_registro,         
                            su.nombre 
                    FROM    hc_registros_antropometricos ra,          
                            system_usuarios su 
                    WHERE    ra.ingreso = 1947835 
                            AND    ra.usuario_id = su.usuario_id 
                    ORDER BY 3 DESC