class Vale < ActiveRecord::Base
  belongs_to :Cuenta
  # validates_inclusion_of :debtor, :reconcilable, in: [true, false]
  # validates_presence_of :label, :name, :number
  # validates_length_of :last_letter, allow_nil: true, maximum: 10
  # validates_length_of :number, allow_nil: true, maximum: 20
  # validates_length_of :name, allow_nil: true, maximum: 200
  # validates_format_of :number, :with => /\A\d(\d(\d[0-9A-Z]*)?)?\z/
  # validates_uniqueness_of :number

  # scope :between, lambda { |started_at, stopped_at|
  #   where(sampled_at: started_at..stopped_at)
  # }

  scope :pendientes, -> { where('"fechaRendicion" IS NULL') }


  class << self

    def calcular_vales
      hash = {}
      hash[:Pesos]  = Vale.pendientes.sum(:montoPesos) || 0.0
      hash[:Dolares]  = Vale.pendientes.sum(:montoDolares) || 0.0
      return hash
    end

  end

end
