class ProductsController < ApplicationController

 def index
 	# @search = Product.search(params[:q])
 	@products = @search.result
 	# @products = Product.page(params[:page]).reverse_order
 	#並び順も変えられる
 end

 def show
 	@product = Product.find(params[:id])
 	@discs = Disc.where(product_id: params[:id])
 end

end
