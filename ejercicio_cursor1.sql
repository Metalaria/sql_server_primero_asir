/*

Declarar una variable tipo tabla con los campos ciclista, equipo y año. Esta tabla no va a tener clave.
Declarar un cursor sobre la tabla equipos_ciclistas que tome el equipo, el ciclista, el año y la duración
se usará el cursor para insertar una fila por año de contrato.
Cada vez que se lea un contrato se insertará el ciclista, el equipo y el año.

*/

use gmmoreno_1
go

declare @tabla_contratos table
	(ciclista int,
	equipo char(4),
	anno int)
	
declare @cursor1 cursor
set @cursor1 =cursor for
select id_ciclista, id_equipos, n_años_cont from ciclistas_equipos
open @cursor1

declare @ciclista int
declare @equipo char(4)
declare @anno_inicio int
declare @duracion int
declare @i int
set @i = 1

open @cursor2
fetch next from @cursor1 into @ciclista, @equipo, @anno_inicio, @duracion
fetch next from @cursor1 into @tabla_contratos
while @@fetch_status = 0
	begin
		
		while @i<duracion
		--select @annos = años_contrato from ciclistas_equipos
		while @annos <= años_contrato
			begin
				insert into @tabla_contratos values (ciclista, equipo, getdate()+@i+1)
				set @i = @i+1
			end
			--set @annos =0
		-- aqui hay que meter otro bucle que haga una iserción por cada uno de los años que dure el contrato
		-- se inserta año +@i -1
		/*insert into @tabla_contratos*/
	end	
deallocate 