class TopController < ApplicationController
 def show
 	@nouveaus = Product.order(start_date: :desc).limit(8) ##最新アイテム８件取得
 	@recommends = Product.order("RANDOM()").limit(8) ##ランダム８件取得
 end

 def cantact
 end

 def about
 end

 def genre
 end

 def company
 end

end

