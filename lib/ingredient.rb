class Ingredient < ActiveRecord::Base
  has_many :recipes
  has_many :categories, through :recipes
end
