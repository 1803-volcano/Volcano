class CartsController < ApplicationController

 def create
 	@cart = Cart.new(cart_params)
 	@cart.user_id = current_user.id
 	@cart.save
 end

 def show
 end

 def select
 end

 def confirm
 end

 def purchase
 end

 def complete
 end

private

 def cart_params
 	params.require(:cart).permit(:user_id)
 end

end
