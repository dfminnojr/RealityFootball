class DropResponsesTable < ActiveRecord::Migration
  def up
    drop_table :responses
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
