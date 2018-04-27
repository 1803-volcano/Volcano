class TopController < ApplicationController

 def show
 	@nouveaus = Product.order(created_at: :desc).limit(8) ##最新アイテム８件取得
 	@recommends = Product.order("RANDOM()").limit(8) ##ランダム８件取得
 	@commites = Browsing.last(10) ##最新１０件取得
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

