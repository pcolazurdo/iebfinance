rem call rails generate scaffold Efectivo fecha:date Pesos2:decimal Pesos5:decimal Pesos10:decimal Pesos20:decimal Pesos50:decimal Pesos100:decimal PesosMonedas:decimal Dolares1:decimal Dolares2:decimal Dolares5:decimal Dolares10:decimal Dolares20:decimal Dolares50:decimal Dolares100:decimal DolaresMonedas:decimal 
rem call rails generate scaffold Vale cuenta:string responsable:string fechaEmision:date fechaRendicion:date estado:string montoPesos:decimal montoDolares:decimal comentario:text 
rem call rails generate scaffold Cuenta cuenta:string subcuenta1:string subcuenta2:string subcuenta3:string subcuenta4:string subcuenta5:string descripcion:text nombre:string estado:string tipo:string --force-plural 
rem call rails generate scaffold Miembro idFiscal:string nombre:string estado:string tipo:string email:string direccion:string 
rem call rails generate scaffold Ofrenda fecha:date montoPesos:decimal montoDolares:decimal esCheque:boolean idcheque:string comentario:text 
rem call rails generate migration AddCuentaRefToOfrenda cuenta:references
rem call rails generate migration AddMiemrboRefToOfrenda miembro:references
rem call rails generate scaffold Movimiento fecha:date IngresoPesos:decimal IngresoDolares:decimal EgresoPesos:decimal EgresoDolares:decimal Comprobante:string comentario:text 
rem call rails generate migration AddCuentaRefToMovimiento cuenta:references

call rails generate controller Arqueo calcular imprimir