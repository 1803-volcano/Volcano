class UsersController < ApplicationController
     before_action :authenticate_user!

 def mypage
 end

 def show
 	@user = User.find(current_user.id)
 end

 def edit
 	@user = User.find(current_user.id)
 end

 def update
 	@user = User.find(params[:id])
 	@user.update(user_params)
 	redirect_to user_path(@user.id)
 end

 def unsubscribe
 	@user = User.find(params[:id])
 end

private

 def user_params
 	params.require(:user).permit(:email, :name_sei, :name_mei, :name_kana_sei, :name_kana_mei, :birthday, :sex, :postal_code, :region, :street, :phone, :credit_card, :customer_flg)
 end
end
