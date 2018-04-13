class Product < ApplicationRecord

  has_many :cart_items
  has_many :discs
  has_many :receipts
  #has_many :browsings
  #has_many :favorites
end
