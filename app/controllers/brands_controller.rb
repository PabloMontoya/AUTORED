class BrandsController < ApplicationController
  respond_to :json

  def index
	@marcas = Brand.select("nombre as marca")

    respond_with(@marcas)
  end
  
end