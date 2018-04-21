class FavoritesController < ApplicationController

 def index
    @favorites = Favorite.where(user_id: current_user.id).all
 end

 def create
    @user_id = current_user.id
    @product_id = Product.find(params[:id]).id
    @favorite = Favorite.new(product_id: @product_id, user_id: @user_id)

    @favorite.save
    redirect_to favorites_path(current_user)
 end

 def destroy
    @favorite = Favorite.find(params[:id])

    if @favorite.destroy
      redirect_to user_path(current_user)
    end
 end

end
