class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user # Campo adicional    
    has_many :has_categories
    has_many :categories, through: :has_categories
end
