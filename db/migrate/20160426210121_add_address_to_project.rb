class AddAddressToProject < ActiveRecord::Migration
  def change
    add_column :projects, :address1, :string
    add_column :projects, :address2, :string
    add_column :projects, :city, :string
    add_column :projects, :state, :string
    add_column :projects, :zip_code, :string
    add_column :projects, :contact, :string
    add_column :projects, :contact_phone, :string
  end
end
