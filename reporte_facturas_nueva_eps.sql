aut.codigo_autorizacion AS "AUTORIZACION",

FROM 
fac_facturas ffc
JOIN auditoria_facturacion_electronica afe ON ffc.prefijo = afe.prefijo AND ffc.factura_fiscal = afe.numero
JOIN fact_electronica_registro_integracion feri ON ffc.prefijo = feri.prefijo AND ffc.factura_fiscal = feri.numeracion
LEFT JOIN notas_credito nc ON ffc.prefijo = nc.prefijo_factura AND ffc.factura_fiscal = nc.factura_fiscal
JOIN fac_facturas_cuentas ffcc ON ffc.prefijo = ffcc.prefijo AND ffc.factura_fiscal = ffcc.factura_fiscal
JOIN cuentas cu ON ffcc.numerodecuenta = cu.numerodecuenta
JOIN ingresos ing ON cu.ingreso = ing.ingreso
JOIN hc_diagnosticos_ingreso hdi ON i.ingreso = hdi.ingreso AND hdi.sw_principal = '1'
JOIN ingresos_salidas ings ON ing.ingreso = ings.ingreso
LEFT JOIN autorizaciones aut ON i.ingreso = aut.ingreso




