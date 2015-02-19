class AddCuentaRefToMovimiento < ActiveRecord::Migration
  def change
    add_reference :movimientos, :cuenta, index: true
    add_foreign_key :movimientos, :cuentas
  end
end
