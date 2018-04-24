class Admins::PurchasersController < ApplicationController

 def index
 	@purchasers = Purchaser.all

 end

 def show
 	@purchaser = Purchaser.find(params[:id])
	@receipts = Receipt.where(purchaser_id: params[:id])

 end

 def update
 end

end
