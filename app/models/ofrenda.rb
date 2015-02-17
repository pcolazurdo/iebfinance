class Ofrenda < ActiveRecord::Base
  belongs_to :Cuenta
  belongs_to :Miembro
end
