use gmmoreno_1
go
create procedure alta_ciclista
	@dni integer,
	@nombre varchar (20),
	@apellido1 varchar(20),
	@apellido2 varchar (20),
	@fecha_nac datetime,
	@edad integer
	
as 
begin
declare @error int
	insert into ciclistas values (@dni, @nombre, @apellido1, @apellido2, @fecha_nac, @edad)
set @error = @@error
	if @error=2627
		begin
			print 'ciclista no insertado'
		end
	
		else if @error=547
			begin
				print 'ciclista no insertado'
			end
		else if @error = 0
			begin
				print 'ciclista insertado con exito'
			end
	
end 