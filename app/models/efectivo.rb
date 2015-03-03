class Efectivo < ActiveRecord::Base
  def calcular_efectivo(fecha)

    efectivo = {}

    if not fecha.nil?
      e = Efectivo.where("date_trunc('day',fecha) = ?", fecha.to_date)
      if e.count != 1
        puts "calcular_efectivo.error = count: ", e.count
      else
        ef = e.take()
        efectivo[:Pesos] = (ef.Pesos2 || 0.0) * 2 + (ef.Pesos5 || 0.0) * 5 + (ef.Pesos10 || 0.0) * 10 + (ef.Pesos20 || 0.0) * 20 + (ef.Pesos50 || 0.0) * 50 + (ef.Pesos100 || 0.0) * 100 + (ef.PesosMonedas || 0.0)
        efectivo[:Dolares] = (ef.Dolares1 || 0.0) * 1 + (ef.Dolares2 || 0.0) * 2 + (ef.Dolares5 || 0.0) * 5 + (ef.Dolares10 || 0.0) * 10 + (ef.Dolares20 || 0.0) * 20 + (ef.Dolares50 || 0.0) * 50 + (ef.Dolares100 || 0.0) * 100 + (ef.DolaresMonedas || 0.0)
      end
    else
      puts "calcular_efectivo.error = fecha is nil"
    end
    return efectivo
  end
end
