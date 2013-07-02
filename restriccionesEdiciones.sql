use gmmoreno_1
ALTER table ediciones
 ADD CONSTRAINT  CK_fechacomienzo_fin
 check (fechaInicio<fechaFin);
 
 ALTER table ediciones
 ADD CONSTRAINT  CK_anno
 check (AñoCelebracion>=1980 AND AñoCelebracion <=2020);