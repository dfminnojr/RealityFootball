class AddStatusToWagers < ActiveRecord::Migration
  def change
    add_column :wagers, :status, :string
  end
end
