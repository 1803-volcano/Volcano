class ProductsController < ApplicationController

 def index
 	@products = Product.page(params[:page]).reverse_order
 	#並び順も変えられる
 end

 def show
 	@product = Product.find(params[:id])
 	# @discs = Disc.where(product_id: params[:id]).pluck(:id)
 end

end
