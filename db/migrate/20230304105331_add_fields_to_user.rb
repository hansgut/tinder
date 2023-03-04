class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :datetime
    add_column :users, :sex, :string
    add_column :users, :description, :string
  end
end
