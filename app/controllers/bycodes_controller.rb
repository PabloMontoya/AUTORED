class BycodesController < ApplicationController
  respond_to :json

  def index
  
    @products = Product.select("productos.cod_prod, productos.descripcion, lp.nombre as linea, se.nombre as sistema, 
                                me.nombre as marca, mode.nombre as modelo, ae.año_equipos as anhio, esta.nombre as establecimiento ,
                                sum(pres.exist_unidades) as existencia")
                       .joins("INNER JOIN lineas_productos  lp    ON lp.linea_producto  = productos.linea_producto
                               INNER JOIN sistemas_equipos  se    ON se.sistema_equipos = productos.sistema_equipos 
                               INNER JOIN productos_equipos pe    ON pe.cod_prod        = productos.cod_prod 
                               INNER JOIN marcas_equipos    me    ON me.marca_equipos   = pe.marca_equipos
                               INNER JOIN modelos_equipos   mode  ON pe.marca_equipos   = mode.marca_equipos AND mode.modelo_equipos = pe.modelo_equipos
                               INNER JOIN años_equipos      ae    ON pe.año_equipos     = ae.año_equipos
                               INNER JOIN prodestab         pres  ON pres.cod_prod      = productos.cod_prod
                               INNER JOIN establecimientos  esta  ON esta.cod_estab     = pres.cod_estab")
                       .group("productos.cod_prod, productos.descripcion, lp.nombre, se.nombre, me.nombre, mode.nombre, ae.año_equipos, esta.nombre,
                               sum(pres.exist_unidades)")
                       .having("productos.cod_prod = ?", params[:cod_prod])
                       
    respond_with(@products)
  end
  
end