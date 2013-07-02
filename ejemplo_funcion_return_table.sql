use gmmoreno_1
go
create function f_alta_ciclista2(
	@dni int,
	@nombre varchar(20),
	@ap1 varchar (20),
	@ap2 varchar(20),
	@fn datetime
)
returns @ciclistas table
	(dni int,
	nombre varchar (20),
	ap1 varchar(20),
	ap2 varchar(20),
	fn datetime
)
as
begin
	insert into @ciclistas values (@dni, @nombre, @ap1, @ap2, @fn)
	return
end
