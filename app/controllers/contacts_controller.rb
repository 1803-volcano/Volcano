class ContactsController < ApplicationController
  def new
      #@contact = Contact.new
      @contact = Contact.new
  end

  def create
  		@contact = Contact.new(contact_params)
      @contact.user_id = current_user.id
       @contact.save
       redirect_to mypage_user_path
  end

  def show
  		@contact = Contact.find(params[:id])
  end

  def index
      #@contacts = Contact.where(user_id: current_user.id).all
      @contacts =Contact.where(user_id: current_user.id)
  end


  private

  def contact_params
  	  params.require(:contact).permit(:title, :body)
  end
end
