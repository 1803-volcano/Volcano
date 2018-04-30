class PurchasersController < ApplicationController
    before_action :authenticate_user!

 def index
 	@purchasers = Purchaser.where(user_id: current_user.id).all
 	@purchasers = @purchasers.page(params[:page])
 end

 def show
 	@purchaser = Purchaser.find(params[:id])
 	@receipts = Receipt.where(purchaser_id: params[:id])
 end

end
