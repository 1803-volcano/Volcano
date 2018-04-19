class Product < ApplicationRecord

  has_many :cart_items
  has_many :discs
  has_many :receipts
  has_many :browsings
  has_many :favorites
  accepts_nested_attributes_for :discs

  attachment :picture
end
