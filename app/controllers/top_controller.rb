class TopController < ApplicationController

 def show
 	@recommends = Product.order("RANDOM()").limit(8) ##ランダム１０件取得
 	@commites = Browsing.last(10) ##最新１０件取得
 end

end

