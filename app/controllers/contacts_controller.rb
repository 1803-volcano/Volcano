class ContactsController < ApplicationController
  def new
      @contact = Contact.new(user_id: current_user.id)
  end

  def create
  		@contact = current_user.contacts.new(contact_params)
      @contact.save
      redirect_to mypage_user_path
  end

  def show
  		@contact = Contact.find(params[:id])
  end

  def index
      @contacts =Contact.where(user_id: current_user.id)
  end




  private

  def contact_params
  	  params.require(:contact).permit(:user_id, :title, :body)
  end
end
