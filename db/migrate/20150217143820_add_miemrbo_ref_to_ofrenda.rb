class AddMiemrboRefToOfrenda < ActiveRecord::Migration
  def change
    add_reference :ofrendas, :miembro, index: true
    add_foreign_key :ofrendas, :miembros
  end
end
