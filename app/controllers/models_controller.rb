class ModelsController < ApplicationController
  respond_to :json

  def index
	@modelos = Model.select("modelos_equipos.nombre as modelo")
				    .where("me.nombre = ?", params[:marca_equipos])
	                .joins("INNER JOIN marcas_equipos me ON me.marca_equipos = modelos_equipos.marca_equipos")

    respond_with(@modelos)
  end
  
end