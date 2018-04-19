class Disc < ApplicationRecord

  belongs_to :product
  has_many :tunes
  accepts_nested_attributes_for :tunes

end
