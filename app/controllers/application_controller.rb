class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :search

  def search
  	@search = Product.search(params[:q])
  end
end
