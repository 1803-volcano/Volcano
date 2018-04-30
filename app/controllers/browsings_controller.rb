class BrowsingsController < ApplicationController
        before_action :authenticate_user!

    def create
        product = Product.find(params[:product_id])
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
        redirect_to product_path(product)
    end

    def destroy
        post_image = PostImage.find(params[:product_id])
        browsing = current_user.browsings.find_by(product_id: params[:product_id])
        browsing.destroy
        redirect_to product_path(product)
    end

end


