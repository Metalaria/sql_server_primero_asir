use gmmoreno_1
go
create procedure insertar_vehiculo_1
	@matricula char (7),
	@tipo text,
	@equipo char(4),
	@itv datetime
as 
begin
	if exists (select Id_equipo from equipos where id_equipo = @equipo)
		begin
			insert into vehiculos values (@matricula, @tipo, @equipo, @itv)
			print 'vehiculo insertado con exito'
		end
	else
		begin
			print 'vehiculo no insertado porque no existe el equipo'
		end
end

use gmmoreno_1
go
create procedure insertar_vehiculo_2
	@matricula char (7),
	@tipo text,
	@equipo char(4),
	@itv datetime
as 
begin
declare @error int
	insert into vehiculos values (@matricula, @tipo, @equipo, @itv)
set @error = @@error
	if @error=2627
		begin
			print 'vehiculo no insertado porque no existe el equipo'
		end
	
		else if @error=547
			begin
				print 'vehiculo no insertado porque no existe el equipo'
			end
		else if @error = 0
			begin
				print 'vehiculo insertado con exito'
			end
	
end 

--con un CASE
use gmmoreno_1
go
create procedure insertar_vehiculo_2_case
	@matricula char (7),
	@tipo text,
	@equipo char(4),
	@itv datetime
as 
begin
declare @error int
declare @mensaje varchar (100)
	insert into vehiculos values (@matricula, @tipo, @equipo, @itv)
set @error = @@error
set @mensaje = 
	case @error
		when 2627 then 'vehiculo no insertado porque ya existe'
		when 547 then 'vehiculo no insertado porque ya existe'
		when 0 then 'vehículo insertado con exito'
		else 'error no controlado'
	end -- end del case
print @mensaje
end