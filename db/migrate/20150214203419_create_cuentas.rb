class CreateCuentas < ActiveRecord::Migration
  def change
    create_table :cuentas do |t|
      t.string :cuenta
      t.string :subcuenta1
      t.string :subcuenta2
      t.string :subcuenta3
      t.string :subcuenta4
      t.string :subcuenta5
      t.text :descripcion
      t.string :nombre
      t.string :estado
      t.string :tipo

      t.timestamps null: false
    end
  end
end
