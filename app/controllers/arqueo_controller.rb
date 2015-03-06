class ArqueoController < ApplicationController
  ArqueoStruct = Struct.new :efectivo, :movimientos, :vales, :diferencia, :fecha

  def calcular
    if params[:fecha].nil?
      fecha = "2090-12-31"
    else
      fecha = params[:fecha]
    end

    @arqueo = arqueo(fecha)
    render 'calcular'
  end

  def imprimir
  end


  def arqueo(fecha)
    if fecha.nil?
      fecha = "2090-12-31"
      puts "Para calcular el arqueo usted debería especificar una fecha"
    end

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

end
