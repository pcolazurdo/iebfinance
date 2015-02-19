class CreateMovimientos < ActiveRecord::Migration
  def change
    create_table :movimientos do |t|
      t.date :fecha
      t.decimal :IngresoPesos
      t.decimal :IngresoDolares
      t.decimal :EgresoPesos
      t.decimal :EgresoDolares
      t.string :Comprobante
      t.text :comentario

      t.timestamps null: false
    end
  end
end
