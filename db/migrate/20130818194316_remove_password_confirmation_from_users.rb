class RemovePasswordConfirmationFromUsers < ActiveRecord::Migration
  def up
  end

  def down
    remove_column(:users, :password_confirmation)
  end
end
