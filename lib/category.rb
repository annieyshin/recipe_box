class Category < ActiveRecord::Base
  has_many :recipes, through: :categories_recipes
end
