class AddCuentaRefToVale < ActiveRecord::Migration
  def change
    add_reference :vales, :cuenta, index: true
    add_foreign_key :vales, :cuenta
  end
end
