class ProductsController < ApplicationController

 def index
 	# @search = Product.search(params[:q])
 	@products = @search.result
 	# @products = Product.page(params[:page]).reverse_order
 	#並び順も変えられる
 	@commites = Browsing.last(10) ##最新１０件取得
 end

 def show
 	@product = Product.find(params[:id])
 	@discs = Disc.where(product_id: params[:id])
 	@commites = Browsing.last(10) ##最新１０件取得
 end

end
