class Purchaser < ApplicationRecord

  belong_to :user
  has_many :receipts
end
