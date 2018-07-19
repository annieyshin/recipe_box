require 'spec_helper'

describe(Ingredient) do
  it { should have_many(:recipes)}

  it { should validate_uniqueness_of(:name)}
end
