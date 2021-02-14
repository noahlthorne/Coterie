class RemoveOrganizationIdFrom < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :organization_id, :index
  end
end
