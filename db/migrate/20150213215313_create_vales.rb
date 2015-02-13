class CreateVales < ActiveRecord::Migration
  def change
    create_table :vales do |t|
      t.string :cuenta
      t.string :responsable
      t.date :fechaEmision
      t.date :fechaRendicion
      t.string :estado
      t.decimal :montoPesos
      t.decimal :montoDolares
      t.text :comentario

      t.timestamps null: false
    end
  end
end
