--trigger que comprueba que el ciclista no tenga ya un contrato cuando se inserta un nuevo ciclista

use gmmoreno_1
go
create trigger g_insertar_contrato_ciclista
on ciclistas_equipos
instead of insert
as
begin
	declare @dni int
	select @dni = dni from inserted
	declare @anno_inicio int
	declare @equipo char(4)
	select @equipo = id_equipo from inserted
	declare @fecha_contrato datetime
	select @fecha_contrato=fecha_contrato from inserted
	select @anno_inicio = max(year(fecha_contrato)) from equipos_ciclistas
	declare @duracion int
	declare @nueva_duracion int
	select @nueva_duracion = @duracion from inserted
	select @duracion=duracion_contratro from equipos_ciclistas where (dni=@dni 
	and year(fecha_contrato)=@anno_inicio)
	declare @anno_fin int
	set @anno_fin=@anno_inicio+@duracion-1

	if (not exists (select dni from ciclistas_equipos 
	where dni = (select dni from inserted))
	and
	(anno>=year(@fecha_contrato)
	and
	(anno>=@fecha_contrato+@duracion-1)
	insert into_equipos_ciclistas values (@equipo, @dni, @fecha_contrato, @nueva_duracion)
	))
end