class Favorite < ApplicationRecord

  validates :user_id, :uniqueness => {:scope => :product_id} #同じidを保存しない

  belongs_to :user
  belongs_to :product
end
