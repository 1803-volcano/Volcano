class Admins::ProductsController < ApplicationController
    protect_from_forgery except: :create

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
 	@product = Product.new#refileを使用するため strongparamsに反応するようにするため

    #検証
    # @cd_title = params[:cd_title]
    # @disc = params[:disc]
    # @disc_name = @disc["0"]["disc_name"]
    # @song_title =@disc["0"]["song"]["0"]["song_title"]
    # @song_time = @disc["0"]["song"]["0"]["song_time"]

 end

 def create
    @product = Product.new(product_params)
    @product.cd_title = params[:cd_title]
    @product.artist = params[:artist]
    @product.picture_id = params[:picture]
    @product.label = params[:label]
    @product.genre = params[:genre]
    @product.price = params[:price]
    @product.start_date = params[:start_date]
    @product.sound_source = params[:sound_source]
    @product.stock = params[:stock]
    @product.product_flg = true
    @product.save

    #disc
    #num = 0
    params[:disc].each do |key, name|#ハッシュだから、キーと値の両方になる キーに"0"値に"disc_name"と"song"の集合体が入る
        disc = @product.discs.build
        disc.disc_name = name["disc_name"]#disc_nameを指定する
        disc.save

        #tune
        order = 1
        songs = name["song"]
        songs.each do |keyn, song|#keynに"0"値に"song_title"と"song_time"の集合体が入る
            tune = disc.tunes.build
            tune.song_title = song["song_title"]
            tune.song_time = song["song_time"]
            tune.order = order
            tune.save
            order += 1
        end
    end
    redirect_to product_path(@product)
    #redirect_to admins_top_path(current_admin.id)
 end



 def edit
 	@product = Product.find(params[:id])
 end

 def update
    @product = Product.find(params[:id])
    if @product.update(product_params)#データがあるか否かで書き分け
        redirect_to admins_products_path(admin_id: current_admin.id, product_id: @product.id)
    else
        render :edit
    end
 end

 def destroy
 end

#親子関係を明示するため、以下のように記載。
#accepts_nested_attributes_for時のkeyは"属性名_attributes"となる。
private
    def product_params
        params.require(:product).permit(
        :artist,
        :sound_source,
        :picture,
        :cd_title,
        :picture_id,
        :price,
        :label,
        :genre,
        :stock,
        :start_date,
        :product_flg,
        :_destroy,{
            discs_attributes:[
            :id,
            :product_id,
            :disc_name,
            :_destroy,{
                    tunes_attributes:[
                    :id,
                    :disc_id,
                    :song_title,
                    :song_time,
                    :_destroy
                    ]
                }
            ]
        }
    )
    end
end
















