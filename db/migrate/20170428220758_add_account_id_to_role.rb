class AddAccountIdToRole < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :account_id, :integer
  end
end
