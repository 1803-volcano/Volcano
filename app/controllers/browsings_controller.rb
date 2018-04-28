class BrowsingsController < ApplicationController
        before_action :authenticate_user!

    def create
        product = Product.find(params[:product_id])
        browsing = current_user.browsings.new(product_id: product.id)
        browsing.save
        redirect_to product_path(product)
    end

    def destroy
        post_image = PostImage.find(params[:product_id])
        browsing = current_user.browsings.find_by(product_id: params[:product_id])
        browsing.destroy
        redirect_to product_path(product)
    end

end


