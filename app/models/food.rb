class Food < ApplicationRecord
  belongs_to :category
  
  validates :name, presence: true, uniqueness: true

  validates :price, presence: true, numericality: { greater_than: 0.01 }


  #validate :validate_category

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end

  #def validate_category
  #  if (category_id == nil)
  #    errors.add(:category_id, "id cannot be null")
  #  else
  #    if (!Category.exists?(id: category_id))
  #      errors.add(:category_id, "does not exist")
  #    end
  #  end
  #end
end