class AddVisitsToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :visits, :integer, default: 0
  end
end
