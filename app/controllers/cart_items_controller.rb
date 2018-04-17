class CartItemsController < ApplicationController

 def create
 	product = Product.find(params[:product_id])
 	cart = Cart.where(user_id: current_user.id).last
 	existing_items = CartItem.where(cart_id: cart.id).pluck(:product_id)

 	if existing_items.any?{ |w| w == product.id }　#すでにあるものかどうかの判断は、any?で行う
 		redirect_to cart_path(cart)
 	else
	 	@cart_item = product.cart_items.build(cart_id: cart.id)
	 	@cart_item.save
	 	redirect_to cart_path(cart)
 	end
 end

 def destroy
 	cart_item = CartItem.find_by(id: params[:id], product_id: params[:product_id], cart_id: params[:cart_id])
 	cart_item.destroy
 	redirect_to cart_path(params[:cart_id])
 	#中間テーブルの削除には、すべてのidが欲しいみたいだ
 end

 private

 # def cart_item_params
 # 	params.require(:cart_item).permit(:id, :cart_id, :product_id)
 # end

end
