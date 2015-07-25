class ProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sex, :integer
    add_column :users, :country, :string
    add_column :users, :age, :integer
  end
end
