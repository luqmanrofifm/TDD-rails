require 'rails_helper'

RSpec.describe Food, type: :model do
  #it 'is invalid in nill category' do
  #  food = Food.new(
  #    name: 'Nasi Uduk',
  #    description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
  #    price: 15000.0
  #  )

  #  food.valid?

  #  expect(food.errors[:category_id]).to include("id cannot be null")
  #end

  #it 'is invalid in does not exist category' do
  #  food = Food.new(
  #    name: 'Nasi Uduk',
  #    description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
  #    price: 15000.0, 
  #    category_id: "1"
  #  )

  #  food.valid?

  #  expect(food.errors[:category_id]).to include("does not exist")
  #end
  
  it 'is valid with a name, a description and a category' do
    #Category.create(
    #  id: 1,
    #  name: 'main course'
    #)

    food = Food.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0 
      #category_id: '1'
    )

    expect(food).to be_valid
  end

  it 'is invalid without a name' do
    food = Food.new(
      name: nil,
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0
    )

    food.valid?

    expect(food.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    food1 = Food.create(
      name: "Nasi Uduk",
      description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
      price: 10000.0
    )
    
    food2 = Food.new(
      name: "Nasi Uduk",
      description: "Just with a different description.",
      price: 10000.0
    )

    food2.valid?
    
    expect(food2.errors[:name]).to include("has already been taken")
  end

  it 'is invalid if price is not a number' do
    food = Food.new(
      name: 'Serabi',
      description: 'Makanan khas solo',
      price: 'q'
    )

    food.valid?

    expect(food.errors[:price]).to include("is not a number")
  end

  it 'is invalid if price is less than 0.001' do
    food = Food.new(
      name: 'Soto Banjar',
      description: 'Makanan khas banjarmasin',
      price: 0.000000001
    )

    food.valid?

    expect(food.errors[:price]).to include("must be greater than 0.01")
  end

  describe 'self#by_letter' do
    it "should return a sorted array of results that match" do
      food1 = Food.create(
        name: "Nasi Uduk",
        description: "Betawi style steamed rice cooked in coconut milk. Delicious!",
        price: 10000.0
      )

      food2 = Food.create(
        name: "Kerak Telor",
        description: "Betawi traditional spicy omelette made from glutinous rice cooked with egg and served with serundeng.",
        price: 8000.0
      )

      food3 = Food.create(
        name: "Nasi Semur Jengkol",
        description: "Based on dongfruit, this menu promises a unique and delicious taste with a small hint of bitterness.",
        price: 8000.0
      )

      expect(Food.by_letter("N")).to eq([food3, food1])
    end
  end
end