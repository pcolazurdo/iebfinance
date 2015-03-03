class Movimiento < ActiveRecord::Base
  belongs_to :cuenta

  def calcular_saldos_movimientos()
    hash = {}
    hash[:SumaIngresoPesos]  = Movimiento.all.sum(:IngresoPesos) || 0.0
    hash[:SumaIngresoDolares]  = Movimiento.all.sum(:IngresoDolares) || 0.0
    hash[:SumaEgresoPesos]  = Movimiento.all.sum(:EgresoPesos) || 0.0
    hash[:SumaEgresoDolares]  = Movimiento.all.sum(:EgresoDolares) || 0.0
    hash[:SaldoPesos]  = hash[:SumaIngresoPesos] - hash[:SumaEgresoPesos]
    hash[:SaldoDolares]  = hash[:SumaIngresoDolares] - hash[:SumaEgresoDolares]
    return hash
  end

end
