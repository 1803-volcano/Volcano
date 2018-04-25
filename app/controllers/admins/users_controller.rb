class Admins::UsersController < ApplicationController

 def index
 	@users = User.all
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
 	redirect_to admins_users_path(admin_id: current_admin.id, user_id: @user.id)

 end

 def delete
 end

 private

 def user_params
 	params.require(:user).permit(:email, :name_sei, :name_mei, :name_kana_sei, :name_kana_mei, :birthday, :sex, :postal_code, :region, :street, :phone, :credit_card, :customer_flg)
 end

end
