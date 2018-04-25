class PurchasersController < ApplicationController
 #before_action :authenticate_user!

 def index
 	@purchasers = Purchaser.where(user_id: current_user.id).all
 	@commites = Browsing.last(10) ##最新１０件取得
 end

 def show
 	@purchaser = Purchaser.find(params[:id])
 	@receipts = Receipt.where(purchaser_id: params[:id])
 	@commites = Browsing.last(10) ##最新１０件取得
 end

end
