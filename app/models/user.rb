class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :purchasers
  has_many :browsings, dependent: :destroy #関連付くイベントが削除されると中間テーブルも削除される
  has_many :products, through: :browsings #中間テーブルの紐付け先を呼び出す
  has_many :favorites, dependent: :destroy #関連付くイベントが削除されると中間テーブルも削除される
  has_many :products, through: :favorites #中間テーブルの紐付け先を呼び出す

end
