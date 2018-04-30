class ProductsController < ApplicationController

 before_action :create_browsing, only:[:show]

 def index
 	# @search = Product.search(params[:q])
 	products = @search.result# && Product.true #検索かつフラグtrueのデータ 検索機能が無効にされるので修正
 	@products = products.where(product_flg: true)
 	@products = @products.page(params[:page])
 end

 def show
 	@product = Product.find(params[:id])
 	@discs = Disc.where(product_id: params[:id])
 end

end
