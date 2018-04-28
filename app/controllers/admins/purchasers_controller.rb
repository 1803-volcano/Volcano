class Admins::PurchasersController < ApplicationController
    before_action :authenticate_admin!

	protect_from_forgery except: :update

 def index
 	@search_purchaser = Purchaser.search(params[:q])
 	@purchasers = @search_purchaser.result
 	@purchasers = @purchasers.page(params[:page])
 end

 def show
 	@purchaser = Purchaser.find(params[:id])
	@receipts = Receipt.where(purchaser_id: params[:id])
 end

 def update
 	purchaser = Purchaser.find(params[:id])
 	purchaser.update(purchaser_params)
 	redirect_to admins_purchaser_path(purchaser)
 end

private

 def purchaser_params
 	params.require(:purchaser).permit(:p_code, :d_name, :d_region, :d_street, :pay, :status)
 end
end
