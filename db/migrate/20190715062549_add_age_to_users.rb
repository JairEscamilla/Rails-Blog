class AddAgeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :int, default: 0
  end
end
