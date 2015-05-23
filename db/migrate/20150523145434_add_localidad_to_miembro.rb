class AddLocalidadToMiembro < ActiveRecord::Migration
  def change
    add_column :miembros, :localidad, :string
  end
end
