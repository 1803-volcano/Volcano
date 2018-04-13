class Receipt < ApplicationRecord

  belong_to :purchaser
  belong_to :product
end
