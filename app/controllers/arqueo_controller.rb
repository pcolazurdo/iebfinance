class ArqueoController < ApplicationController
  ArqueoStruct = Struct.new :efectivo, :movimientos, :vales, :diferencia, :fecha

  def index
    @fecha = params[:fecha] ? Date.parse(params[:fecha]) : Date.today


    @arqueo = arqueo(@fecha)
    render 'index'
  end

  def imprimir
  end


  def arqueo(fecha)

    arqueo = ArqueoStruct.new
    arqueo.fecha = fecha
    arqueo.diferencia = {}
    arqueo.efectivo = Efectivo.calcular_efectivo(fecha)
    arqueo.movimientos = Movimiento.calcular_saldos_movimientos()
    arqueo.vales = Vale.calcular_vales()

    arqueo.diferencia[:Pesos] = arqueo.movimientos[:Pesos] - arqueo.vales[:Pesos] - arqueo.efectivo[:Pesos]
    arqueo.diferencia[:Dolares] = arqueo.movimientos[:Dolares] - arqueo.vales[:Dolares] - arqueo.efectivo[:Dolares]

    puts arqueo.movimientos[:Pesos]
    puts arqueo.vales[:Pesos]
    puts arqueo.efectivo[:Pesos]
    puts "----"

    puts arqueo.movimientos[:Dolares]
    puts arqueo.vales[:Dolares]
    puts arqueo.efectivo[:Dolares]

    return arqueo
  end


  def prev
    puts "Prev:", params[:fecha]
    @fecha = Date.parse(params[:fecha])
    date = Efectivo.where("fecha < ?", @fecha.strftime('%Y/%m/%d 0:00')).maximum(:fecha)
    puts "Prev:", date
    redirect_to arqueo_index_path(fecha: date)
  end

  def next
    puts "Next:", params[:fecha]
    @fecha = Date.parse(params[:fecha])
    date = Efectivo.where("fecha < ?", @fecha.strftime('%Y/%m/%d 0:00')).maximum(:fecha)
    puts "Next:", date
    redirect_to arqueo_index_path(fecha: date)
  end

end
