class Admins::UsersController < ApplicationController

 def index
 	@users = User.all
 end

 def show
 end

 def delete
 end

end
