class FavoritesController < ApplicationController

 def index
    @favorites = Favorite.where(user_id: current_user.id).all
    @commites = Browsing.last(10) ##最新１０件取得
 end

 def create
    @user_id = current_user.id
    @product_id = Product.find(params[:id]).id
    @favorite = Favorite.new(product_id: @product_id, user_id: @user_id)

    @favorite.save
    redirect_back(fallback_location: root_path)##ページの再読み込み
 end

 def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
       redirect_back(fallback_location: root_path)
    end
 end

end
