class CreateEfectivos < ActiveRecord::Migration
  def change
    create_table :efectivos do |t|
      t.date :fecha
      t.decimal :Pesos2
      t.decimal :Pesos5
      t.decimal :Pesos10
      t.decimal :Pesos20
      t.decimal :Pesos50
      t.decimal :Pesos100
      t.decimal :PesosMonedas
      t.decimal :Dolares1
      t.decimal :Dolares2
      t.decimal :Dolares5
      t.decimal :Dolares10
      t.decimal :Dolares20
      t.decimal :Dolares50
      t.decimal :Dolares100
      t.decimal :DolaresMonedas

      t.timestamps null: false
    end
  end
end
