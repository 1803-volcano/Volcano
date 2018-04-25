
  belongs_to :product, optional: true
  has_many :tunes
  accepts_nested_attributes_for :tunes, allow_destroy: true #まとめて削除するため

end
