class ContactsController < ApplicationController
  def new
  		@contact = Contact.new
  end

  def create
  		contact = Contact.new(contact_params)
  		contact.save
  	   redirect_to contact_path(contact.id)
  end

  def show
  		@contact = Contact.find(params[:id])
  end

  def edit
  		@contact = Contact.find(params[:id])
  end

  def update
  	    @contact = contact.find(params[:id])
 	    @contact.update(con_params)
 	redirect_to user_path(@user.id)
  end



  private

  def contact_params
  	  params.require(:contact).permit(:title, :body, :email, :name_sei, :name_mei, :name_kana_sei, :name_kana_mei, :birthday, :sex, :postal_code, :region, :street, :phone)
  end
end
