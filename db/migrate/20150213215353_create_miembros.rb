class CreateMiembros < ActiveRecord::Migration
  def change
    create_table :miembros do |t|
      t.string :idFiscal
      t.string :nombre
      t.string :estado
      t.string :tipo
      t.string :email
      t.string :direccion

      t.timestamps null: false
    end
  end
end
