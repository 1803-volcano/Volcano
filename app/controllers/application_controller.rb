class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :search

  def search
  	@search = Product.search(params[:q])
  	@commites = Browsing.where(user_id: current_user.id).order("updated_at DESC").limit(10) if current_user.present?
  end

  def create_browsing
  	if current_user.present?
        product = Product.find(params[:id])
        browsing_all = Browsing.where(user_id: current_user.id)
        product_all = browsing_all.pluck(:product_id)
        if product_all.include?(product.id)
            browsing = browsing_all.find_by(product_id: product.id)
            browsing.updated_at = Time.now
            browsing.update(user_id: current_user.id)
        else
            browsing = current_user.browsings.new(product_id: product.id)
            browsing.save
        end
        #redirect_to product_path(product)
	end

  end
end
