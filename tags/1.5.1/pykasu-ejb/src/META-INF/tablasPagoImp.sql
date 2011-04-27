create table BW_SET_PAGO_IMPUESTO(
	pago_id int not null,
	ot_id int not null,
	era int not null,
	sucursal_era varchar(40) not null,
	cajero varchar(40) not null,
	consecutivo int not null,
	boleta_numero varchar(100) not null,
	ruc varchar(40) not null,
	dv varchar(40),
	monto float(8) not null,
	periodo varchar(20),
	fecha_creacion timestamp not null,
	fecha_envio timestamp,
	estado varchar(40),
	respuesta varchar(2048),
	
	PRIMARY KEY (pago_id)
)


create table BW_SET_PIMPUESTO_DETALLE(
	pago_impuesto_id int not null,
	pagoImpuesto_pago_id int not null,
	codigo varchar(40) not null,
	descripcion varchar(200),
	monto float(8) not null,
	resolucion varchar(40),
	periodo varchar(20),
	
	PRIMARY KEY (pago_impuesto_id)
)


CREATE SEQUENCE BW_OT_SEQUENCE
START WITH 1
INCREMENT BY 1
MAXVALUE 100000
MINVALUE 0
NOCACHE
NOCYCLE 

create table BW_SET_ORDEN_TRANSFERENCIA(
	ot_id int not null,
	era int not null,
	consecutivo int not null,
	numero varchar(100) not null,
	importe float(8) not null,	
	cuenta_bcp varchar(80),
	fecha_creacion timestamp not null,
	fecha_envio timestamp,
	estado varchar(40),
	respuesta varchar(2048),
	
	PRIMARY KEY (ot_id)
)



-- Permisos para la aplicación
--(select max(id)+1 from WSAS_Metodo) -- 134
insert into WSAS_Metodo
(id,descripcion, nombre)
values
(134, 'Realizar Pago de Impuestos de la SET', 'pagarImpuestoSET');
 

--(select id from wsas_aplicacion where lower(nombre) like '%front end%')  -- 43
insert into wsas_aplicacion_wsas_metodo
( wsas_aplicacion_id,
  metodos_id
)
values
( 43,
  134
);




========================================
select valor from bw_set_consecutivos c where tipo like 'OT'

select p.ot_id, count(1) as cantidad_pagos, max(p.era) as era, sum(monto) as monto 
from bw_set_pago_impuesto p
where p.ot_id >= (select valor from bw_set_consecutivos c where tipo like 'OT')
group by p.ot_id
order by p.ot_id
select * from BW_SET_ORDEN_TRANSFERENCIA
select p.ot_id, count(1) as cantidad_pagos, max(p.era) as era, sum(monto) as monto from bw_set_pago_impuesto p where p.ot_id >= (select valor from bw_set_consecutivos c where tipo like 'OT') group by p.ot_id order by p.ot_id
create table BW_SET_ORDEN_TRANSFERENCIA(
	ot_id int not null,
	era int not null,
	consecutivo int not null,
	numero varchar(100) not null,
	importe float(8) not null,	
	cuenta_bcp varchar(80),
	fecha_creacion timestamp not null,
	fecha_envio timestamp,
	estado varchar(40),
	respuesta varchar(2048),
	
	PRIMARY KEY (ot_id)
)


select p.ot_id, count(1) as cantidad_pagos, max(p.era) as era, sum(monto) as monto 
from bw_set_pago_impuesto p 
where p.ot_id >= (select valor from bw_set_consecutivos c where tipo like 'OT') 
group by p.ot_id 
order by p.ot_id; 





select p.ot_id, p.ot_id as consecutivo, p.ot_id as numero,max(p.era) as era, sum(monto) as importe,
	case when ( p.ot_id > 1 ) then 2 else 1 end as tipo,
       null as fecha_creacion, 
       null as fecha_envio, 
       null as cuenta_bcp, 
       null as respuesta_set,
       null as estado
from bw_set_pago_impuesto p 
where p.ot_id >= 1 
group by p.ot_id 
order by p.ot_id

=====================================================