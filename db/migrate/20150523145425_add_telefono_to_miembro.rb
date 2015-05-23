class AddTelefonoToMiembro < ActiveRecord::Migration
  def change
    add_column :miembros, :telefono, :string
  end
end
