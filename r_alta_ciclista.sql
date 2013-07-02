use gmmoreno_1
go
create procedure r_alta_cilista

@dni int,
@nombre varchar(20),
@ap1 varchar (20),
@ap2 varchar(20),
@fn datetime

as
begin
	declare @error int
	set @error=0
	
	if @dni<0 or @dni >999999999
	begin
		set @error = @error +1
	end
	if year(@fn) < 1950
	begin
		set @error=@error+10
	end
	if exists (select dni from ciclistas where dni=@dni)
	begin
		set @error=@error+100
	end
	if @error = 0
	begin
		insert into ciclistas values (@dni,@nombre, @ap1, @ap2, @fn) 
	end
	return @error
end
