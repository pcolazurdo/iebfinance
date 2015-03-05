class Miembro < ActiveRecord::Base
  has_many :ofrendas

  scope :activos , -> { where ( "estado = 'A' " ) }
end
