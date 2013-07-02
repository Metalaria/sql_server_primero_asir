use gmmoreno_1
go
create procedure r_inscribir_ciclista
@dni int
as
begin
	declare @edicion_actual int
	select @edicion_actual = edición from ediciones where año = year(getdate())
	if exists select dni from ciclistas where dni = @dni and)
	and
	not exists select  edición from ediciones_ciclistas where edición=@edicion_actual and dni=@dni
		begin
			insert into ediciones_ciclistas values (@edicion_actual, @dni, 14400, 2)
			return 0
		end
	else return 1
end
