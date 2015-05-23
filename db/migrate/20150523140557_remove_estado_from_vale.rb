class RemoveEstadoFromVale < ActiveRecord::Migration
  def change
    remove_column :vales, :estado, :string
  end
end
