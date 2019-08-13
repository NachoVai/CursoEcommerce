class ChangeColumnPermissionLevel < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :permission_level, :integer, default: 0
  end
end
