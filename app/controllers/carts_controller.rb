class CartsController < ApplicationController
	before_action :create, only:[:show]
	#completeの前にカートを作るアクションを追加する！！！！！
 def create
 	if cart = Cart.where(user_id: current_user.id).last
 		@cart = cart
 	else
	 	@cart = current_user.carts.build #userと関連付け
	 	@cart.save
	end
 end

 def show
 	# @cart = Cart.where(user_id: current_user.id).last
 	@cart_items = CartItem.where(cart_id: @cart.id)
 end

 def select
 	@quantity = params[:quantity]
 end

 def confirm
 end

 def purchase
 end

 def complete
 end

private

 # def cart_params
 # 	params.require(:cart).permit(:user_id)
 # end

end
