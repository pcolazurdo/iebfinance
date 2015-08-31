class AddLockableToUsers < ActiveRecord::Migration
  def change
    add_column :examples, :failed_attempts, :integer, default: 0
    add_column :examples, :unlock_token, :string
    add_column :examples, :locked_at, :datetime
    # add_index :users, :unlock_token,         unique: true
  end
end
