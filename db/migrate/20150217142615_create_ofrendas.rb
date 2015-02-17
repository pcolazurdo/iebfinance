class CreateOfrendas < ActiveRecord::Migration
  def change
    create_table :ofrendas do |t|
      t.date :fecha
      t.decimal :montoPesos
      t.decimal :montoDolares
      t.boolean :esCheque
      t.string :idcheque
      t.text :comentario

      t.timestamps null: false
    end
  end
end
