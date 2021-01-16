class WelcomeController < ApplicationController
	def index
		# variaveis da função de busca
		@products = Product.all
		@categories = Category.all
		@comerciantes = Comerciante.all

		# variaveis da função de listagem da home
		@comerciante = Comerciante.all.pluck(:id, :nome).to_h
		@index_products = Product.all
		@products = Product.search(params[:search])
	end
end
