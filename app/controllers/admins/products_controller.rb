class Admins::ProductsController < ApplicationController

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


 def new
 	@product = Product.new
 	@disc = Disc.new
 	@tune = Tune.new
 end

 def create
 	@product = Product.new(product_params)
    @disc = @product.discs.build(disc_params)
    @tune = @disc.tunes.build(tune_params)
    @product.save
    @disc.save
    @tune.save
    redirect_to admins_top_path(current_admin.id)
 end

 def edit
 	@product = Product.find(params[:id])
 end

 def update
 end

 def list
 end

private
	def product_params
		params.require(:product).permit(:artist, :sound_source, :picture, :cd_title, :picture_id, :price, :label, :genre, :stock, :start_date)
	end

	def disc_params
		params.require(:disc).permit(:disc_name)
	end

	def tune_params
		params.require(:tune).permit(:song_title)
	end

end



