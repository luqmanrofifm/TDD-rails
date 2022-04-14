require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with a name' do
    
    category = Category.new(
      name: 'Main course'
    )

    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category = Category.new(
      name: nil
    )

    category.valid?

    expect(category.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    category1 = Category.create(
      name: "dessert"
    )
    
    category2 = Category.new(
      name: "dessert"
    )

    category2.valid?
    
    expect(category2.errors[:name]).to include("has already been taken")
  end

  it 'is invalid when length of name less than 4' do
    category = Category.new(
      name: "abc"
    )

    category.valid?

    expect(category.errors[:name]).to include("is too short (minimum is 4 characters)")
  end
end
