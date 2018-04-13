class Disc < ApplicationRecord

  belong_to :product
  has_many :tunes
end
