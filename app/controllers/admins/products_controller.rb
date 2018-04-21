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
 	#product
    product = Product.new(product_params)
    product.cd_title = params[:cd_title]
    product.artist = params[:artist]
    product.picture = params[:picture]
    product.label = params[:label]
    product.genre = params[:genre]
    product.price = params[:price]
    product.start_date = params[:start_date]
    product.save

    #disc
    params[:disc_name].each do |name|
        disc = product.discs.build(disc_params)
        disc.disc_name = name
        disc.save
        num.push(disc)#配列としてdiscを順に持たせる
    end

    #tune
    order = 1
    params[:song_title].zip(params[:song_time], num ).each do |title, time, discn|
        tune = discn.tunes.build(tune_params)
        tune.song_title = title
        tune.song_time = time
        tune.order = order
        tune.save
        order += 1
    end








  #@product = Product.new(product_params)
    #@disc = @product.discs.build(disc_params)
    #@tune = @disc.tunes.build(tune_params)
    #@product.save
    #@disc.save
    #@tune.save
    redirect_to admins_top_path(current_admin.id)
 end

 def edit
 	@product = Product.find(params[:id])
 end

 def update
 	product = Product.find(params[:id])
    disc = @product.discs.build(disc_params)
    tune = @disc.tunes.build(tune_params)
    product.update(product_params)
    disc.update(product.discs_params)
    tune.update(disc.tunes_params)
    redirect_to admins_top_path(current_admin.id)
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



