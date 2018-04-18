class Admins::ProductsController < ApplicationController

 def index
 end

 def show
 end

 def new
 	@product = Product.new
 	@disc = Disc.new
 end

 def create
 	post = Product.new(product_params)
    product.save
    disc = Disc.new(disc_params)
    disc.save
    redirect_to admins_top_path(product.id)
 end

 def edit
 end

 def update
 end

 def list
 end

private
	def product_params
		params.require(:product).permit(:artist, :sound_source, :picture, :cd_title, :picture_id, :price, :label, :genre, :stock, :start_date)
	end


end


create_table "products", force: :cascade do |t|
    t.string "cd_title"
    t.string "artist"
    t.text "picture_id"
    t.text "sound_source"
    t.integer "price"
    t.string "label"
    t.string "genre"
    t.integer "stock"
    t.date "start_date"
    t.boolean "product_flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false










