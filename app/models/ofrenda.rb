class Ofrenda < ActiveRecord::Base
  belongs_to :Cuenta
  belongs_to :Miembro

  scope :dia, lambda { |fecha|
    where( 'fecha = ?', fecha )
  }
end
