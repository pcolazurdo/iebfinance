class Vale < ActiveRecord::Base
  belongs_to :Cuenta

  class << self

    def calcular_vales
      hash = {}
      hash[:SumaPesos]  = Vale.where("'fechaRendicion' IS NULL").sum(:montoPesos) || 0.0
      hash[:SumaDolares]  = Vale.where("'fechaRendicion' IS NULL").sum(:montoDolares) || 0.0
      return hash
    end

  end

end
