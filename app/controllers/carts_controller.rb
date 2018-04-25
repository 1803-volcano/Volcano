class CartsController < ApplicationController
#before_action :authenticate_user!
	before_action :create, only:[:show]
	#showとcompleteの前にカートを作る
	protect_from_forgery except: :purchase
	#外部からのリクエストをはじくみたいなのでpurchaseアクションを除外してあげる
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
 	@item_count = @cart_items.count
 	@commites = Browsing.last(10) ##最新１０件取得
 end

 def select
 	@quantity = params[:quantity]
 	@commites = Browsing.last(10) ##最新１０件取得
 end

 def confirm
 	cart = Cart.where(user_id: current_user.id).last
 	@cart_items = CartItem.where(cart_id: cart.id)
 	#個数
 	@quantity = params[:quantity]
 	#送付先
 	@commites = Browsing.last(10) ##最新１０件取得
 	if params[:destination] == "exist"
 		@name = current_user.name_sei + current_user.name_mei
 		@postal_code = current_user.postal_code
 		@region = current_user.region
 		@street = current_user.street
 	elsif params[:destination] == "new"
 		@name = params[:name]
 		@postal_code = params[:postal_code]
 		@region = params[:region]
 		@street = params[:street]
 	end
 	#支払い方法
 	if params[:pay] == "cash"
 		@pay = "代金引換"
 	elsif params[:pay] == "credit"
 		@pay = "クレジットカードでお支払い"
 	end
 end

 def purchase
 	purchaser = current_user.purchasers.new#(purchaser_params)
 	#purchaser = Purchaser.new
 	#purchaser.user_id = current_user.id
 	purchaser.p_code = params[:postal_code]#postal_codeはstring型
 	purchaser.d_name = params[:name]
 	purchaser.d_region = params[:region]
 	purchaser.d_street = params[:street]
 	purchaser.pay = params[:pay]
 	purchaser.status = "発送準備中"
 	purchaser.save

 	params[:quantity].zip(params[:subtotal], params[:product]).each do |quantity, subtotal, product|
 		receipt = purchaser.receipts.build#(receipt_params)
 		receipt.sale = quantity.to_i
 		receipt.sale_price = subtotal.to_i
 		receipt.product_id = product.to_i
 		receipt.save
 	end

	cart = current_user.carts.build
	cart.save

 	redirect_to complete_cart_path
 end

 def complete
 	@commites = Browsing.last(10) ##最新１０件取得
 end

private

 # def cart_params
 # 	params.require(:cart).permit(:user_id)
 # end

 def purchaser_params
 	params.require(:purchaser).permit(:p_code, :d_name, :d_region, :d_street, :pay, :status)
 end

  def receipt_params
 	params.require(:receipt).permit(:sale, :sale_price, :product_id)
 end

end
