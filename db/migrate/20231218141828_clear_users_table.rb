class ClearUsersTable < ActiveRecord::Migration[7.0]
  def up
    User.delete_all
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
