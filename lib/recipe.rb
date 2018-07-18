class Recipe < ActiveRecord::Base
  has_many :ingredients, through: :instructions
  has_many :categories, through: :categories_recipes
end
