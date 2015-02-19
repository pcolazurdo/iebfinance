class Cuenta < ActiveRecord::Base
  has_many :vales
  has_many :ofrendas
  has_many :movimientos
end
