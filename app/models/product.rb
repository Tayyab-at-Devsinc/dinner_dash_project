class Product < ApplicationRecord
  has_many :cats_prods_associations, dependent: :destroy
  has_many :categories, through: :cats_prods_associations
  has_many :line_items, dependent: :destroy
  has_one_attached :image
  validates :title, :description, :price, presence: true
  validates :categories, presence: { message: ': Atleast one category must be selected' }
  validates :title, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
end
