class Product < ApplicationRecord

  has_many :cart_items
  has_many :discs
  has_many :receipts
  has_many :browsings, dependent: :destroy
  has_many :users, through: :browsings
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  accepts_nested_attributes_for :discs

  attachment :picture

  def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
  end
  def browsinged_by?(user)
        browsings.where(user_id: user.id).exists?
  end
end
