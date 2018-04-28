class Admins::TopController < ApplicationController
    before_action :authenticate_admin!

 def show
 	@new_purchasers = Purchaser.limit(10).order("created_at DESC").where(status: "発送準備中")
 	@total = []
 	@product_first = []
 	@user_name = []
 	@new_purchasers.each do |pur|
 		count = Receipt.where(purchaser_id: pur.id).pluck(:sale)
 		first = Receipt.where(purchaser_id: pur.id).pluck(:product_id).first
 		product = Product.find(first)
 		user = User.find(pur.user_id)
 		namae = user.name_sei + user.name_mei
 		@total.push(count.sum)
 		@product_first.push(product.cd_title)
 		@user_name.push(namae)
 	end
 end

 def edit
 end

 def update
 end

end
