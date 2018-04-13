class Receipt < ApplicationRecord

  belongs_to :purchaser
  belongs_to :product
end
