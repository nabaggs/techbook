class AddSchoolToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :school, :string
  end
end
