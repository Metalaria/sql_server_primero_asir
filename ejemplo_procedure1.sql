use gmmoreno_1
go
create procedure mostrar_ciclistas
as
	begin
		select * from ciclistas
	end
-- ejemplo de insercion de datos pidiendo parametros

use gmmoreno_1
go

create procedure insertar_ciclista
	@dni int,
	@nombre varchar (20),
	@apellido1 varchar (20),
	@apellido2 varchar (20),
	@fecha datetime,
	@edad int

as
	begin
		insert into ciclistas values (@dni, @nombre, @apellido1, @apellido2, @fecha, @edad)
	end