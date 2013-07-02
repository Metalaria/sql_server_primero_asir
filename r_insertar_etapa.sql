use gmmoreno_1
go
create procedure r_alta_etapa

@codigo smallint,
@origen varchar(50),
@destino varchar(50),
@tipo varchar(30),
@distancia decimal(4,1),
@fecha datetime

as 
	begin
		declare @edicion int
		select @edicion=edición from ediciones where año = year(getdate());
		if @edicion is not null
		begin
			insert into etapas values (@codigo,@origen, @destino, @tipo, @distancia, @fecha) 
		end
		else
		begin
			print 'no se puede insertar porque no existe la edicion'
		end
	end