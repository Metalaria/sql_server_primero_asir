use gmmoreno_1
go
create function calcular_edad
(@fecha datetime)
returns int
as
	begin
		declare @edad int
		set @edad = year(getdate()) - year(@fecha)
		return @edad
	end
	