class YearsController < ApplicationController
  respond_to :json

  def index
	@anhios = Year.select("años_equipos.año_equipos as anhio")
                  .where("me.nombre = ?", params[:modelo_equipos])
	              .joins("INNER JOIN productos_equipos pe ON años_equipos.año_equipos = pe.año_equipos
	              	      INNER JOIN modelos_equipos   me ON pe.modelo_equipos        = me.modelo_equipos").distinct

    respond_with(@anhios)
  end
  
end