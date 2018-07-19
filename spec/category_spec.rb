require('spec_helper')

describe(Category) do
  it { should have_and_belong_to_many(:recipes)}
  it "creates the relationship of a category to a recipe" do
    category = Category.create({:name => "emotional eating"})
    recipe = Recipe.create({:name => 'cookie dough'})
    category.recipes.push(recipe)
    expect(category.recipes).to(eq([recipe]))
  end

  it "deletes the category and all recipes association" do
    category = Category.create({:name => "emotional eating"})
    recipe = Recipe.create({:name => 'cookie dough'})
    category.recipes.push(recipe)
    category.destroy
    expect(category.recipes).to(eq([]))
  end
end
