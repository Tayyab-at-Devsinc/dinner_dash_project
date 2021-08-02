class Product < ApplicationRecord
  has_many :cats_prods_associations
  has_many :categories, through: :cats_prods_associations
  has_many :line_items, dependent: :destroy
  has_one_attached :image
end
