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