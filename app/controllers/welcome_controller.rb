class WelcomeController < ApplicationController
	def index
		@index_products = Product.all 
		@products = Product.search(params[:search])
	end

end
