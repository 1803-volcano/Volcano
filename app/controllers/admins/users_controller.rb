class Admins::UsersController < ApplicationController
#before_action :authenticate_admin!

 def index
 	@search_user = User.search(params[:q])
 	@users = @search_user.result
 end

 def show
 	@user = User.find(params[:id])
 end

 def edit
 	@user = User.find(params[:id])
 end

 def update
 	@user = User.find(params[:id])
 	@user.update(user_params)
 	redirect_to admins_user_path(id: @user.id)

 end

 def delete
 end

 private

 def user_params
 	params.require(:user).permit(:email, :name_sei, :name_mei, :name_kana_sei, :name_kana_mei, :birthday, :sex, :postal_code, :region, :street, :phone, :credit_card, :customer_flg)
 end

end
