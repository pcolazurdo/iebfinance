class AddCuentaRefToOfrenda < ActiveRecord::Migration
  def change
    add_reference :ofrendas, :cuenta, index: true
    add_foreign_key :ofrendas, :cuentas
  end
end
