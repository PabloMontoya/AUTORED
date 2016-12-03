# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "Analog", force: :cascade do |t|
    t.char "cod_prod", limit: 13, null: false
  end

  create_table "AndroidWS_Localizacion", force: :cascade do |t|
    t.datetime "fecha",               null: false
    t.varchar  "usuario",  limit: 50, null: false
    t.varchar  "cliente",  limit: 50, null: false
    t.float    "latitud",             null: false
    t.float    "longitud",            null: false
  end

  create_table "Areas", primary_key: "area", force: :cascade do |t|
    t.varchar "nombre",      limit: 50,                                                                                                                   null: false
    t.char    "abreviatura", limit: 5,                                                                                                                    null: false
    t.char    "status",      limit: 5,                                                                                                                    null: false
    t.char    "jerarquia",   limit: 100, default: "                                                                                                    ", null: false
    t.char    "uso",         limit: 1,   default: " ",                                                                                                    null: false
  end

  create_table "Asignaciones_cajeros", primary_key: "Folio", force: :cascade do |t|
    t.datetime "fecha",                                                  null: false
    t.char     "cajero",                     limit: 5,                   null: false
    t.char     "caja",                       limit: 5,                   null: false
    t.char     "cod_estab",                  limit: 5,                   null: false
    t.char     "usuario",                    limit: 5,                   null: false
    t.integer  "folio_deposito",             limit: 1,   default: 1,     null: false
    t.integer  "folio_retiro",               limit: 4,   default: 1,     null: false
    t.char     "status",                     limit: 1,   default: "V",   null: false
    t.datetime "ultima_modificacion",                                    null: false
    t.boolean  "incluye_tickets_cancelados",             default: true,  null: false
    t.boolean  "liquidacion_modificada",                 default: false, null: false
    t.datetime "fecha_inicial",                                          null: false
    t.datetime "fecha_final",                                            null: false
    t.varchar  "notas",                      limit: 200
    t.datetime "fecha_liquidacion"
  end

  add_index "Asignaciones_cajeros", ["fecha"], name: "fecha"

  create_table "Back_order_fecha", id: false, force: :cascade do |t|
    t.char    "cod_prod",             limit: 13,                           null: false
    t.char    "familia",              limit: 5,                            null: false
    t.char    "nombre",               limit: 30
    t.varchar "descripcion_completa", limit: 150,                          null: false
    t.decimal "autorizado",                       precision: 38, scale: 4
    t.decimal "facturado",                        precision: 38, scale: 4
    t.decimal "pendiente",                        precision: 38, scale: 4
    t.decimal "importe_pendiente",                precision: 38, scale: 6
  end

  create_table "CantDistAnalogo", id: false, force: :cascade do |t|
    t.char    "cod_prod", limit: 13,                          null: false
    t.decimal "cantidad",            precision: 18, scale: 3, null: false
  end

  create_table "CapturaProd", id: false, force: :cascade do |t|
    t.char     "Usuario",  limit: 5,  null: false
    t.char     "Cajero",   limit: 5,  null: false
    t.char     "Cod_prod", limit: 13, null: false
    t.datetime "Fecha",               null: false
    t.boolean  "Propio",              null: false
  end

  create_table "DistribAnalogo", id: false, force: :cascade do |t|
    t.char    "Analogia",   limit: 10,                          null: false
    t.char    "Producto",   limit: 13,                          null: false
    t.decimal "Disponible",            precision: 18, scale: 4, null: false
    t.decimal "Asignado",              precision: 18, scale: 4, null: false
  end

  create_table "F319_TablaAux", id: false, force: :cascade do |t|
    t.char     "folio",                 limit: 10
    t.char     "cod_estab",             limit: 5
    t.char     "tipo_poliza",           limit: 5
    t.char     "cuenta_contable",       limit: 5
    t.char     "subcuenta_contable",    limit: 5
    t.char     "subsubcuenta_contable", limit: 5
    t.varchar  "nombre_cuenta",         limit: 100
    t.varchar  "nombre_sub",            limit: 100
    t.varchar  "nombre_subsub",         limit: 100
    t.varchar  "concepto",              limit: 500
    t.money    "Cargos",                            precision: 19, scale: 4
    t.money    "Abonos",                            precision: 19, scale: 4
    t.datetime "fecha"
    t.varchar  "cheque",                limit: 20
    t.char     "naturaleza",            limit: 1
    t.varchar  "referencia",            limit: 10
    t.varchar  "Nombre_estab",          limit: 50
    t.varchar  "concepto_poliza",       limit: 200
    t.char     "area",                  limit: 5
    t.char     "departamento",          limit: 5
    t.varchar  "nombre_area",           limit: 50
    t.varchar  "nombre_dpto",           limit: 50
    t.varchar  "nombre_beneficiario",   limit: 150
    t.money    "Saldo",                             precision: 19, scale: 4
    t.bigint   "id",                    limit: 8
    t.char     "Estab",                 limit: 5
    t.varchar  "Orden",                 limit: 30
    t.varchar  "nombre",                limit: 100
    t.varchar  "nombre_referencia",     limit: 500
    t.char     "cuentacompleta",        limit: 15
    t.datetime "fechaproceso"
    t.char     "status",                limit: 1
  end

  create_table "Formas_retiro", primary_key: "forma_retiro", force: :cascade do |t|
    t.char "nombre", limit: 30, null: false
  end

  create_table "Gestiones_002", id: false, force: :cascade do |t|
    t.char    "gestion",            limit: 10,                                         null: false
    t.char    "cod_prod",           limit: 13,                                         null: false
    t.varchar "descripcion",        limit: 100,                                        null: false
    t.char    "cod_estab",          limit: 5,                                          null: false
    t.decimal "existencia",                     precision: 19, scale: 4,               null: false
    t.decimal "no_disponible",                  precision: 19, scale: 4, default: 0.0, null: false
    t.decimal "mercancia_transito",             precision: 19, scale: 4,               null: false
    t.decimal "Total",                          precision: 21, scale: 4
    t.decimal "order_point",                    precision: 19, scale: 7,               null: false
    t.decimal "pvs",                            precision: 19, scale: 7,               null: false
    t.decimal "dias_inventario",                precision: 19, scale: 4,               null: false
  end

  create_table "Gestiones_003", id: false, force: :cascade do |t|
    t.char     "gestion",             limit: 10,                           null: false
    t.char     "cod_prv",             limit: 10,                           null: false
    t.varchar  "razon_social",        limit: 100,                          null: false
    t.char     "telefono",            limit: 15,                           null: false
    t.char     "cod_prod",            limit: 13,                           null: false
    t.varchar  "descripcion",         limit: 100,                          null: false
    t.char     "orden_compra",        limit: 10,                           null: false
    t.datetime "fecha",                                                    null: false
    t.integer  "te",                  limit: 2,                            null: false
    t.decimal  "cantidad_autorizada",             precision: 19, scale: 4, null: false
  end

  create_table "Gestiones_008", id: false, force: :cascade do |t|
    t.char    "gestion",                 limit: 10,                           null: false
    t.char    "codigo",                  limit: 13,                           null: false
    t.varchar "nombre",                  limit: 100,                          null: false
    t.money   "venta_perdida",                       precision: 19, scale: 4, null: false
    t.money   "contribucion",                        precision: 19, scale: 4, null: false
    t.decimal "porcentaje_contribucion",             precision: 19, scale: 4, null: false
    t.decimal "unidades",                            precision: 19, scale: 4, null: false
    t.decimal "peso",                                precision: 19, scale: 4, null: false
    t.decimal "volumen",                             precision: 19, scale: 4, null: false
  end

  create_table "Gestiones_009", id: false, force: :cascade do |t|
    t.char    "gestion",         limit: 10,                                             null: false
    t.char    "codigo",          limit: 13,                                             null: false
    t.varchar "nombre",          limit: 100,                                            null: false
    t.char    "cod_estab",       limit: 5,                            default: "     ", null: false
    t.decimal "unidades",                    precision: 19, scale: 4,                   null: false
    t.decimal "pvs",                         precision: 19, scale: 4,                   null: false
    t.decimal "dias_inventario",             precision: 19, scale: 4,                   null: false
    t.decimal "costo",                       precision: 19, scale: 4,                   null: false
    t.decimal "peso",                        precision: 19, scale: 4,                   null: false
    t.decimal "volumen",                     precision: 19, scale: 4,                   null: false
  end

  create_table "Gestiones_010", id: false, force: :cascade do |t|
    t.char     "gestion",             limit: 10,                           null: false
    t.char     "recepcion",           limit: 10,                           null: false
    t.datetime "fecha_recepcion",                                          null: false
    t.char     "pedido",              limit: 10,                           null: false
    t.datetime "fecha_pedido",                                             null: false
    t.char     "cod_prod",            limit: 13,                           null: false
    t.varchar  "descripcion",         limit: 100,                          null: false
    t.decimal  "cantidad_autorizada",             precision: 19, scale: 4, null: false
    t.decimal  "cantidad_recibida",               precision: 19, scale: 4, null: false
    t.decimal  "diferencia",                      precision: 19, scale: 4, null: false
  end

  create_table "Gestiones_013", id: false, force: :cascade do |t|
    t.char    "gestion",                 limit: 10,                           null: false
    t.char    "codigo",                  limit: 13,                           null: false
    t.varchar "nombre",                  limit: 100,                          null: false
    t.money   "venta",                               precision: 19, scale: 4, null: false
    t.money   "contribucion",                        precision: 19, scale: 4, null: false
    t.decimal "porcentaje_contribucion",             precision: 19, scale: 4, null: false
    t.decimal "unidades",                            precision: 19, scale: 4, null: false
    t.decimal "peso",                                precision: 19, scale: 4, null: false
    t.decimal "volumen",                             precision: 19, scale: 4, null: false
  end

  create_table "Hoja1$", id: false, force: :cascade do |t|
    t.string "0001",           limit: 255
    t.string "ARBOL DE LEVAS", limit: 255
  end

  create_table "Imagenes_imprimir", id: false, force: :cascade do |t|
    t.char   "codigo", limit: 1,    null: false
    t.string "imagen", limit: 4000, null: false
  end

  create_table "Mcapacitaciones_personal", primary_key: "folio", force: :cascade do |t|
    t.char    "empleado",     limit: 10,                          null: false
    t.decimal "calificacion",             precision: 9, scale: 3, null: false
    t.varchar "notas",        limit: 200,                         null: false
  end

  create_table "Mobile_Cobranza", id: false, force: :cascade do |t|
    t.string  "Pedido_Id",      limit: 50,                                                 null: false
    t.string  "Cliente_Id",     limit: 50,                                                 null: false
    t.string  "Fecha_Pedido",   limit: 50,                                                 null: false
    t.string  "Fecha_Entrega",  limit: 50,                          default: "",           null: false
    t.integer "Condicion_Pago", limit: 4,                                                  null: false
    t.money   "Saldo",                     precision: 19, scale: 4,                        null: false
    t.money   "Subtotal",                  precision: 19, scale: 4,                        null: false
    t.money   "IVA",                       precision: 19, scale: 4,                        null: false
    t.money   "Total",                     precision: 19, scale: 4,                        null: false
    t.integer "Status",         limit: 4,                                                  null: false
    t.string  "Firma",          limit: 50,                                                 null: false
    t.string  "Clave_IVA",      limit: 50,                                                 null: false
    t.integer "Plazo",          limit: 4,                                                  null: false
    t.char    "TipoDocumento",  limit: 10,                                                 null: false
    t.char    "vendedor_id",    limit: 10,                          default: "          ", null: false
    t.char    "ruta",           limit: 10,                          default: "          ", null: false
  end

  create_table "Mobile_Cobros", primary_key: "Id_cobro", force: :cascade do |t|
    t.string  "Pedido_Id",        limit: 50,                                        null: false
    t.string  "Cliente_Id",       limit: 50,                                        null: false
    t.integer "Ruta",             limit: 4,                                         null: false
    t.string  "Fecha",            limit: 50,                                        null: false
    t.string  "Fecha_Posfechado", limit: 50,                                        null: false
    t.money   "Monto",                       precision: 19, scale: 4,               null: false
    t.string  "Tipo_Captura",     limit: 50,                                        null: false
    t.char    "TipoDocumento",    limit: 10,                                        null: false
    t.char    "Firma",            limit: 50,                                        null: false
    t.char    "Forma_Pago",       limit: 5,                                         null: false
    t.char    "status_bms",       limit: 1,                           default: " ", null: false
  end

  create_table "Mobile_Lista", id: false, force: :cascade do |t|
    t.string "Productos_Id",          limit: 50,                                        null: false
    t.string "Lista",                 limit: 50,                                        null: false
    t.money  "Precio",                           precision: 19, scale: 4,               null: false
    t.money  "Precio_Cliente_Unidad",            precision: 19, scale: 4,               null: false
    t.money  "Precio_Cliente_Pieza",             precision: 19, scale: 4,               null: false
    t.char   "Tipo_Precio",           limit: 1,                           default: "1", null: false
  end

  create_table "Mobile_Mtipos_Respuestas", id: false, force: :cascade do |t|
    t.char "tipo_respuesta", limit: 2,  null: false
    t.char "opcion",         limit: 5,  null: false
    t.char "nombre",         limit: 20, null: false
  end

  create_table "Mobile_Pedido_d", id: false, force: :cascade do |t|
    t.string  "Pedido_Id",       limit: 50,                          null: false
    t.string  "Producto_Id",     limit: 50,                          null: false
    t.char    "IVA_Partida",     limit: 10,                          null: false
    t.integer "Partida",         limit: 4,                           null: false
    t.string  "Presentacion",    limit: 50,                          null: false
    t.integer "Cantidad",        limit: 4,                           null: false
    t.money   "Precio_Venta",               precision: 19, scale: 4, null: false
    t.money   "Importe_Partida",            precision: 19, scale: 4, null: false
    t.char    "Tipo_Precio",     limit: 5,                           null: false
  end

  create_table "Mobile_Pedido_g", primary_key: "Pedido_Id", force: :cascade do |t|
    t.string   "Cliente_Id",     limit: 50,                                       null: false
    t.char     "Ruta",           limit: 10,                                       null: false
    t.datetime "Fecha_Pedido",                                                    null: false
    t.datetime "Fecha_Entrega",                                                   null: false
    t.string   "Condicion_Pago", limit: 5,                                        null: false
    t.money    "Subtotal",                  precision: 19, scale: 4,              null: false
    t.money    "IVA",                       precision: 19, scale: 4,              null: false
    t.money    "Total",                     precision: 19, scale: 4,              null: false
    t.integer  "Plazo",          limit: 4,                                        null: false
    t.char     "Status",         limit: 5,                                        null: false
    t.string   "Tipo_Captura",   limit: 50,                                       null: false
    t.string   "Firma",          limit: 50,                                       null: false
    t.string   "Clave_IVA",      limit: 50,                                       null: false
    t.integer  "Secuencia",      limit: 4,                           default: 0,  null: false
    t.string   "Status_Bms",     limit: 1,                           default: "", null: false
  end

  create_table "Mobile_Preguntas", id: false, force: :cascade do |t|
    t.char    "pregunta",       limit: 5,  null: false
    t.varchar "nombre",         limit: 50, null: false
    t.char    "tipo_respuesta", limit: 2,  null: false
  end

  create_table "Mobile_Productos", id: false, force: :cascade do |t|
    t.string "ProductoId",  limit: 50, null: false
    t.string "Descripcion", limit: 50, null: false
    t.string "IVA_F",       limit: 50, null: false
    t.string "IVA_I",       limit: 50, null: false
    t.string "Zorder",      limit: 50, null: false
  end

  create_table "Mobile_RegVisitas", id: false, force: :cascade do |t|
    t.string   "Cliente_Id",   limit: 50, null: false
    t.integer  "Ruta",         limit: 4,  null: false
    t.datetime "Fecha",                   null: false
    t.string   "Hora_Llegada", limit: 50, null: false
    t.string   "Hora_Salida",  limit: 50, null: false
    t.integer  "Operacion",    limit: 4,  null: false
  end

  create_table "Mobile_Respuesta_Pregunta", id: false, force: :cascade do |t|
    t.char "Pregunta", limit: 5, null: false
    t.char "Opcion",   limit: 2, null: false
  end

  create_table "Mobile_Ruta", id: false, force: :cascade do |t|
    t.char    "Vendedor_id",    limit: 10,                                        null: false
    t.char    "Ruta",           limit: 10,                                        null: false
    t.string  "Cliente_Id",     limit: 50,                                        null: false
    t.string  "Nombre",         limit: 80,                                        null: false
    t.string  "Calle",          limit: 50,                                        null: false
    t.string  "Num_Ext",        limit: 50,                                        null: false
    t.string  "Num_Int",        limit: 50,                                        null: false
    t.string  "Colonia",        limit: 50,                                        null: false
    t.string  "Municipio",      limit: 50,                                        null: false
    t.string  "Telefono",       limit: 50,                                        null: false
    t.integer "Prioridad",      limit: 1,                                         null: false
    t.string  "Clave_IVA",      limit: 50,                                        null: false
    t.money   "Limite_Credito",            precision: 19, scale: 4,               null: false
    t.string  "Lista_Precio",   limit: 50,                                        null: false
    t.integer "Status",         limit: 2,                                         null: false
    t.char    "Condicion_Pago", limit: 5,                                         null: false
    t.char    "Dia_Visita",     limit: 1,                                         null: false
    t.char    "ordernombre",    limit: 1,                           default: " ", null: false
    t.char    "ordercalle",     limit: 1,                           default: " ", null: false
  end

  create_table "Mobile_Usuarios", id: false, force: :cascade do |t|
    t.string "Usuario_Id", limit: 10
    t.string "Password",   limit: 20
    t.char   "Ruta",       limit: 10
  end

  create_table "Mobile_bitacora_operaciones", primary_key: "ticks", force: :cascade do |t|
    t.char     "vendedor",            limit: 5,                    null: false
    t.char     "operacion",           limit: 2,                    null: false
    t.datetime "fecha",                                            null: false
    t.char     "status_operacion",    limit: 1,                    null: false
    t.char     "cod_cte",             limit: 10,                   null: false
    t.char     "razon",               limit: 5,                    null: false
    t.char     "transaccion_razon",   limit: 5,                    null: false
    t.char     "transaccion_cliente", limit: 5,  default: "5    ", null: false
  end

  create_table "Mobile_operaciones", primary_key: "operacion", force: :cascade do |t|
    t.varchar "nombre",      limit: 50, null: false
    t.char    "abreviatura", limit: 5,  null: false
    t.char    "status",      limit: 1,  null: false
  end

  create_table "Movimientos_cajeros", primary_key: "Folio_asignacion", force: :cascade do |t|
    t.integer  "Folio",                  limit: 4,                                            null: false
    t.char     "Tipo_movimiento_cajero", limit: 1,                                            null: false
    t.datetime "Fecha",                                                                       null: false
    t.decimal  "Importe",                          precision: 19, scale: 4,                   null: false
    t.char     "usuario",                limit: 5,                          default: "     ", null: false
    t.char     "usuario_recepcion",      limit: 5,                          default: "     ", null: false
    t.datetime "ultima_modificacion",                                                         null: false
  end

  add_index "Movimientos_cajeros", ["Folio_asignacion"], name: "folio_asignacion"

  create_table "Objetos_protegidos", id: false, force: :cascade do |t|
    t.varchar     "objeto",    limit: 124,        default: "",   null: false
    t.boolean     "protegido",                    default: true, null: false
    t.varchar_max "notas",     limit: 2147483647
  end

  create_table "Puestos_bolsa_trabajo", primary_key: "puesto_bolsa_trabajo", force: :cascade do |t|
    t.varchar "nombre",      limit: 50, null: false
    t.char    "abreviatura", limit: 5,  null: false
    t.char    "tipo_puesto", limit: 5,  null: false
    t.char    "status",      limit: 1,  null: false
  end

  create_table "Recibos_caja", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion",                limit: 5,                                                   null: false
    t.datetime "fecha",                                                                                  null: false
    t.char     "cod_cte",                    limit: 10,                                                  null: false
    t.money    "importe",                                precision: 19, scale: 4,                        null: false
    t.money    "iva",                                    precision: 19, scale: 4,                        null: false
    t.char     "folio_origen",               limit: 10,                                                  null: false
    t.char     "transaccion_origen",         limit: 5,                                                   null: false
    t.char     "cod_estab",                  limit: 5,                                                   null: false
    t.char     "usuario",                    limit: 5,                                                   null: false
    t.char     "usuario_cancelacion",        limit: 5
    t.datetime "fecha_cancelacion"
    t.char     "status",                     limit: 1,                                                   null: false
    t.varchar  "notas",                      limit: 100,                          default: "",           null: false
    t.char     "folio_aplicado",             limit: 10,                           default: "          ", null: false
    t.char     "transaccion_folio_aplicado", limit: 10,                           default: "          ", null: false
    t.money    "ieps",                                   precision: 19, scale: 4, default: 0.0,          null: false
    t.money    "total",                                  precision: 19, scale: 4
    t.char     "moneda",                     limit: 5,                            default: "1    ",      null: false
    t.decimal  "tipo_cambio",                            precision: 9,  scale: 4, default: 1.0,          null: false
  end

  add_index "Recibos_caja", ["fecha"], name: "fecha"
  add_index "Recibos_caja", ["folio"], name: "folio"
  add_index "Recibos_caja", ["folio_origen"], name: "folio_origen"

  create_table "SAClientes", id: false, force: :cascade do |t|
    t.char     "cod_cte",                               limit: 10,                           null: false
    t.varchar  "razon_social",                          limit: 120,                          null: false
    t.char     "clasificacion_fiscal",                  limit: 5,                            null: false
    t.char     "nombre",                                limit: 30,                           null: false
    t.char     "ap_materno",                            limit: 30,                           null: false
    t.char     "ap_paterno",                            limit: 30,                           null: false
    t.char     "nom_comercial",                         limit: 30,                           null: false
    t.varchar  "calle",                                 limit: 120,                          null: false
    t.char     "num_exterior",                          limit: 10,                           null: false
    t.char     "num_interior",                          limit: 10,                           null: false
    t.char     "colonia",                               limit: 30,                           null: false
    t.char     "cod_postal",                            limit: 6,                            null: false
    t.char     "delegacion",                            limit: 30,                           null: false
    t.char     "pobmunedo",                             limit: 50,                           null: false
    t.char     "cruce",                                 limit: 25,                           null: false
    t.char     "tel1",                                  limit: 25,                           null: false
    t.char     "tel2",                                  limit: 25,                           null: false
    t.char     "fax",                                   limit: 25,                           null: false
    t.char     "rfc",                                   limit: 20,                           null: false
    t.char     "reg_ieps",                              limit: 15,                           null: false
    t.char     "status_cliente",                        limit: 5,                            null: false
    t.char     "dia_visita",                            limit: 1,                            null: false
    t.integer  "orden_visita",                          limit: 2,                            null: false
    t.integer  "orden_embarque",                        limit: 2,                            null: false
    t.char     "mapa",                                  limit: 10,                           null: false
    t.integer  "coordenada_x",                          limit: 2,                            null: false
    t.integer  "coordenada_y",                          limit: 2,                            null: false
    t.char     "dia_revision",                          limit: 1,                            null: false
    t.char     "dia_pago",                              limit: 1,                            null: false
    t.char     "lista_precios",                         limit: 10,                           null: false
    t.char     "flexibilidad_precio_venta",             limit: 1,                            null: false
    t.datetime "fecha_alta",                                                                 null: false
    t.char     "clave_iva",                             limit: 5,                            null: false
    t.money    "limite_credito",                                    precision: 19, scale: 4, null: false
    t.integer  "tolerancia_limite_credito",             limit: 2,                            null: false
    t.integer  "plazo",                                 limit: 2,                            null: false
    t.integer  "tolerancia_plazo",                      limit: 2,                            null: false
    t.char     "sucursal",                              limit: 40,                           null: false
    t.boolean  "back_order",                                                                 null: false
    t.boolean  "productos_cliente_facturacion",                                              null: false
    t.boolean  "permite_mdf",                                                                null: false
    t.char     "autorizacion_pedido",                   limit: 1,                            null: false
    t.boolean  "multiestab",                                                                 null: false
    t.varchar  "notas",                                 limit: 500,                          null: false
    t.varchar  "pagina_web",                            limit: 100,                          null: false
    t.char     "vendedor",                              limit: 5,                            null: false
    t.char     "ruta_venta",                            limit: 5,                            null: false
    t.char     "ruta_reparto",                          limit: 5,                            null: false
    t.char     "condicion_pago",                        limit: 5,                            null: false
    t.char     "condicion_plazo",                       limit: 5,                            null: false
    t.char     "cod_estab",                             limit: 5,                            null: false
    t.char     "codigo_nuestro_cliente",                limit: 10,                           null: false
    t.char     "Moneda",                                limit: 5,                            null: false
    t.char     "pais",                                  limit: 5,                            null: false
    t.char     "estado",                                limit: 5,                            null: false
    t.char     "municipio",                             limit: 5,                            null: false
    t.char     "poblacion",                             limit: 5,                            null: false
    t.char     "clasificacion_cliente",                 limit: 5,                            null: false
    t.char     "giro",                                  limit: 5,                            null: false
    t.char     "tipo_cuenta_cobrar",                    limit: 5,                            null: false
    t.char     "corporativo",                           limit: 5,                            null: false
    t.char     "cadena",                                limit: 5,                            null: false
    t.char     "segmento",                              limit: 5,                            null: false
    t.char     "region",                                limit: 5,                            null: false
    t.char     "zona",                                  limit: 10,                           null: false
    t.char     "sector",                                limit: 10,                           null: false
    t.integer  "dias_transporte",                       limit: 1,                            null: false
    t.decimal  "variabilidad_dias_transporte",                      precision: 9,  scale: 4, null: false
    t.integer  "dias_estadia",                          limit: 1,                            null: false
    t.decimal  "variabilidad_dias_estadia",                         precision: 9,  scale: 4, null: false
    t.boolean  "firmas",                                                                     null: false
    t.char     "contrato_maniobras",                    limit: 10,                           null: false
    t.varchar  "e_mail",                                limit: 100,                          null: false
    t.datetime "ultima_modificacion",                                                        null: false
    t.decimal  "interes_diario_atraso",                             precision: 9,  scale: 4, null: false
    t.char     "colonia_codigo",                        limit: 10,                           null: false
    t.decimal  "descuento_maximo",                                  precision: 9,  scale: 4, null: false
    t.boolean  "recoge_mercancia",                                                           null: false
    t.char     "condicion_entrega_domicilio",           limit: 5,                            null: false
    t.integer  "dias_visita",                           limit: 2,                            null: false
    t.char     "cobrador",                              limit: 5,                            null: false
    t.char     "ruta_cobranza",                         limit: 5,                            null: false
    t.char     "curp",                                  limit: 18,                           null: false
    t.varchar  "certificado_comprobantes_electronicos", limit: 200,                          null: false
    t.boolean  "lista_multiple_producto",                                                    null: false
    t.integer  "uso_credito_operacion",                 limit: 1,                            null: false
    t.money    "maximo_por_factura",                                precision: 19, scale: 4, null: false
    t.varchar  "entre_calles",                          limit: 60,                           null: false
    t.varchar  "orientacion",                           limit: 10,                           null: false
    t.decimal  "enganche_minimo",                                   precision: 9,  scale: 4, null: false
    t.char     "ife",                                   limit: 20,                           null: false
    t.varchar  "referencia_ubicacion",                  limit: 400,                          null: false
    t.char     "repartidor",                            limit: 5,                            null: false
    t.char     "celular",                               limit: 25,                           null: false
    t.boolean  "facturacion_por_tasa",                                                       null: false
    t.char     "tipo_documento_venta",                  limit: 1,                            null: false
    t.integer  "maximo_operaciones_credito",            limit: 1,                            null: false
    t.datetime "fecha_baja",                                                                 null: false
  end

  create_table "SAProdPrv", id: false, force: :cascade do |t|
    t.char     "cod_prod",                       limit: 13,                          null: false
    t.char     "cod_prv",                        limit: 10,                          null: false
    t.boolean  "proveedor_principal",                                                null: false
    t.char     "cod_prod_proveedor",             limit: 30,                          null: false
    t.varchar  "descripcion_producto_proveedor", limit: 50,                          null: false
    t.datetime "fecha_ultima_recepcion",                                             null: false
    t.decimal  "cantidad_ultima_recepcion",                 precision: 19, scale: 4, null: false
    t.money    "ultimo_costo",                              precision: 19, scale: 4, null: false
    t.datetime "fecha_alta",                                                         null: false
    t.char     "manejo_devoluciones",            limit: 5,                           null: false
    t.char     "representante",                  limit: 10,                          null: false
    t.char     "status_producto",                limit: 5,                           null: false
    t.datetime "ultima_modificacion",                                                null: false
    t.char     "unidad",                         limit: 5,                           null: false
    t.decimal  "factor_conversion",                         precision: 9,  scale: 4, null: false
    t.decimal  "nivel_servicio",                            precision: 9,  scale: 4, null: false
    t.decimal  "equivalencia_unidades_standard",            precision: 19, scale: 4, null: false
  end

  create_table "SAProveedores", id: false, force: :cascade do |t|
    t.char     "cod_prv",                     limit: 10,                           null: false
    t.char     "tipo_cuenta_pagar",           limit: 5,                            null: false
    t.char     "tipo_proveedor",              limit: 5,                            null: false
    t.char     "razon_social",                limit: 80,                           null: false
    t.char     "clasificacion_fiscal",        limit: 5,                            null: false
    t.char     "nombre",                      limit: 30,                           null: false
    t.char     "ap_paterno",                  limit: 30,                           null: false
    t.char     "ap_materno",                  limit: 30,                           null: false
    t.char     "nom_comercial",               limit: 30,                           null: false
    t.varchar  "calle",                       limit: 120,                          null: false
    t.char     "num_exterior",                limit: 10,                           null: false
    t.char     "num_interior",                limit: 10,                           null: false
    t.varchar  "colonia",                     limit: 60,                           null: false
    t.char     "cod_postal",                  limit: 6,                            null: false
    t.char     "delegacion",                  limit: 15,                           null: false
    t.char     "pobmunedo",                   limit: 50,                           null: false
    t.char     "tel1",                        limit: 25
    t.char     "tel2",                        limit: 25
    t.char     "fax",                         limit: 25
    t.char     "rfc",                         limit: 15,                           null: false
    t.char     "clave_iva",                   limit: 1,                            null: false
    t.char     "flexibilidad_precio",         limit: 1,                            null: false
    t.boolean  "productos_catalogados",                                            null: false
    t.char     "pago_flete",                  limit: 1,                            null: false
    t.decimal  "reembolso_flete",                         precision: 5,  scale: 1, null: false
    t.decimal  "pedido_minimo",                           precision: 19, scale: 4, null: false
    t.char     "tipo_minimo",                 limit: 5,                            null: false
    t.char     "codigo_nuestro_proveedor",    limit: 10,                           null: false
    t.char     "manejo_devoluciones",         limit: 5,                            null: false
    t.integer  "plazo",                       limit: 2,                            null: false
    t.integer  "tolerancia_pago",             limit: 1,                            null: false
    t.boolean  "abono_en_cuenta",                                                  null: false
    t.boolean  "retencion_pago",                                                   null: false
    t.boolean  "back_order",                                                       null: false
    t.char     "autorizacion_ordenes_compra", limit: 1,                            null: false
    t.varchar  "pagina_web",                  limit: 100,                          null: false
    t.char     "moneda",                      limit: 5,                            null: false
    t.datetime "fecha_alta",                                                       null: false
    t.char     "pais",                        limit: 5,                            null: false
    t.char     "estado",                      limit: 5,                            null: false
    t.char     "municipio",                   limit: 5,                            null: false
    t.char     "poblacion",                   limit: 5,                            null: false
    t.char     "cod_estab",                   limit: 5,                            null: false
    t.boolean  "linea_fletera",                                                    null: false
    t.char     "formato_factura",             limit: 20
    t.boolean  "pago_estricto",                                                    null: false
    t.char     "status_proveedor",            limit: 5,                            null: false
    t.varchar  "e_mail",                      limit: 100,                          null: false
    t.datetime "ultima_modificacion",                                              null: false
    t.char     "proveedor_linea_fletera",     limit: 10,                           null: false
    t.char     "condicion_plazo",             limit: 5,                            null: false
    t.char     "giro_proveedor",              limit: 5,                            null: false
    t.char     "curp",                        limit: 18,                           null: false
    t.varchar  "entre_calles",                limit: 60,                           null: false
    t.varchar  "orientacion",                 limit: 10,                           null: false
    t.char     "mapa",                        limit: 10,                           null: false
    t.integer  "coordenada_x",                limit: 2,                            null: false
    t.integer  "coordenada_y",                limit: 2,                            null: false
    t.char     "clave_valor_pagar",           limit: 1,                            null: false
    t.integer  "evaluacion_proveedor",        limit: 1,                            null: false
  end

  create_table "SAmlista_precios", id: false, force: :cascade do |t|
    t.char     "lista_precios",       limit: 10,                          null: false
    t.char     "cod_prod",            limit: 13,                          null: false
    t.datetime "fecha_inicial",                                           null: false
    t.datetime "fecha_final",                                             null: false
    t.decimal  "precio_venta_unidad",            precision: 19, scale: 8, null: false
    t.decimal  "precio_venta_pieza",             precision: 19, scale: 8, null: false
    t.char     "tipo_precio_venta",   limit: 5,                           null: false
    t.char     "status",              limit: 5,                           null: false
    t.datetime "fecha_cancelacion"
    t.datetime "ultima_modificacion",                                     null: false
  end

  create_table "SAprecios_lista_proveedores", id: false, force: :cascade do |t|
    t.char     "cod_prv",             limit: 10,                          null: false
    t.char     "cod_prod",            limit: 13,                          null: false
    t.datetime "fecha_inicial",                                           null: false
    t.datetime "fecha_final",                                             null: false
    t.money    "precio_lista_unidad",            precision: 19, scale: 4, null: false
    t.money    "precio_lista_pieza",             precision: 19, scale: 4, null: false
    t.char     "status",              limit: 5,                           null: false
    t.datetime "fecha_cancelacion"
    t.datetime "ultima_modificacion",                                     null: false
  end

  create_table "SAprodestab", id: false, force: :cascade do |t|
    t.char     "cod_prod",                    limit: 13,                          null: false
    t.char     "cod_estab",                   limit: 5,                           null: false
    t.boolean  "pedir_al_proveedor",                                              null: false
    t.boolean  "pedir_a_establecimiento",                                         null: false
    t.char     "localizacion_surtido",        limit: 10,                          null: false
    t.boolean  "ubicacion_pallets",                                               null: false
    t.integer  "cama",                        limit: 2,                           null: false
    t.integer  "altura",                      limit: 2,                           null: false
    t.integer  "diseño_pallet",               limit: 1,                           null: false
    t.datetime "fecha_ultima_recepcion",                                          null: false
    t.decimal  "cantidad_ultima_recepcion",              precision: 19, scale: 4, null: false
    t.decimal  "exist_tauifu",                           precision: 19, scale: 4, null: false
    t.decimal  "exist_tauifp",                           precision: 19, scale: 4, null: false
    t.decimal  "exist_uifu",                             precision: 19, scale: 4, null: false
    t.decimal  "exist_uifp",                             precision: 19, scale: 4, null: false
    t.datetime "fecha_uif",                                                       null: false
    t.money    "costo_promedio_uif",                     precision: 19, scale: 4, null: false
    t.decimal  "exist_unidades",                         precision: 19, scale: 4, null: false
    t.decimal  "exist_piezas",                           precision: 19, scale: 4, null: false
    t.decimal  "unidades_no_disponibles",                precision: 19, scale: 4, null: false
    t.decimal  "piezas_no_disponibles",                  precision: 19, scale: 4, null: false
    t.datetime "fecha_agotado"
    t.money    "costo_promedio",                         precision: 19, scale: 4, null: false
    t.money    "ultimo_costo",                           precision: 19, scale: 4, null: false
    t.integer  "frentes",                     limit: 1
    t.integer  "fondos",                      limit: 1
    t.integer  "niveles",                     limit: 1
    t.char     "tendpvs",                     limit: 1,                           null: false
    t.char     "brm",                         limit: 1,                           null: false
    t.decimal  "pvs",                                    precision: 19, scale: 4, null: false
    t.decimal  "punto_reorden",                          precision: 19, scale: 4, null: false
    t.decimal  "dio",                                    precision: 9,  scale: 4, null: false
    t.decimal  "dmapvs",                                 precision: 19, scale: 4, null: false
    t.integer  "te",                          limit: 1,                           null: false
    t.integer  "tevar",                       limit: 1,                           null: false
    t.integer  "tr",                          limit: 1,                           null: false
    t.integer  "tep",                         limit: 1,                           null: false
    t.decimal  "nivel_servicio",                         precision: 9,  scale: 1, null: false
    t.decimal  "minimo",                                 precision: 19, scale: 4, null: false
    t.char     "tipo_minimo",                 limit: 1,                           null: false
    t.char     "metodo_ordenes_compra",       limit: 1,                           null: false
    t.char     "metodo_cuando_ordenar",       limit: 1,                           null: false
    t.char     "metodo_cuanto_ordenar",       limit: 1,                           null: false
    t.decimal  "inventario_minimo",                      precision: 19, scale: 4, null: false
    t.decimal  "inventario_maximo",                      precision: 19, scale: 4, null: false
    t.decimal  "cantidad_ordenar",                       precision: 19, scale: 4, null: false
    t.datetime "fecha_alta",                                                      null: false
    t.char     "status_producto",             limit: 5,                           null: false
    t.datetime "ultima_modificacion",                                             null: false
    t.char     "cod_estab_pedidos",           limit: 5,                           null: false
    t.boolean  "permite_existencia_negativa",                                     null: false
    t.decimal  "multiplo",                               precision: 9,  scale: 4, null: false
    t.decimal  "salidas_semana",                         precision: 19, scale: 4, null: false
    t.char     "clasificacion_productos",     limit: 5,                           null: false
  end

  create_table "SAproductos", id: false, force: :cascade do |t|
    t.char     "cod_prod",                       limit: 13,                           null: false
    t.varchar  "descripcion",                    limit: 100,                          null: false
    t.char     "marca",                          limit: 5,                            null: false
    t.char     "color",                          limit: 5,                            null: false
    t.char     "modelo",                         limit: 5,                            null: false
    t.char     "talla",                          limit: 5,                            null: false
    t.char     "aroma",                          limit: 5,                            null: false
    t.char     "sabor",                          limit: 5,                            null: false
    t.char     "unidad_compra",                  limit: 5,                            null: false
    t.decimal  "contenido",                                  precision: 19, scale: 8
    t.char     "presentacion",                   limit: 5,                            null: false
    t.decimal  "contenido_presentacion",                     precision: 19, scale: 4, null: false
    t.char     "unidad_presentacion",            limit: 5,                            null: false
    t.varchar  "descripcion_completa",           limit: 150,                          null: false
    t.char     "descripcion_corta",              limit: 40,                           null: false
    t.decimal  "contenido_lineal",                           precision: 19, scale: 8, null: false
    t.char     "unidad_lineal",                  limit: 5,                            null: false
    t.decimal  "contenido_area",                             precision: 19, scale: 8, null: false
    t.char     "unidad_area",                    limit: 5,                            null: false
    t.decimal  "contenido_peso",                             precision: 19, scale: 8, null: false
    t.decimal  "contenido_volumen",                          precision: 19, scale: 8, null: false
    t.char     "unidad_peso",                    limit: 5,                            null: false
    t.char     "unidad_volumen",                 limit: 5,                            null: false
    t.decimal  "peso_total",                                 precision: 19, scale: 4, null: false
    t.real     "ancho",                                                               null: false
    t.real     "largo",                                                               null: false
    t.real     "alto",                                                                null: false
    t.real     "volumen",                                                             null: false
    t.real     "ancho_pieza",                                                         null: false
    t.real     "largo_pieza",                                                         null: false
    t.real     "alto_pieza",                                                          null: false
    t.integer  "estiba_maxima",                  limit: 2,                            null: false
    t.char     "criterio_precio_venta",          limit: 5,                            null: false
    t.decimal  "iva_interior",                               precision: 5,  scale: 1, null: false
    t.decimal  "iva_fronterizo",                             precision: 5,  scale: 1, null: false
    t.decimal  "ieps_compra",                                precision: 9,  scale: 4, null: false
    t.char     "tipo_ieps_compra",               limit: 1,                            null: false
    t.decimal  "ieps",                                       precision: 9,  scale: 4, null: false
    t.char     "modo_surtido",                   limit: 1,                            null: false
    t.char     "clave_secofi",                   limit: 5,                            null: false
    t.char     "clave_ssa",                      limit: 5,                            null: false
    t.char     "fragilidad",                     limit: 5,                            null: false
    t.integer  "temperatura",                    limit: 1,                            null: false
    t.boolean  "importado",                                                           null: false
    t.char     "codigo_analogo",                 limit: 5,                            null: false
    t.char     "codigo_barras_unidad",           limit: 20,                           null: false
    t.char     "codigo_barras_pieza",            limit: 20,                           null: false
    t.integer  "garantia_compra",                limit: 1,                            null: false
    t.integer  "garantia_fabricacion",           limit: 1,                            null: false
    t.datetime "fecha_alta"
    t.integer  "caducidad_recepcion",            limit: 2,                            null: false
    t.integer  "caducidad_venta",                limit: 2,                            null: false
    t.integer  "caducidad_fabricacion",          limit: 2,                            null: false
    t.char     "prioridad_fabricacion",          limit: 5,                            null: false
    t.char     "categoria",                      limit: 5,                            null: false
    t.char     "linea_producto",                 limit: 5,                            null: false
    t.char     "familia",                        limit: 5,                            null: false
    t.char     "tipo_producto",                  limit: 5,                            null: false
    t.char     "clasificacion_productos",        limit: 5,                            null: false
    t.char     "grupo_facturacion",              limit: 5,                            null: false
    t.char     "clasificacion_carga",            limit: 5,                            null: false
    t.char     "comprador",                      limit: 5,                            null: false
    t.char     "fracciones_por",                 limit: 1,                            null: false
    t.integer  "decimales",                      limit: 1,                            null: false
    t.char     "fracciones_por_compras",         limit: 1,                            null: false
    t.integer  "decimales_compras",              limit: 1,                            null: false
    t.char     "status_producto",                limit: 5,                            null: false
    t.datetime "ultima_modificacion",                                                 null: false
    t.boolean  "ofertable",                                                           null: false
    t.char     "forma_expresar_inventario",      limit: 1,                            null: false
    t.decimal  "minimo_venta",                               precision: 9,  scale: 4, null: false
    t.decimal  "multiplo_venta",                             precision: 9,  scale: 4, null: false
    t.decimal  "cantidad_precio_promedio",                   precision: 9,  scale: 4, null: false
    t.char     "cuenta_contable",                limit: 20,                           null: false
    t.char     "contenido_por",                  limit: 1,                            null: false
    t.char     "sistema_equipos",                limit: 5,                            null: false
    t.char     "uso_producto",                   limit: 1,                            null: false
    t.decimal  "factor_adicional_volumen_carga",             precision: 9,  scale: 4, null: false
    t.char     "tasa_iva_interior",              limit: 2,                            null: false
    t.char     "tasa_iva_fronterizo",            limit: 2,                            null: false
    t.boolean  "precio_venta_automatico",                                             null: false
    t.boolean  "producto_dependiente",                                                null: false
    t.decimal  "minimo_venta_pos",                           precision: 9,  scale: 4, null: false
    t.decimal  "multiplo_venta_pos",                         precision: 9,  scale: 4, null: false
    t.char     "forma_resurtido_inventario",     limit: 1,                            null: false
    t.char     "rango_producto",                 limit: 5,                            null: false
    t.char     "tabla_comision",                 limit: 2,                            null: false
    t.decimal  "cantidad_precio_mayoreo",                    precision: 9,  scale: 4, null: false
    t.char     "clase_producto",                 limit: 5,                            null: false
    t.decimal  "factor_merma",                               precision: 9,  scale: 3, null: false
    t.decimal  "factor_merma_natural",                       precision: 9,  scale: 3, null: false
  end

  create_table "SugeridoEstab", id: false, force: :cascade do |t|
    t.char    "cod_estab",      limit: 5,                           null: false
    t.char    "cod_prod",       limit: 13,                          null: false
    t.char    "codigo_analogo", limit: 5,                           null: false
    t.integer "Inventario",     limit: 4,                           null: false
    t.decimal "Sugerido",                  precision: 19, scale: 4, null: false
    t.char    "Borrar",         limit: 10,                          null: false
    t.char    "analogia",       limit: 5,                           null: false
  end

  add_index "SugeridoEstab", ["analogia"], name: "IX_SugeridoEstab"

  create_table "Tipos_cargos_clientes", primary_key: "tipo_cargo_cliente", force: :cascade do |t|
    t.char    "nombre",                limit: 50,                   null: false
    t.char    "abreviatura",           limit: 5,  default: "     ", null: false
    t.char    "status",                limit: 5,  default: "V    ", null: false
    t.boolean "afecta_status_cliente",            default: false,   null: false
    t.char    "status_cliente",        limit: 5,  default: "     ", null: false
    t.boolean "cheque_devuelto",                  default: false,   null: false
    t.boolean "registro_contable",                default: false,   null: false
  end

  create_table "Tipos_instruccion_clientes", primary_key: "tipo_instruccion_clientes", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "Tipos_licencia_conducir", primary_key: "tipo_licencia_conducir", force: :cascade do |t|
    t.varchar "nombre",        limit: 50,                 null: false
    t.char    "status",        limit: 1,                  null: false
    t.integer "nivel",         limit: 1,   default: 0,    null: false
    t.boolean "gubernamental",             default: true, null: false
    t.varchar "notas",         limit: 100, default: "",   null: false
  end

  create_table "Tipos_listas_precios", primary_key: "tipo_lista_precio", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "Tipos_movimientos_bancarios", id: false, force: :cascade do |t|
    t.char "tipo_movimientos_bancarios", limit: 1,  null: false
    t.char "nombre",                     limit: 30, null: false
    t.char "abreviatura",                limit: 5,  null: false
    t.char "status",                     limit: 5,  null: false
  end

  create_table "Tipos_movimientos_cajeros", primary_key: "Tipo_movimiento_cajero", force: :cascade do |t|
    t.varchar "nombre",      limit: 50,               null: false
    t.char    "Afectacion",  limit: 1,  default: "+", null: false
    t.char    "abreviatura", limit: 5,                null: false
    t.char    "status",      limit: 5,                null: false
  end

  create_table "Tipos_unidades", primary_key: "Tipo_unidad", force: :cascade do |t|
    t.char "nombre", limit: 50, null: false
  end

  create_table "UltRecepEstab13", id: false, force: :cascade do |t|
    t.char    "cod_prod",   limit: 13,                          null: false
    t.decimal "Inventario",            precision: 19, scale: 4
    t.integer "Id",         limit: 4,                           null: false
  end

  create_table "UltTransfEstab13", id: false, force: :cascade do |t|
    t.char    "cod_prod",   limit: 13,                          null: false
    t.decimal "inventario",            precision: 19, scale: 4
    t.integer "Id",         limit: 4,                           null: false
  end

  create_table "Unidades_catalogos_ilustrados", primary_key: "unidad_catalogos_ilustrados", force: :cascade do |t|
    t.char "nombre", limit: 30, null: false
  end

  create_table "_A189565", id: false, force: :cascade do |t|
    t.char     "folio",                          limit: 10,                           null: false
    t.char     "transaccion",                    limit: 5,                            null: false
    t.datetime "fecha",                                                               null: false
    t.char     "cod_prv",                        limit: 10,                           null: false
    t.money    "importe",                                    precision: 19, scale: 4, null: false
    t.money    "iva",                                        precision: 19, scale: 4, null: false
    t.money    "ieps",                                       precision: 19, scale: 4, null: false
    t.money    "costo",                                      precision: 19, scale: 4, null: false
    t.decimal  "unidades",                                   precision: 19, scale: 4, null: false
    t.decimal  "piezas",                                     precision: 19, scale: 4, null: false
    t.decimal  "peso",                                       precision: 19, scale: 4, null: false
    t.decimal  "volumen",                                    precision: 19, scale: 4, null: false
    t.money    "importe_aplicado",                           precision: 19, scale: 4, null: false
    t.char     "usuario",                        limit: 5,                            null: false
    t.char     "usuario_cancelacion",            limit: 5
    t.datetime "fecha_cancelacion"
    t.char     "cod_estab",                      limit: 5,                            null: false
    t.char     "razon_devoluciones_proveedores", limit: 5,                            null: false
    t.varchar  "notas",                          limit: 200,                          null: false
    t.char     "moneda",                         limit: 5,                            null: false
    t.real     "tipo_cambio",                                                         null: false
    t.char     "status",                         limit: 5,                            null: false
    t.datetime "ultima_modificacion",                                                 null: false
    t.char     "folio_referencia",               limit: 10,                           null: false
    t.char     "transaccion_referencia",         limit: 5,                            null: false
    t.char     "embarque",                       limit: 10,                           null: false
    t.integer  "orden_embarque",                 limit: 2,                            null: false
    t.char     "clave_afectacion_inventario",    limit: 1,                            null: false
    t.boolean  "recoge_mercancia",                                                    null: false
    t.money    "total",                                      precision: 19, scale: 4
  end

  create_table "_AbonosNC", id: false, force: :cascade do |t|
    t.char     "FolioNC",                    limit: 10,                          null: false
    t.datetime "FechaNC",                                                        null: false
    t.money    "TotalDocto",                            precision: 19, scale: 4
    t.money    "ImporteApp",                            precision: 19, scale: 4
    t.decimal  "ImpNC",                                 precision: 20, scale: 4
    t.char     "FolioApp",                   limit: 10
    t.char     "folio_aplicado",             limit: 10
    t.char     "transaccion_folio_aplicado", limit: 5
  end

  create_table "_ClasProd", id: false, force: :cascade do |t|
    t.char     "Codigo", limit: 5,  null: false
    t.char     "Trans",  limit: 10, null: false
    t.datetime "fecha",             null: false
  end

  create_table "_FRT", id: false, force: :cascade do |t|
    t.char     "folio",                       limit: 10,                           null: false
    t.char     "transaccion",                 limit: 5,                            null: false
    t.datetime "fecha",                                                            null: false
    t.char     "cod_cte",                     limit: 10,                           null: false
    t.money    "importe",                                 precision: 19, scale: 4, null: false
    t.money    "iva",                                     precision: 19, scale: 4, null: false
    t.money    "total",                                   precision: 19, scale: 4
    t.decimal  "descuento_porcentual",                    precision: 9,  scale: 6, null: false
    t.money    "importe_descuento",                       precision: 19, scale: 4, null: false
    t.char     "condicion_financiera",        limit: 10,                           null: false
    t.money    "ieps",                                    precision: 19, scale: 4, null: false
    t.money    "costo",                                   precision: 19, scale: 4, null: false
    t.money    "utilidad_bruta",                          precision: 19, scale: 4
    t.money    "abonos",                                  precision: 19, scale: 4, null: false
    t.money    "saldo",                                   precision: 19, scale: 4
    t.decimal  "peso",                                    precision: 19, scale: 4, null: false
    t.decimal  "volumen",                                 precision: 19, scale: 4, null: false
    t.decimal  "unidades",                                precision: 19, scale: 4, null: false
    t.decimal  "piezas",                                  precision: 19, scale: 4, null: false
    t.char     "embarque",                    limit: 10,                           null: false
    t.integer  "orden_embarque",              limit: 2,                            null: false
    t.datetime "fecha_cancelacion"
    t.datetime "fecha_pago"
    t.char     "vendedor",                    limit: 5,                            null: false
    t.char     "folio_origen",                limit: 10,                           null: false
    t.char     "transaccion_origen",          limit: 5,                            null: false
    t.char     "orden_loteo",                 limit: 10,                           null: false
    t.char     "cond_pago",                   limit: 5,                            null: false
    t.boolean  "recoge_mercancia",                                                 null: false
    t.char     "numdpc",                      limit: 10,                           null: false
    t.char     "status_ubicacion",            limit: 1,                            null: false
    t.char     "cod_estab",                   limit: 5,                            null: false
    t.char     "pedido_cliente",              limit: 15,                           null: false
    t.varchar  "notas",                       limit: 200
    t.char     "cliente_alterno",             limit: 10,                           null: false
    t.char     "tipo_cliente_alterno",        limit: 1,                            null: false
    t.boolean  "dfinanc_aplicado",                                                 null: false
    t.integer  "plazo",                       limit: 2,                            null: false
    t.char     "factura",                     limit: 10,                           null: false
    t.char     "caja",                        limit: 5,                            null: false
    t.char     "cajero",                      limit: 5,                            null: false
    t.char     "usuario",                     limit: 5,                            null: false
    t.char     "usuario_cancelacion",         limit: 5
    t.char     "razon_cancelacion_ventas",    limit: 5
    t.char     "folio_cajero",                limit: 10,                           null: false
    t.char     "moneda",                      limit: 5
    t.real     "tipo_cambio"
    t.char     "linea_fletera",               limit: 10,                           null: false
    t.char     "status",                      limit: 5,                            null: false
    t.datetime "ultima_modificacion",                                              null: false
    t.char     "tipo_atencion",               limit: 1,                            null: false
    t.char     "surtidor",                    limit: 5,                            null: false
    t.datetime "FECHA_RECEPCION_FACTURA"
    t.datetime "FECHA_RECEPCION_MERCANCIA"
    t.datetime "FECHA_ARRIVO"
    t.datetime "FECHA_CONTRARECIBO"
    t.char     "FOLIO_CONTRARECIBO",          limit: 10
    t.char     "STATUS_RECEPCION",            limit: 5
    t.datetime "fecha_entrega",                                                    null: false
    t.char     "condicion_distribucion",      limit: 2,                            null: false
    t.char     "clave_afectacion_inventario", limit: 1,                            null: false
    t.char     "status_cobranza",             limit: 2,                            null: false
    t.char     "cobrador",                    limit: 5,                            null: false
  end

  create_table "_MC21728", id: false, force: :cascade do |t|
    t.char     "folio",                       limit: 10,                           null: false
    t.char     "transaccion",                 limit: 5,                            null: false
    t.datetime "fecha",                                                            null: false
    t.char     "cod_cte",                     limit: 10,                           null: false
    t.money    "importe",                                 precision: 19, scale: 4, null: false
    t.money    "iva",                                     precision: 19, scale: 4, null: false
    t.money    "total",                                   precision: 19, scale: 4
    t.decimal  "descuento_porcentual",                    precision: 9,  scale: 6, null: false
    t.money    "importe_descuento",                       precision: 19, scale: 4, null: false
    t.char     "condicion_financiera",        limit: 10,                           null: false
    t.money    "ieps",                                    precision: 19, scale: 4, null: false
    t.money    "costo",                                   precision: 19, scale: 4, null: false
    t.money    "utilidad_bruta",                          precision: 19, scale: 4
    t.money    "abonos",                                  precision: 19, scale: 4, null: false
    t.money    "saldo",                                   precision: 19, scale: 4
    t.decimal  "peso",                                    precision: 19, scale: 4, null: false
    t.decimal  "volumen",                                 precision: 19, scale: 4, null: false
    t.decimal  "unidades",                                precision: 19, scale: 4, null: false
    t.decimal  "piezas",                                  precision: 19, scale: 4, null: false
    t.char     "embarque",                    limit: 10,                           null: false
    t.integer  "orden_embarque",              limit: 2,                            null: false
    t.datetime "fecha_cancelacion"
    t.datetime "fecha_pago"
    t.char     "vendedor",                    limit: 5,                            null: false
    t.char     "folio_origen",                limit: 10,                           null: false
    t.char     "transaccion_origen",          limit: 5,                            null: false
    t.char     "orden_loteo",                 limit: 10,                           null: false
    t.char     "cond_pago",                   limit: 5,                            null: false
    t.boolean  "recoge_mercancia",                                                 null: false
    t.char     "numdpc",                      limit: 10,                           null: false
    t.char     "status_ubicacion",            limit: 1,                            null: false
    t.char     "cod_estab",                   limit: 5,                            null: false
    t.char     "pedido_cliente",              limit: 15,                           null: false
    t.varchar  "notas",                       limit: 200
    t.char     "cliente_alterno",             limit: 10,                           null: false
    t.char     "tipo_cliente_alterno",        limit: 1,                            null: false
    t.boolean  "dfinanc_aplicado",                                                 null: false
    t.integer  "plazo",                       limit: 2,                            null: false
    t.char     "factura",                     limit: 10,                           null: false
    t.char     "caja",                        limit: 5,                            null: false
    t.char     "cajero",                      limit: 5,                            null: false
    t.char     "usuario",                     limit: 5,                            null: false
    t.char     "usuario_cancelacion",         limit: 5
    t.char     "razon_cancelacion_ventas",    limit: 5
    t.char     "folio_cajero",                limit: 10,                           null: false
    t.char     "moneda",                      limit: 5
    t.real     "tipo_cambio"
    t.char     "linea_fletera",               limit: 10,                           null: false
    t.char     "status",                      limit: 5,                            null: false
    t.datetime "ultima_modificacion",                                              null: false
    t.char     "tipo_atencion",               limit: 1,                            null: false
    t.char     "surtidor",                    limit: 5,                            null: false
    t.datetime "FECHA_RECEPCION_FACTURA"
    t.datetime "FECHA_RECEPCION_MERCANCIA"
    t.datetime "FECHA_ARRIVO"
    t.datetime "FECHA_CONTRARECIBO"
    t.char     "FOLIO_CONTRARECIBO",          limit: 10
    t.char     "STATUS_RECEPCION",            limit: 5
    t.datetime "fecha_entrega",                                                    null: false
    t.char     "condicion_distribucion",      limit: 2,                            null: false
    t.char     "clave_afectacion_inventario", limit: 1,                            null: false
    t.char     "status_cobranza",             limit: 2,                            null: false
    t.char     "cobrador",                    limit: 5,                            null: false
  end

  create_table "_OpcionesFiltro006", id: false, force: :cascade do |t|
    t.char    "folio",                  limit: 5,   null: false
    t.varchar "nombre",                 limit: 50,  null: false
    t.varchar "primera_tabla",          limit: 50,  null: false
    t.varchar "ultima_tabla",           limit: 50,  null: false
    t.varchar "relaciones",             limit: 300, null: false
    t.varchar "campo",                  limit: 100, null: false
    t.integer "mutuamente_excluyentes", limit: 1,   null: false
  end

  create_table "_PROVEEDORES", id: false, force: :cascade do |t|
    t.string "CUENTA",       limit: 255
    t.string "cod_prv",      limit: 255
    t.string "razon_social", limit: 255
  end

  create_table "_Prodestab13", id: false, force: :cascade do |t|
    t.char     "cod_prod",                    limit: 13,                          null: false
    t.char     "cod_estab",                   limit: 5,                           null: false
    t.boolean  "pedir_al_proveedor",                                              null: false
    t.boolean  "pedir_a_establecimiento",                                         null: false
    t.char     "localizacion_surtido",        limit: 10,                          null: false
    t.boolean  "ubicacion_pallets",                                               null: false
    t.integer  "cama",                        limit: 2,                           null: false
    t.integer  "altura",                      limit: 2,                           null: false
    t.integer  "diseño_pallet",               limit: 1,                           null: false
    t.datetime "fecha_ultima_recepcion",                                          null: false
    t.decimal  "cantidad_ultima_recepcion",              precision: 19, scale: 4, null: false
    t.decimal  "exist_tauifu",                           precision: 19, scale: 4, null: false
    t.decimal  "exist_tauifp",                           precision: 19, scale: 4, null: false
    t.decimal  "exist_uifu",                             precision: 19, scale: 4, null: false
    t.decimal  "exist_uifp",                             precision: 19, scale: 4, null: false
    t.datetime "fecha_uif",                                                       null: false
    t.money    "costo_promedio_uif",                     precision: 19, scale: 4, null: false
    t.decimal  "exist_unidades",                         precision: 19, scale: 4, null: false
    t.decimal  "exist_piezas",                           precision: 19, scale: 4, null: false
    t.decimal  "unidades_no_disponibles",                precision: 19, scale: 4, null: false
    t.decimal  "piezas_no_disponibles",                  precision: 19, scale: 4, null: false
    t.datetime "fecha_agotado"
    t.money    "costo_promedio",                         precision: 19, scale: 4, null: false
    t.money    "ultimo_costo",                           precision: 19, scale: 4, null: false
    t.integer  "frentes",                     limit: 1
    t.integer  "fondos",                      limit: 1
    t.integer  "niveles",                     limit: 1
    t.char     "tendpvs",                     limit: 1,                           null: false
    t.char     "brm",                         limit: 1,                           null: false
    t.decimal  "pvs",                                    precision: 19, scale: 4, null: false
    t.decimal  "punto_reorden",                          precision: 19, scale: 4, null: false
    t.decimal  "dio",                                    precision: 9,  scale: 4, null: false
    t.decimal  "dmapvs",                                 precision: 19, scale: 4, null: false
    t.integer  "te",                          limit: 1,                           null: false
    t.integer  "tevar",                       limit: 1,                           null: false
    t.integer  "tr",                          limit: 1,                           null: false
    t.integer  "tep",                         limit: 1,                           null: false
    t.decimal  "nivel_servicio",                         precision: 9,  scale: 1, null: false
    t.decimal  "minimo",                                 precision: 19, scale: 4, null: false
    t.char     "tipo_minimo",                 limit: 1,                           null: false
    t.char     "metodo_ordenes_compra",       limit: 1,                           null: false
    t.char     "metodo_cuando_ordenar",       limit: 1,                           null: false
    t.char     "metodo_cuanto_ordenar",       limit: 1,                           null: false
    t.decimal  "inventario_minimo",                      precision: 19, scale: 4, null: false
    t.decimal  "inventario_maximo",                      precision: 19, scale: 4, null: false
    t.decimal  "cantidad_ordenar",                       precision: 19, scale: 4, null: false
    t.datetime "fecha_alta",                                                      null: false
    t.char     "status_producto",             limit: 5,                           null: false
    t.datetime "ultima_modificacion",                                             null: false
    t.char     "cod_estab_pedidos",           limit: 5,                           null: false
    t.boolean  "permite_existencia_negativa",                                     null: false
    t.decimal  "multiplo",                               precision: 9,  scale: 4, null: false
    t.decimal  "salidas_semana",                         precision: 19, scale: 4, null: false
    t.char     "clasificacion_productos",     limit: 5,                           null: false
    t.boolean  "Facturado",                                                       null: false
    t.char     "mueble",                      limit: 5,                           null: false
    t.integer  "nivel_mueble",                limit: 1,                           null: false
    t.integer  "posicion_mueble",             limit: 2,                           null: false
  end

  create_table "_Respaldo", force: :cascade do |t|
    t.char     "lista_precios",       limit: 10,                          null: false
    t.char     "cod_prod",            limit: 13,                          null: false
    t.datetime "fecha_inicial",                                           null: false
    t.datetime "fecha_final",                                             null: false
    t.decimal  "precio_venta_unidad",            precision: 19, scale: 8, null: false
    t.decimal  "precio_venta_pieza",             precision: 19, scale: 8, null: false
    t.char     "tipo_precio_venta",   limit: 5,                           null: false
    t.char     "status",              limit: 5,                           null: false
    t.datetime "fecha_cancelacion"
    t.datetime "ultima_modificacion",                                     null: false
    t.char     "usuario",             limit: 5,                           null: false
    t.boolean  "mostrar",                                                 null: false
  end

  create_table "_SALDOS_INICIALES", primary_key: "ID", force: :cascade do |t|
    t.string "CUENTAC",        limit: 255
    t.string "DESCRIPCION",    limit: 255
    t.float  "SALDO_ANTERIOR"
    t.float  "CARGO_PERIODO"
    t.float  "ABONO_PERIODO"
    t.float  "SALDO"
    t.char   "CUENTA",         limit: 5,   default: "     ", null: false
    t.char   "SUBCUENTA",      limit: 5,   default: "     ", null: false
    t.char   "SUBSUBCUENTA",   limit: 5,   default: "     ", null: false
  end

  create_table "__KingRespaldo", id: false, force: :cascade do |t|
    t.char     "cod_prod",                       limit: 13,                          null: false
    t.char     "cod_prv",                        limit: 10,                          null: false
    t.boolean  "proveedor_principal",                                                null: false
    t.char     "cod_prod_proveedor",             limit: 30,                          null: false
    t.varchar  "descripcion_producto_proveedor", limit: 50,                          null: false
    t.datetime "fecha_ultima_recepcion",                                             null: false
    t.decimal  "cantidad_ultima_recepcion",                 precision: 19, scale: 4, null: false
    t.money    "ultimo_costo",                              precision: 19, scale: 4, null: false
    t.datetime "fecha_alta",                                                         null: false
    t.char     "manejo_devoluciones",            limit: 5,                           null: false
    t.char     "representante",                  limit: 10,                          null: false
    t.char     "status_producto",                limit: 5,                           null: false
    t.datetime "ultima_modificacion",                                                null: false
    t.char     "unidad",                         limit: 5,                           null: false
    t.decimal  "factor_conversion",                         precision: 9,  scale: 4, null: false
    t.decimal  "nivel_servicio",                            precision: 9,  scale: 4, null: false
    t.decimal  "equivalencia_unidades_standard",            precision: 19, scale: 4, null: false
    t.decimal  "porcentaje_flete",                          precision: 9,  scale: 4, null: false
    t.money    "importe_flete",                             precision: 19, scale: 4, null: false
    t.boolean  "default_descuentos",                                                 null: false
  end

  create_table "_bak_codigos_analogos", id: false, force: :cascade do |t|
    t.char "codigo_analogo",   limit: 5,  null: false
    t.char "nombre",           limit: 30, null: false
    t.char "conversion",       limit: 1,  null: false
    t.char "status",           limit: 5,  null: false
    t.char "validez_analogia", limit: 1,  null: false
  end

  create_table "_bonificaciones_analiticas_respaldo", force: :cascade do |t|
    t.char  "folio",             limit: 10,                          null: false
    t.char  "transaccion",       limit: 5,                           null: false
    t.char  "operacion",         limit: 1,                           null: false
    t.char  "cod_cte",           limit: 10,                          null: false
    t.char  "tipo_bonificacion", limit: 1,                           null: false
    t.money "cantidad",                     precision: 19, scale: 4, null: false
  end

  create_table "_catalogoSIL", id: false, force: :cascade do |t|
    t.string "cod_prod2", limit: 255
    t.string "cod_prv2",  limit: 255
    t.string "F3",        limit: 255
    t.string "F4",        limit: 255
    t.string "F5",        limit: 255
    t.string "F6",        limit: 255
    t.string "F7",        limit: 255
    t.string "F8",        limit: 255
    t.string "F9",        limit: 255
  end

  create_table "_catalogosilRespaldo", id: false, force: :cascade do |t|
    t.char     "cod_prod",                       limit: 13,                          null: false
    t.char     "cod_prv",                        limit: 10,                          null: false
    t.boolean  "proveedor_principal",                                                null: false
    t.char     "cod_prod_proveedor",             limit: 30,                          null: false
    t.varchar  "descripcion_producto_proveedor", limit: 50,                          null: false
    t.datetime "fecha_ultima_recepcion",                                             null: false
    t.decimal  "cantidad_ultima_recepcion",                 precision: 19, scale: 4, null: false
    t.money    "ultimo_costo",                              precision: 19, scale: 4, null: false
    t.datetime "fecha_alta",                                                         null: false
    t.char     "manejo_devoluciones",            limit: 5,                           null: false
    t.char     "representante",                  limit: 10,                          null: false
    t.char     "status_producto",                limit: 5,                           null: false
    t.datetime "ultima_modificacion",                                                null: false
    t.char     "unidad",                         limit: 5,                           null: false
    t.decimal  "factor_conversion",                         precision: 9,  scale: 4, null: false
    t.decimal  "nivel_servicio",                            precision: 9,  scale: 4, null: false
    t.decimal  "equivalencia_unidades_standard",            precision: 19, scale: 4, null: false
    t.decimal  "porcentaje_flete",                          precision: 9,  scale: 4, null: false
    t.money    "importe_flete",                             precision: 19, scale: 4, null: false
    t.boolean  "default_descuentos",                                                 null: false
  end

  create_table "_codigos_analogos", id: false, force: :cascade do |t|
    t.char "codigo_analogo",   limit: 5,  null: false
    t.char "nombre",           limit: 30, null: false
    t.char "conversion",       limit: 1,  null: false
    t.char "status",           limit: 5,  null: false
    t.char "validez_analogia", limit: 1,  null: false
  end

  create_table "_cuentas", force: :cascade do |t|
    t.string "cuentac",      limit: 255
    t.string "digv",         limit: 255
    t.string "DESCRIPCION",  limit: 255
    t.string "edofin",       limit: 255
    t.string "da",           limit: 255
    t.char   "cuenta",       limit: 5
    t.char   "subcuenta",    limit: 5
    t.char   "subsubcuenta", limit: 5
  end

  create_table "_deduccionesReso", id: false, force: :cascade do |t|
    t.char     "folio",                     limit: 10,                           null: false
    t.char     "transaccion",               limit: 5,                            null: false
    t.char     "empleado",                  limit: 10,                           null: false
    t.char     "tipo_deduccion_automatica", limit: 5,                            null: false
    t.datetime "fecha",                                                          null: false
    t.datetime "fecha_inicial",                                                  null: false
    t.money    "cantidad",                              precision: 19, scale: 4, null: false
    t.char     "forma_alimentacion",        limit: 1,                            null: false
    t.decimal  "tope",                                  precision: 19, scale: 4, null: false
    t.money    "abonos",                                precision: 19, scale: 4, null: false
    t.decimal  "saldo",                                 precision: 20, scale: 4
    t.char     "concepto_nomina",           limit: 5,                            null: false
    t.char     "referencia",                limit: 20,                           null: false
    t.varchar  "notas",                     limit: 100,                          null: false
    t.char     "status",                    limit: 1,                            null: false
    t.char     "tipo_nomina",               limit: 1,                            null: false
    t.boolean  "proporcional_sdt",                                               null: false
  end

  create_table "_empleados14", force: :cascade do |t|
    t.char     "empleado",          limit: 10,                          null: false
    t.datetime "fecha_inicial",                                         null: false
    t.datetime "fecha_final",                                           null: false
    t.money    "sueldo_diario",                precision: 19, scale: 4, null: false
    t.char     "status",            limit: 1,                           null: false
    t.datetime "fecha_cancelacion"
    t.money    "sueldo_laboral",               precision: 19, scale: 4, null: false
  end

  create_table "_lista_4", force: :cascade do |t|
    t.char     "lista_precios",       limit: 10,                          null: false
    t.char     "cod_prod",            limit: 13,                          null: false
    t.datetime "fecha_inicial",                                           null: false
    t.datetime "fecha_final",                                             null: false
    t.decimal  "precio_venta_unidad",            precision: 19, scale: 8, null: false
    t.decimal  "precio_venta_pieza",             precision: 19, scale: 8, null: false
    t.char     "tipo_precio_venta",   limit: 5,                           null: false
    t.char     "status",              limit: 5,                           null: false
    t.datetime "fecha_cancelacion"
    t.datetime "ultima_modificacion",                                     null: false
    t.char     "usuario",             limit: 5,                           null: false
    t.boolean  "mostrar",                                                 null: false
  end

  create_table "_mdeduccionesReso", force: :cascade do |t|
    t.char     "folio_nomina", limit: 10,                          null: false
    t.char     "folio",        limit: 10,                          null: false
    t.char     "transaccion",  limit: 5,                           null: false
    t.money    "importe",                 precision: 19, scale: 4, null: false
    t.datetime "fecha",                                            null: false
    t.char     "empleado",     limit: 10,                          null: false
  end

  create_table "_mlista", force: :cascade do |t|
    t.char     "lista_precios",       limit: 10,                          null: false
    t.char     "cod_prod",            limit: 13,                          null: false
    t.datetime "fecha_inicial",                                           null: false
    t.datetime "fecha_final",                                             null: false
    t.decimal  "precio_venta_unidad",            precision: 19, scale: 8, null: false
    t.decimal  "precio_venta_pieza",             precision: 19, scale: 8, null: false
    t.char     "tipo_precio_venta",   limit: 5,                           null: false
    t.char     "status",              limit: 5,                           null: false
    t.datetime "fecha_cancelacion"
    t.datetime "ultima_modificacion",                                     null: false
    t.char     "usuario",             limit: 5,                           null: false
    t.boolean  "mostrar",                                                 null: false
  end

  create_table "_mlista0924", force: :cascade do |t|
    t.char     "lista_precios",       limit: 10,                          null: false
    t.char     "cod_prod",            limit: 13,                          null: false
    t.datetime "fecha_inicial",                                           null: false
    t.datetime "fecha_final",                                             null: false
    t.decimal  "precio_venta_unidad",            precision: 19, scale: 8, null: false
    t.decimal  "precio_venta_pieza",             precision: 19, scale: 8, null: false
    t.char     "tipo_precio_venta",   limit: 5,                           null: false
    t.char     "status",              limit: 5,                           null: false
    t.datetime "fecha_cancelacion"
    t.datetime "ultima_modificacion",                                     null: false
    t.char     "usuario",             limit: 5,                           null: false
    t.boolean  "mostrar",                                                 null: false
  end

  create_table "_mlista0950", force: :cascade do |t|
    t.char     "lista_precios",       limit: 10,                          null: false
    t.char     "cod_prod",            limit: 13,                          null: false
    t.datetime "fecha_inicial",                                           null: false
    t.datetime "fecha_final",                                             null: false
    t.decimal  "precio_venta_unidad",            precision: 19, scale: 8, null: false
    t.decimal  "precio_venta_pieza",             precision: 19, scale: 8, null: false
    t.char     "tipo_precio_venta",   limit: 5,                           null: false
    t.char     "status",              limit: 5,                           null: false
    t.datetime "fecha_cancelacion"
    t.datetime "ultima_modificacion",                                     null: false
    t.char     "usuario",             limit: 5,                           null: false
    t.boolean  "mostrar",                                                 null: false
  end

  create_table "_mlista1311", force: :cascade do |t|
    t.char     "lista_precios",       limit: 10,                          null: false
    t.char     "cod_prod",            limit: 13,                          null: false
    t.datetime "fecha_inicial",                                           null: false
    t.datetime "fecha_final",                                             null: false
    t.decimal  "precio_venta_unidad",            precision: 19, scale: 8, null: false
    t.decimal  "precio_venta_pieza",             precision: 19, scale: 8, null: false
    t.char     "tipo_precio_venta",   limit: 5,                           null: false
    t.char     "status",              limit: 5,                           null: false
    t.datetime "fecha_cancelacion"
    t.datetime "ultima_modificacion",                                     null: false
    t.char     "usuario",             limit: 5,                           null: false
    t.boolean  "mostrar",                                                 null: false
  end

  create_table "_mlista1634", force: :cascade do |t|
    t.char     "lista_precios",       limit: 10,                          null: false
    t.char     "cod_prod",            limit: 13,                          null: false
    t.datetime "fecha_inicial",                                           null: false
    t.datetime "fecha_final",                                             null: false
    t.decimal  "precio_venta_unidad",            precision: 19, scale: 8, null: false
    t.decimal  "precio_venta_pieza",             precision: 19, scale: 8, null: false
    t.char     "tipo_precio_venta",   limit: 5,                           null: false
    t.char     "status",              limit: 5,                           null: false
    t.datetime "fecha_cancelacion"
    t.datetime "ultima_modificacion",                                     null: false
    t.char     "usuario",             limit: 5,                           null: false
    t.boolean  "mostrar",                                                 null: false
  end

  create_table "_mnominas", id: false, force: :cascade do |t|
    t.char    "folio",                          limit: 10,                          null: false
    t.char    "transaccion",                    limit: 5,                           null: false
    t.char    "empleado",                       limit: 10,                          null: false
    t.decimal "dias_trabajados",                           precision: 9,  scale: 4, null: false
    t.money   "percepcion_normal",                         precision: 19, scale: 4, null: false
    t.money   "otras_grabadas",                            precision: 19, scale: 4, null: false
    t.money   "otras_exentas",                             precision: 19, scale: 4, null: false
    t.money   "credito_salario",                           precision: 19, scale: 4, null: false
    t.money   "ispt",                                      precision: 19, scale: 4, null: false
    t.money   "imss",                                      precision: 19, scale: 4, null: false
    t.money   "otras_deducciones",                         precision: 19, scale: 4, null: false
    t.money   "sueldo_diario",                             precision: 19, scale: 4, null: false
    t.money   "salario_diario_integrado",                  precision: 19, scale: 4, null: false
    t.money   "otras_grabadas_imss",                       precision: 19, scale: 4, null: false
    t.money   "cuota_fija",                                precision: 19, scale: 4, null: false
    t.money   "excedente_patron",                          precision: 19, scale: 4, null: false
    t.money   "excedente_trabajador",                      precision: 19, scale: 4, null: false
    t.money   "prestaciones_dinero_patron",                precision: 19, scale: 4, null: false
    t.money   "prestaciones_dinero_trabajador",            precision: 19, scale: 4, null: false
    t.money   "gastos_medicos_patron",                     precision: 19, scale: 4, null: false
    t.money   "gastos_medicos_trabajador",                 precision: 19, scale: 4, null: false
    t.money   "riesgo_trabajo",                            precision: 19, scale: 4, null: false
    t.money   "invalidez_vida_patron",                     precision: 19, scale: 4, null: false
    t.money   "invalidez_vida_trabajador",                 precision: 19, scale: 4, null: false
    t.money   "guarderia",                                 precision: 19, scale: 4, null: false
    t.money   "retiro",                                    precision: 19, scale: 4, null: false
    t.money   "cesantia_vejez_patron",                     precision: 19, scale: 4, null: false
    t.money   "cesantia_vejez_trabajador",                 precision: 19, scale: 4, null: false
    t.money   "infonavit",                                 precision: 19, scale: 4, null: false
    t.money   "neto",                                      precision: 19, scale: 4, null: false
    t.char    "grupo_nomina",                   limit: 5,                           null: false
    t.char    "folio_pago_empleados",           limit: 10,                          null: false
    t.char    "linea_produccion",               limit: 5,                           null: false
    t.money   "impuesto_estatal",                          precision: 19, scale: 4, null: false
    t.money   "percepcion_laboral",                        precision: 19, scale: 4, null: false
    t.money   "comision",                                  precision: 19, scale: 4, null: false
    t.money   "otros",                                     precision: 19, scale: 4, null: false
  end

  create_table "_mnominas2014", id: false, force: :cascade do |t|
    t.char    "folio",                          limit: 10,                          null: false
    t.char    "transaccion",                    limit: 5,                           null: false
    t.char    "empleado",                       limit: 10,                          null: false
    t.decimal "dias_trabajados",                           precision: 9,  scale: 4, null: false
    t.money   "percepcion_normal",                         precision: 19, scale: 4, null: false
    t.money   "otras_grabadas",                            precision: 19, scale: 4, null: false
    t.money   "otras_exentas",                             precision: 19, scale: 4, null: false
    t.money   "credito_salario",                           precision: 19, scale: 4, null: false
    t.money   "ispt",                                      precision: 19, scale: 4, null: false
    t.money   "imss",                                      precision: 19, scale: 4, null: false
    t.money   "otras_deducciones",                         precision: 19, scale: 4, null: false
    t.money   "sueldo_diario",                             precision: 19, scale: 4, null: false
    t.money   "salario_diario_integrado",                  precision: 19, scale: 4, null: false
    t.money   "otras_grabadas_imss",                       precision: 19, scale: 4, null: false
    t.money   "cuota_fija",                                precision: 19, scale: 4, null: false
    t.money   "excedente_patron",                          precision: 19, scale: 4, null: false
    t.money   "excedente_trabajador",                      precision: 19, scale: 4, null: false
    t.money   "prestaciones_dinero_patron",                precision: 19, scale: 4, null: false
    t.money   "prestaciones_dinero_trabajador",            precision: 19, scale: 4, null: false
    t.money   "gastos_medicos_patron",                     precision: 19, scale: 4, null: false
    t.money   "gastos_medicos_trabajador",                 precision: 19, scale: 4, null: false
    t.money   "riesgo_trabajo",                            precision: 19, scale: 4, null: false
    t.money   "invalidez_vida_patron",                     precision: 19, scale: 4, null: false
    t.money   "invalidez_vida_trabajador",                 precision: 19, scale: 4, null: false
    t.money   "guarderia",                                 precision: 19, scale: 4, null: false
    t.money   "retiro",                                    precision: 19, scale: 4, null: false
    t.money   "cesantia_vejez_patron",                     precision: 19, scale: 4, null: false
    t.money   "cesantia_vejez_trabajador",                 precision: 19, scale: 4, null: false
    t.money   "infonavit",                                 precision: 19, scale: 4, null: false
    t.money   "neto",                                      precision: 19, scale: 4, null: false
    t.char    "grupo_nomina",                   limit: 5,                           null: false
    t.char    "folio_pago_empleados",           limit: 10,                          null: false
    t.char    "linea_produccion",               limit: 5,                           null: false
    t.money   "impuesto_estatal",                          precision: 19, scale: 4, null: false
    t.money   "percepcion_laboral",                        precision: 19, scale: 4, null: false
    t.money   "comision",                                  precision: 19, scale: 4, null: false
    t.money   "otros",                                     precision: 19, scale: 4, null: false
  end

  create_table "_mnominasConcepResp", id: false, force: :cascade do |t|
    t.char    "folio",                   limit: 10,                          null: false
    t.char    "transaccion",             limit: 5,                           null: false
    t.char    "empleado",                limit: 10,                          null: false
    t.char    "concepto_nomina",         limit: 5,                           null: false
    t.decimal "cantidad",                           precision: 19, scale: 4, null: false
    t.money   "importe",                            precision: 19, scale: 4, null: false
    t.money   "percepcion_grabada",                 precision: 19, scale: 4, null: false
    t.money   "percepcion_exenta",                  precision: 19, scale: 4, null: false
    t.money   "percepcion_grabada_imss",            precision: 19, scale: 4, null: false
    t.money   "prevision_social",                   precision: 19, scale: 4, null: false
  end

  create_table "_mnominasResp", id: false, force: :cascade do |t|
    t.char    "folio",                          limit: 10,                          null: false
    t.char    "transaccion",                    limit: 5,                           null: false
    t.char    "empleado",                       limit: 10,                          null: false
    t.decimal "dias_trabajados",                           precision: 9,  scale: 4, null: false
    t.money   "percepcion_normal",                         precision: 19, scale: 4, null: false
    t.money   "otras_grabadas",                            precision: 19, scale: 4, null: false
    t.money   "otras_exentas",                             precision: 19, scale: 4, null: false
    t.money   "credito_salario",                           precision: 19, scale: 4, null: false
    t.money   "ispt",                                      precision: 19, scale: 4, null: false
    t.money   "imss",                                      precision: 19, scale: 4, null: false
    t.money   "otras_deducciones",                         precision: 19, scale: 4, null: false
    t.money   "sueldo_diario",                             precision: 19, scale: 4, null: false
    t.money   "salario_diario_integrado",                  precision: 19, scale: 4, null: false
    t.money   "otras_grabadas_imss",                       precision: 19, scale: 4, null: false
    t.money   "cuota_fija",                                precision: 19, scale: 4, null: false
    t.money   "excedente_patron",                          precision: 19, scale: 4, null: false
    t.money   "excedente_trabajador",                      precision: 19, scale: 4, null: false
    t.money   "prestaciones_dinero_patron",                precision: 19, scale: 4, null: false
    t.money   "prestaciones_dinero_trabajador",            precision: 19, scale: 4, null: false
    t.money   "gastos_medicos_patron",                     precision: 19, scale: 4, null: false
    t.money   "gastos_medicos_trabajador",                 precision: 19, scale: 4, null: false
    t.money   "riesgo_trabajo",                            precision: 19, scale: 4, null: false
    t.money   "invalidez_vida_patron",                     precision: 19, scale: 4, null: false
    t.money   "invalidez_vida_trabajador",                 precision: 19, scale: 4, null: false
    t.money   "guarderia",                                 precision: 19, scale: 4, null: false
    t.money   "retiro",                                    precision: 19, scale: 4, null: false
    t.money   "cesantia_vejez_patron",                     precision: 19, scale: 4, null: false
    t.money   "cesantia_vejez_trabajador",                 precision: 19, scale: 4, null: false
    t.money   "infonavit",                                 precision: 19, scale: 4, null: false
    t.money   "neto",                                      precision: 19, scale: 4, null: false
    t.char    "grupo_nomina",                   limit: 5,                           null: false
    t.char    "folio_pago_empleados",           limit: 10,                          null: false
    t.char    "linea_produccion",               limit: 5,                           null: false
    t.money   "impuesto_estatal",                          precision: 19, scale: 4, null: false
    t.money   "percepcion_laboral",                        precision: 19, scale: 4, null: false
    t.money   "comision",                                  precision: 19, scale: 4, null: false
    t.money   "otros",                                     precision: 19, scale: 4, null: false
  end

  create_table "_mnominas_conceptos", id: false, force: :cascade do |t|
    t.char    "folio",                   limit: 10,                          null: false
    t.char    "transaccion",             limit: 5,                           null: false
    t.char    "empleado",                limit: 10,                          null: false
    t.char    "concepto_nomina",         limit: 5,                           null: false
    t.decimal "cantidad",                           precision: 19, scale: 4, null: false
    t.money   "importe",                            precision: 19, scale: 4, null: false
    t.money   "percepcion_grabada",                 precision: 19, scale: 4, null: false
    t.money   "percepcion_exenta",                  precision: 19, scale: 4, null: false
    t.money   "percepcion_grabada_imss",            precision: 19, scale: 4, null: false
    t.money   "prevision_social",                   precision: 19, scale: 4, null: false
  end

  create_table "_mnominasconceptos2014", id: false, force: :cascade do |t|
    t.char    "folio",                   limit: 10,                          null: false
    t.char    "transaccion",             limit: 5,                           null: false
    t.char    "empleado",                limit: 10,                          null: false
    t.char    "concepto_nomina",         limit: 5,                           null: false
    t.decimal "cantidad",                           precision: 19, scale: 4, null: false
    t.money   "importe",                            precision: 19, scale: 4, null: false
    t.money   "percepcion_grabada",                 precision: 19, scale: 4, null: false
    t.money   "percepcion_exenta",                  precision: 19, scale: 4, null: false
    t.money   "percepcion_grabada_imss",            precision: 19, scale: 4, null: false
    t.money   "prevision_social",                   precision: 19, scale: 4, null: false
  end

  create_table "_noestad", id: false, force: :cascade do |t|
    t.char "cod_prod", limit: 13, null: false
  end

  create_table "_nominas", id: false, force: :cascade do |t|
    t.char     "folio",                  limit: 10,  null: false
    t.char     "transaccion",            limit: 5,   null: false
    t.char     "grupo_nomina",           limit: 5,   null: false
    t.char     "tabla_ispt",             limit: 10,  null: false
    t.char     "tabla_subsidio",         limit: 10,  null: false
    t.char     "tabla_credito_salario",  limit: 10,  null: false
    t.datetime "fecha_inicial",                      null: false
    t.datetime "fecha_final",                        null: false
    t.char     "cod_estab",              limit: 5,   null: false
    t.datetime "fecha",                              null: false
    t.char     "usuario",                limit: 5,   null: false
    t.datetime "fecha_cancelacion"
    t.char     "usuario_cancelacion",    limit: 5
    t.varchar  "notas",                  limit: 500, null: false
    t.char     "status",                 limit: 1,   null: false
    t.char     "tipo_nomina",            limit: 1,   null: false
    t.boolean  "afecto_caja_ahorros",                null: false
    t.char     "poliza_contable",        limit: 10,  null: false
    t.char     "mesaño_poliza_contable", limit: 6,   null: false
    t.char     "tipo_poliza_contable",   limit: 5,   null: false
  end

  create_table "_nominas2014", id: false, force: :cascade do |t|
    t.char     "folio",                  limit: 10,  null: false
    t.char     "transaccion",            limit: 5,   null: false
    t.char     "grupo_nomina",           limit: 5,   null: false
    t.char     "tabla_ispt",             limit: 10,  null: false
    t.char     "tabla_subsidio",         limit: 10,  null: false
    t.char     "tabla_credito_salario",  limit: 10,  null: false
    t.datetime "fecha_inicial",                      null: false
    t.datetime "fecha_final",                        null: false
    t.char     "cod_estab",              limit: 5,   null: false
    t.datetime "fecha",                              null: false
    t.char     "usuario",                limit: 5,   null: false
    t.datetime "fecha_cancelacion"
    t.char     "usuario_cancelacion",    limit: 5
    t.varchar  "notas",                  limit: 500, null: false
    t.char     "status",                 limit: 1,   null: false
    t.char     "tipo_nomina",            limit: 1,   null: false
    t.boolean  "afecto_caja_ahorros",                null: false
    t.char     "poliza_contable",        limit: 10,  null: false
    t.char     "mesaño_poliza_contable", limit: 6,   null: false
    t.char     "tipo_poliza_contable",   limit: 5,   null: false
  end

  create_table "_nominasResp", id: false, force: :cascade do |t|
    t.char     "folio",                  limit: 10,  null: false
    t.char     "transaccion",            limit: 5,   null: false
    t.char     "grupo_nomina",           limit: 5,   null: false
    t.char     "tabla_ispt",             limit: 10,  null: false
    t.char     "tabla_subsidio",         limit: 10,  null: false
    t.char     "tabla_credito_salario",  limit: 10,  null: false
    t.datetime "fecha_inicial",                      null: false
    t.datetime "fecha_final",                        null: false
    t.char     "cod_estab",              limit: 5,   null: false
    t.datetime "fecha",                              null: false
    t.char     "usuario",                limit: 5,   null: false
    t.datetime "fecha_cancelacion"
    t.char     "usuario_cancelacion",    limit: 5
    t.varchar  "notas",                  limit: 500, null: false
    t.char     "status",                 limit: 1,   null: false
    t.char     "tipo_nomina",            limit: 1,   null: false
    t.boolean  "afecto_caja_ahorros",                null: false
    t.char     "poliza_contable",        limit: 10,  null: false
    t.char     "mesaño_poliza_contable", limit: 6,   null: false
    t.char     "tipo_poliza_contable",   limit: 5,   null: false
  end

  create_table "_prodact", id: false, force: :cascade do |t|
    t.string "NUEVO",  limit: 255
    t.string "ACTUAL", limit: 255
  end

  create_table "_prodanalogos", id: false, force: :cascade do |t|
    t.char "codigo_analogo", limit: 5, null: false
  end

  create_table "_prodestab", id: false, force: :cascade do |t|
    t.char     "cod_prod",                    limit: 13,                          null: false
    t.char     "cod_estab",                   limit: 5,                           null: false
    t.boolean  "pedir_al_proveedor",                                              null: false
    t.boolean  "pedir_a_establecimiento",                                         null: false
    t.char     "localizacion_surtido",        limit: 10,                          null: false
    t.boolean  "ubicacion_pallets",                                               null: false
    t.integer  "cama",                        limit: 2,                           null: false
    t.integer  "altura",                      limit: 2,                           null: false
    t.integer  "diseño_pallet",               limit: 1,                           null: false
    t.datetime "fecha_ultima_recepcion",                                          null: false
    t.decimal  "cantidad_ultima_recepcion",              precision: 19, scale: 4, null: false
    t.decimal  "exist_tauifu",                           precision: 19, scale: 4, null: false
    t.decimal  "exist_tauifp",                           precision: 19, scale: 4, null: false
    t.decimal  "exist_uifu",                             precision: 19, scale: 4, null: false
    t.decimal  "exist_uifp",                             precision: 19, scale: 4, null: false
    t.datetime "fecha_uif",                                                       null: false
    t.money    "costo_promedio_uif",                     precision: 19, scale: 4, null: false
    t.decimal  "exist_unidades",                         precision: 19, scale: 4, null: false
    t.decimal  "exist_piezas",                           precision: 19, scale: 4, null: false
    t.decimal  "unidades_no_disponibles",                precision: 19, scale: 4, null: false
    t.decimal  "piezas_no_disponibles",                  precision: 19, scale: 4, null: false
    t.datetime "fecha_agotado"
    t.money    "costo_promedio",                         precision: 19, scale: 4, null: false
    t.money    "ultimo_costo",                           precision: 19, scale: 4, null: false
    t.integer  "frentes",                     limit: 1
    t.integer  "fondos",                      limit: 1
    t.integer  "niveles",                     limit: 1
    t.char     "tendpvs",                     limit: 1,                           null: false
    t.char     "brm",                         limit: 1,                           null: false
    t.decimal  "pvs",                                    precision: 19, scale: 4, null: false
    t.decimal  "punto_reorden",                          precision: 19, scale: 4, null: false
    t.decimal  "dio",                                    precision: 9,  scale: 4, null: false
    t.decimal  "dmapvs",                                 precision: 19, scale: 4, null: false
    t.integer  "te",                          limit: 1,                           null: false
    t.integer  "tevar",                       limit: 1,                           null: false
    t.integer  "tr",                          limit: 1,                           null: false
    t.integer  "tep",                         limit: 1,                           null: false
    t.decimal  "nivel_servicio",                         precision: 9,  scale: 1, null: false
    t.decimal  "minimo",                                 precision: 19, scale: 4, null: false
    t.char     "tipo_minimo",                 limit: 1,                           null: false
    t.char     "metodo_ordenes_compra",       limit: 1,                           null: false
    t.char     "metodo_cuando_ordenar",       limit: 1,                           null: false
    t.char     "metodo_cuanto_ordenar",       limit: 1,                           null: false
    t.decimal  "inventario_minimo",                      precision: 19, scale: 4, null: false
    t.decimal  "inventario_maximo",                      precision: 19, scale: 4, null: false
    t.decimal  "cantidad_ordenar",                       precision: 19, scale: 4, null: false
    t.datetime "fecha_alta",                                                      null: false
    t.char     "status_producto",             limit: 5,                           null: false
    t.datetime "ultima_modificacion",                                             null: false
    t.char     "cod_estab_pedidos",           limit: 5,                           null: false
    t.boolean  "permite_existencia_negativa",                                     null: false
    t.decimal  "multiplo",                               precision: 9,  scale: 4, null: false
    t.decimal  "salidas_semana",                         precision: 19, scale: 4, null: false
    t.char     "clasificacion_productos",     limit: 5,                           null: false
    t.boolean  "Facturado",                                                       null: false
    t.char     "mueble",                      limit: 5,                           null: false
    t.integer  "nivel_mueble",                limit: 1,                           null: false
    t.integer  "posicion_mueble",             limit: 2,                           null: false
  end

  create_table "_prodestabcompleto13", id: false, force: :cascade do |t|
    t.char     "cod_prod",                    limit: 13,                          null: false
    t.char     "cod_estab",                   limit: 5,                           null: false
    t.boolean  "pedir_al_proveedor",                                              null: false
    t.boolean  "pedir_a_establecimiento",                                         null: false
    t.char     "localizacion_surtido",        limit: 10,                          null: false
    t.boolean  "ubicacion_pallets",                                               null: false
    t.integer  "cama",                        limit: 2,                           null: false
    t.integer  "altura",                      limit: 2,                           null: false
    t.integer  "diseño_pallet",               limit: 1,                           null: false
    t.datetime "fecha_ultima_recepcion",                                          null: false
    t.decimal  "cantidad_ultima_recepcion",              precision: 19, scale: 4, null: false
    t.decimal  "exist_tauifu",                           precision: 19, scale: 4, null: false
    t.decimal  "exist_tauifp",                           precision: 19, scale: 4, null: false
    t.decimal  "exist_uifu",                             precision: 19, scale: 4, null: false
    t.decimal  "exist_uifp",                             precision: 19, scale: 4, null: false
    t.datetime "fecha_uif",                                                       null: false
    t.money    "costo_promedio_uif",                     precision: 19, scale: 4, null: false
    t.decimal  "exist_unidades",                         precision: 19, scale: 4, null: false
    t.decimal  "exist_piezas",                           precision: 19, scale: 4, null: false
    t.decimal  "unidades_no_disponibles",                precision: 19, scale: 4, null: false
    t.decimal  "piezas_no_disponibles",                  precision: 19, scale: 4, null: false
    t.datetime "fecha_agotado"
    t.money    "costo_promedio",                         precision: 19, scale: 4, null: false
    t.money    "ultimo_costo",                           precision: 19, scale: 4, null: false
    t.integer  "frentes",                     limit: 1
    t.integer  "fondos",                      limit: 1
    t.integer  "niveles",                     limit: 1
    t.char     "tendpvs",                     limit: 1,                           null: false
    t.char     "brm",                         limit: 1,                           null: false
    t.decimal  "pvs",                                    precision: 19, scale: 4, null: false
    t.decimal  "punto_reorden",                          precision: 19, scale: 4, null: false
    t.decimal  "dio",                                    precision: 9,  scale: 4, null: false
    t.decimal  "dmapvs",                                 precision: 19, scale: 4, null: false
    t.integer  "te",                          limit: 1,                           null: false
    t.integer  "tevar",                       limit: 1,                           null: false
    t.integer  "tr",                          limit: 1,                           null: false
    t.integer  "tep",                         limit: 1,                           null: false
    t.decimal  "nivel_servicio",                         precision: 9,  scale: 1, null: false
    t.decimal  "minimo",                                 precision: 19, scale: 4, null: false
    t.char     "tipo_minimo",                 limit: 1,                           null: false
    t.char     "metodo_ordenes_compra",       limit: 1,                           null: false
    t.char     "metodo_cuando_ordenar",       limit: 1,                           null: false
    t.char     "metodo_cuanto_ordenar",       limit: 1,                           null: false
    t.decimal  "inventario_minimo",                      precision: 19, scale: 4, null: false
    t.decimal  "inventario_maximo",                      precision: 19, scale: 4, null: false
    t.decimal  "cantidad_ordenar",                       precision: 19, scale: 4, null: false
    t.datetime "fecha_alta",                                                      null: false
    t.char     "status_producto",             limit: 5,                           null: false
    t.datetime "ultima_modificacion",                                             null: false
    t.char     "cod_estab_pedidos",           limit: 5,                           null: false
    t.boolean  "permite_existencia_negativa",                                     null: false
    t.decimal  "multiplo",                               precision: 9,  scale: 4, null: false
    t.decimal  "salidas_semana",                         precision: 19, scale: 4, null: false
    t.char     "clasificacion_productos",     limit: 5,                           null: false
    t.boolean  "Facturado",                                                       null: false
    t.char     "mueble",                      limit: 5,                           null: false
    t.integer  "nivel_mueble",                limit: 1,                           null: false
    t.integer  "posicion_mueble",             limit: 2,                           null: false
  end

  create_table "_prodlista", id: false, force: :cascade do |t|
    t.char    "lista_precios",         limit: 10,                         null: false
    t.char    "cod_prod",              limit: 13,                         null: false
    t.decimal "porcentaje_costo_pvta",            precision: 9, scale: 4, null: false
  end

  create_table "_prodlista4", id: false, force: :cascade do |t|
    t.char    "lista_precios",         limit: 10,                         null: false
    t.char    "cod_prod",              limit: 13,                         null: false
    t.decimal "porcentaje_costo_pvta",            precision: 9, scale: 4, null: false
  end

  create_table "_prodnuevos", id: false, force: :cascade do |t|
    t.string "COD_PROD",     limit: 255
    t.string "COD_PROD_nvo", limit: 255
    t.string "DESCRIPCION",  limit: 255
    t.string "cod_prod_prv", limit: 255
    t.float  "PRECIO_LISTA"
    t.string "PROVEEDOR",    limit: 255
  end

  create_table "_prodprv", id: false, force: :cascade do |t|
    t.char     "cod_prod",                       limit: 13,                          null: false
    t.char     "cod_prv",                        limit: 10,                          null: false
    t.boolean  "proveedor_principal",                                                null: false
    t.char     "cod_prod_proveedor",             limit: 30,                          null: false
    t.varchar  "descripcion_producto_proveedor", limit: 50,                          null: false
    t.datetime "fecha_ultima_recepcion",                                             null: false
    t.decimal  "cantidad_ultima_recepcion",                 precision: 19, scale: 4, null: false
    t.money    "ultimo_costo",                              precision: 19, scale: 4, null: false
    t.datetime "fecha_alta",                                                         null: false
    t.char     "manejo_devoluciones",            limit: 5,                           null: false
    t.char     "representante",                  limit: 10,                          null: false
    t.char     "status_producto",                limit: 5,                           null: false
    t.datetime "ultima_modificacion",                                                null: false
    t.char     "unidad",                         limit: 5,                           null: false
    t.decimal  "factor_conversion",                         precision: 9,  scale: 4, null: false
    t.decimal  "nivel_servicio",                            precision: 9,  scale: 4, null: false
    t.decimal  "equivalencia_unidades_standard",            precision: 19, scale: 4, null: false
    t.decimal  "porcentaje_flete",                          precision: 9,  scale: 4, null: false
    t.money    "importe_flete",                             precision: 19, scale: 4, null: false
    t.boolean  "default_descuentos",                                                 null: false
  end

  create_table "_prodprv1", id: false, force: :cascade do |t|
    t.string "cod_prod2", limit: 255
    t.string "cod_prv2",  limit: 255
  end

  create_table "_prodprv2", id: false, force: :cascade do |t|
    t.float "cod_prod"
    t.float "cod_prv"
  end

  create_table "_prodprv3", id: false, force: :cascade do |t|
    t.float  "cod_prod"
    t.float  "cod_prv"
    t.string "F3",       limit: 255
  end

  create_table "_prodprv4", id: false, force: :cascade do |t|
    t.float  "cod_prod2"
    t.float  "cod_prv"
    t.float  "cod_prod"
    t.string "F4",        limit: 255
    t.string "F5",        limit: 255
    t.string "F6",        limit: 255
    t.string "F7",        limit: 255
    t.string "F8",        limit: 255
    t.string "F9",        limit: 255
  end

  create_table "_prodprv53", id: false, force: :cascade do |t|
    t.char     "cod_prod",                       limit: 13,                          null: false
    t.char     "cod_prv",                        limit: 10,                          null: false
    t.boolean  "proveedor_principal",                                                null: false
    t.char     "cod_prod_proveedor",             limit: 30,                          null: false
    t.varchar  "descripcion_producto_proveedor", limit: 50,                          null: false
    t.datetime "fecha_ultima_recepcion",                                             null: false
    t.decimal  "cantidad_ultima_recepcion",                 precision: 19, scale: 4, null: false
    t.money    "ultimo_costo",                              precision: 19, scale: 4, null: false
    t.datetime "fecha_alta",                                                         null: false
    t.char     "manejo_devoluciones",            limit: 5,                           null: false
    t.char     "representante",                  limit: 10,                          null: false
    t.char     "status_producto",                limit: 5,                           null: false
    t.datetime "ultima_modificacion",                                                null: false
    t.char     "unidad",                         limit: 5,                           null: false
    t.decimal  "factor_conversion",                         precision: 9,  scale: 4, null: false
    t.decimal  "nivel_servicio",                            precision: 9,  scale: 4, null: false
    t.decimal  "equivalencia_unidades_standard",            precision: 19, scale: 4, null: false
    t.decimal  "porcentaje_flete",                          precision: 9,  scale: 4, null: false
    t.money    "importe_flete",                             precision: 19, scale: 4, null: false
    t.boolean  "default_descuentos",                                                 null: false
  end

  create_table "_productos", id: false, force: :cascade do |t|
    t.string "Cod_prod",    limit: 255
    t.string "Descripcion", limit: 255
    t.string "F3",          limit: 255
    t.string "F4",          limit: 255
    t.string "F5",          limit: 255
    t.string "F6",          limit: 255
  end

  create_table "_productosPorCancelar", id: false, force: :cascade do |t|
    t.string "CODIGO",               limit: 255
    t.string "DESCRIPCION",          limit: 255
    t.string "STATUS",               limit: 255
    t.string "PROVEEDOR",            limit: 255
    t.string "NOMBRE DEL PROVEEDOR", limit: 255
    t.string "CLASIFIC",             limit: 255
  end

  create_table "_productoslista4", id: false, force: :cascade do |t|
    t.char    "lista_precios",         limit: 10,                         null: false
    t.char    "cod_prod",              limit: 13,                         null: false
    t.decimal "porcentaje_costo_pvta",            precision: 9, scale: 4, null: false
  end

  create_table "_reporte_transf", force: :cascade do |t|
    t.char    "banda",      limit: 1,   null: false
    t.char    "texto",      limit: 100, null: false
    t.char    "alineacion", limit: 1,   null: false
    t.char    "tipo",       limit: 1,   null: false
    t.integer "renglon",    limit: 1,   null: false
    t.integer "columna",    limit: 1,   null: false
    t.integer "longitud",   limit: 1,   null: false
    t.char    "formato",    limit: 25,  null: false
    t.char    "folio",      limit: 10,  null: false
  end

  create_table "_saldos_iniciales1", force: :cascade do |t|
    t.string "cuentac",        limit: 255
    t.string "DESCRIPCION",    limit: 255
    t.float  "saldo_anterior"
    t.float  "cargo_periodo"
    t.float  "abono_periodo"
    t.float  "saldo"
    t.char   "cuenta",         limit: 5
    t.char   "subcuenta",      limit: 5
    t.char   "subsubcuenta",   limit: 5
  end

  create_table "_tempMpol", id: false, force: :cascade do |t|
    t.char     "folio",                 limit: 10
    t.char     "tipo",                  limit: 5
    t.char     "mes_año",               limit: 6
    t.datetime "fecha"
    t.char     "cuenta_contable",       limit: 5,                                   null: false
    t.char     "subcuenta_contable",    limit: 5,                                   null: false
    t.char     "subsubcuenta_contable", limit: 5,                                   null: false
    t.money    "importe",                                  precision: 19, scale: 4
    t.char     "cargo_abono",           limit: 1,                                   null: false
    t.varchar  "concepto",              limit: 10,                                  null: false
    t.char     "cod_estab",             limit: 5,                                   null: false
    t.varchar  "status",                limit: 1,                                   null: false
    t.char     "area",                  limit: 5,                                   null: false
    t.char     "departamento",          limit: 5,                                   null: false
    t.text     "rowguids",              limit: 2147483647
    t.bigint   "renglon",               limit: 8
  end

  create_table "abonos_clientes", force: :cascade do |t|
    t.char     "folio",                      limit: 10,                                                 null: false
    t.char     "transaccion",                limit: 5,                                                  null: false
    t.datetime "fecha",                                                                                 null: false
    t.char     "cod_cte",                    limit: 10,                                                 null: false
    t.char     "vendedor",                   limit: 10,                                                 null: false
    t.char     "devolucion",                 limit: 10,                          default: "          ", null: false
    t.money    "importe",                               precision: 19, scale: 4, default: 0.0,          null: false
    t.char     "folio_aplicado",             limit: 10,                                                 null: false
    t.char     "transaccion_folio_aplicado", limit: 5,                                                  null: false
    t.char     "forma_pago",                 limit: 5,                                                  null: false
    t.integer  "numero_partida_pago",        limit: 2,                           default: 1,            null: false
    t.char     "folio_documento_pago",       limit: 10,                                                 null: false
    t.integer  "dias_pago",                  limit: 2,                           default: 0,            null: false
    t.char     "recibo_valores",             limit: 10,                                                 null: false
    t.char     "cod_estab",                  limit: 5,                                                  null: false
    t.char     "moneda",                     limit: 5,                                                  null: false
    t.real     "tipo_cambio",                                                                           null: false
    t.char     "razon_credito_clientes",     limit: 5,                           default: "     ",      null: false
    t.char     "status",                     limit: 5,                           default: "V    ",      null: false
    t.char     "cobrador",                   limit: 5,                           default: "     ",      null: false
    t.char     "repartidor",                 limit: 5,                           default: "     ",      null: false
  end

  add_index "abonos_clientes", ["cod_cte"], name: "cod_cte"
  add_index "abonos_clientes", ["folio", "transaccion", "numero_partida_pago"], name: "IX_abonos_clientes_folio_transaccion_npp"
  add_index "abonos_clientes", ["transaccion", "fecha"], name: "IX_abonos_clientes_transaccion_fecha"
  add_index "abonos_clientes", ["transaccion_folio_aplicado", "folio_aplicado"], name: "IX_abonos_clientes"

  create_table "abonos_prestamos_caja_ahorro", force: :cascade do |t|
    t.char     "folio",          limit: 10,                                        null: false
    t.char     "transaccion",    limit: 10,                                        null: false
    t.datetime "fecha",                                                            null: false
    t.money    "importe",                   precision: 19, scale: 4,               null: false
    t.char     "folio_prestamo", limit: 10,                                        null: false
    t.char     "status",         limit: 1,                                         null: false
    t.char     "tipo",           limit: 1,                           default: "C", null: false
  end

  create_table "abonos_proveedores", force: :cascade do |t|
    t.char     "folio",                        limit: 10,                                            null: false
    t.char     "transaccion",                  limit: 5,                                             null: false
    t.datetime "fecha",                                                                              null: false
    t.char     "cod_prv",                      limit: 10,                                            null: false
    t.money    "importe",                                 precision: 19, scale: 4, default: 0.0,     null: false
    t.char     "folio_aplicado",               limit: 15,                                            null: false
    t.char     "transaccion_folio_aplicado",   limit: 5,                                             null: false
    t.char     "forma_pago",                   limit: 5,                                             null: false
    t.integer  "numero_partida_pago",          limit: 2,                           default: 1,       null: false
    t.char     "folio_documento_pago",         limit: 10,                                            null: false
    t.char     "transaccion_documento_pago",   limit: 5,                           default: "     ", null: false
    t.char     "recibo_valores",               limit: 10,                                            null: false
    t.char     "cod_estab",                    limit: 5,                                             null: false
    t.char     "moneda",                       limit: 5,                                             null: false
    t.real     "tipo_cambio",                                                                        null: false
    t.char     "status",                       limit: 1,                           default: "V",     null: false
    t.money    "importe_descuento_financiero",            precision: 19, scale: 4, default: 0.0,     null: false
  end

  add_index "abonos_proveedores", ["cod_prv"], name: "cod_prv"
  add_index "abonos_proveedores", ["folio", "transaccion"], name: "IX_abonos_proveedores_folio_transaccion"
  add_index "abonos_proveedores", ["folio_aplicado", "transaccion_folio_aplicado", "forma_pago", "id", "cod_prv"], name: "IX_abonos_proveedores_folio_trans_aplic"

  create_table "acabados", primary_key: "acabado", force: :cascade do |t|
    t.varchar "nombre",      limit: 100,                                         null: false
    t.char    "abreviatura", limit: 5,                                           null: false
    t.money   "costo",                   precision: 19, scale: 4,                null: false
    t.char    "status",      limit: 1,                                           null: false
    t.char    "inclusion",   limit: 2,                            default: "OP", null: false
  end

  create_table "acabados_productos", primary_key: "acabado", force: :cascade do |t|
    t.char  "cod_prod", limit: 13,                          null: false
    t.money "costo",               precision: 19, scale: 4, null: false
  end

  create_table "accesorios_equipos", primary_key: "accesorio_equipos", force: :cascade do |t|
    t.char    "tipo_equipos",  limit: 5,                                          null: false
    t.varchar "nombre",        limit: 100,                                        null: false
    t.char    "status",        limit: 1,                                          null: false
    t.char    "tipo",          limit: 1,                                          null: false
    t.decimal "rango_inicial",             precision: 19, scale: 4, default: 0.0, null: false
    t.decimal "rango_final",               precision: 19, scale: 4, default: 0.0, null: false
  end

  create_table "accesorios_por_equipo", primary_key: "equipo", force: :cascade do |t|
    t.char     "accesorio_equipos", limit: 10,                                      null: false
    t.decimal  "cantidad",                     precision: 19, scale: 4,             null: false
    t.money    "valor",                        precision: 19, scale: 4,             null: false
    t.datetime "fecha",                                                             null: false
    t.char     "marca",             limit: 5,                                       null: false
    t.char     "modelo",            limit: 5,                                       null: false
    t.varchar  "serie",             limit: 20,                                      null: false
    t.varchar  "factura",           limit: 20,                                      null: false
    t.char     "cod_prv",           limit: 10,                                      null: false
    t.integer  "garantia_meses",    limit: 1,                           default: 0, null: false
    t.datetime "fecha_compra"
  end

  create_table "accesos_directos", primary_key: "usuario", force: :cascade do |t|
    t.char    "modulo",      limit: 3,          null: false
    t.char    "opcion",      limit: 10,         null: false
    t.integer "indice",      limit: 2,          null: false
    t.varchar "ruta_imagen", limit: 500,        null: false
    t.binary  "imagen",      limit: 2147483647
  end

  create_table "accesos_directos_archivos", force: :cascade do |t|
    t.char        "usuario",         limit: 5,          null: false
    t.char        "archivo_carpeta", limit: 1,          null: false
    t.varchar_max "ruta",            limit: 2147483647, null: false
    t.varchar     "descripcion",     limit: 200,        null: false
    t.integer     "orden",           limit: 2,          null: false
    t.binary      "imagen",          limit: 2147483647
  end

  create_table "acomodos_mercancia", primary_key: "acomodo_mercancia", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "acomodos_pallet", id: false, force: :cascade do |t|
    t.char    "acomodo_pallet", limit: 10,                          null: false
    t.decimal "ancho",                      precision: 9, scale: 4, null: false
    t.decimal "largo",                      precision: 9, scale: 4, null: false
    t.char    "tipo_pallet",    limit: 5,                           null: false
    t.varchar "acomodos",       limit: 500,                         null: false
    t.char    "status",         limit: 1,                           null: false
  end

  create_table "actas_administrativas_empleados", primary_key: "folio", force: :cascade do |t|
    t.datetime "fecha",                                  null: false
    t.char     "empleado",    limit: 10,                 null: false
    t.varchar  "descripcion", limit: 8000,               null: false
    t.char     "status",      limit: 1,    default: "V", null: false
  end

  create_table "actividades_ejecutadas", primary_key: "empleado", force: :cascade do |t|
    t.datetime "fecha",                                 null: false
    t.char     "cod_estab",          limit: 5,          null: false
    t.char     "actividad",          limit: 5,          null: false
    t.varchar  "descripcion",        limit: 100,        null: false
    t.datetime "fecha_alimentacion",                    null: false
    t.char     "status_ejecucion",   limit: 1,          null: false
    t.char     "hora_inicial",       limit: 5,          null: false
    t.char     "hora_final",         limit: 5,          null: false
    t.char     "duracion",           limit: 5,          null: false
    t.char     "tipo_ponderacion",   limit: 1,          null: false
    t.varchar  "notas",              limit: 500,        null: false
    t.binary   "archivo",            limit: 2147483647
    t.varchar  "archivo_nombre",     limit: 50
  end

  create_table "actividades_empleado", primary_key: "actividad_empleado", force: :cascade do |t|
    t.varchar "nombre",      limit: 50, null: false
    t.char    "abreviatura", limit: 5,  null: false
    t.char    "status",      limit: 1,  null: false
  end

  create_table "actividades_recreativas", primary_key: "actividad_recreativa", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
    t.char    "status", limit: 1,  null: false
  end

  create_table "activos_fijos", primary_key: "activo_fijo", force: :cascade do |t|
    t.datetime "fecha",                                                                                                                                                                          null: false
    t.char     "descripcion",              limit: 100,                          default: "                                                                                                    ", null: false
    t.char     "marca",                    limit: 20,                           default: "                    ",                                                                                 null: false
    t.char     "modelo",                   limit: 20,                           default: "                    ",                                                                                 null: false
    t.char     "talla",                    limit: 20,                           default: "                    ",                                                                                 null: false
    t.char     "color",                    limit: 20,                           default: "                    ",                                                                                 null: false
    t.char     "serie",                    limit: 20,                           default: "                    ",                                                                                 null: false
    t.char     "motor",                    limit: 20,                           default: "                    ",                                                                                 null: false
    t.char     "tipo_activo_fijo",         limit: 5,                            default: "     ",                                                                                                null: false
    t.char     "transaccion",              limit: 5,                                                                                                                                             null: false
    t.char     "cod_estab",                limit: 5,                            default: "     ",                                                                                                null: false
    t.char     "ubicacion",                limit: 10,                           default: "          ",                                                                                           null: false
    t.datetime "fecha_adquisicion",                                                                                                                                                              null: false
    t.money    "monto_original_inversion",             precision: 19, scale: 4, default: 0.0,                                                                                                    null: false
    t.char     "usuario",                  limit: 5,                            default: "     ",                                                                                                null: false
    t.char     "usuario_baja",             limit: 5,                            default: "     "
    t.datetime "fecha_baja"
    t.datetime "fecha_modificacion",                                                                                                                                                             null: false
    t.char     "status",                   limit: 5,                            default: "V    ",                                                                                                null: false
    t.char     "empleado",                 limit: 10,                                                                                                                                            null: false
    t.money    "deducible",                            precision: 19, scale: 4, default: 0.0,                                                                                                    null: false
    t.money    "precio_venta",                         precision: 19, scale: 4, default: 0.0,                                                                                                    null: false
    t.char     "area",                     limit: 5,                            default: "     ",                                                                                                null: false
    t.char     "departamento",             limit: 5,                            default: "     ",                                                                                                null: false
    t.money    "inpc_sexto_mes",                       precision: 19, scale: 4, default: 0.0,                                                                                                    null: false
    t.char     "folio_referencia",         limit: 10,                           default: "          ",                                                                                           null: false
    t.char     "transaccion_referencia",   limit: 5,                            default: "     ",                                                                                                null: false
  end

  create_table "adendas", primary_key: "folio", force: :cascade do |t|
    t.varchar "nombre", limit: 100, null: false
  end

  create_table "aduanas", primary_key: "aduana", force: :cascade do |t|
    t.varchar "nombre",       limit: 50,  null: false
    t.char    "abreviatura",  limit: 5,   null: false
    t.char    "pais",         limit: 5,   null: false
    t.char    "calle",        limit: 30,  null: false
    t.char    "num_exterior", limit: 10,  null: false
    t.char    "num_interior", limit: 10,  null: false
    t.char    "colonia",      limit: 30,  null: false
    t.char    "cod_postal",   limit: 6,   null: false
    t.char    "delegacion",   limit: 15,  null: false
    t.char    "pobmunedo",    limit: 50,  null: false
    t.char    "telefono1",    limit: 25,  null: false
    t.char    "telefono2",    limit: 25,  null: false
    t.char    "fax",          limit: 25,  null: false
    t.varchar "e_mail",       limit: 100, null: false
    t.char    "status",       limit: 1,   null: false
  end

  create_table "afecta_costo_recepcion_transferencia", primary_key: "cod_estab_origen", force: :cascade do |t|
    t.char    "cod_estab_destino", limit: 5, null: false
    t.boolean "costo_promedio",              null: false
    t.boolean "ultimo_costo",                null: false
  end

  create_table "afecta_inventario_pos", primary_key: "afecta_inventario_pos", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "afectaciones_conceptos_nomina", primary_key: "afectacion_concepto_nomina", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "agencias_aduanales", primary_key: "agencia_aduanal", force: :cascade do |t|
    t.varchar "nombre",         limit: 50,  null: false
    t.char    "calle",          limit: 30,  null: false
    t.char    "num_exterior",   limit: 10,  null: false
    t.char    "num_interior",   limit: 10,  null: false
    t.char    "colonia",        limit: 30,  null: false
    t.char    "cod_postal",     limit: 6,   null: false
    t.char    "delegacion",     limit: 15,  null: false
    t.varchar "pobmunedo",      limit: 50,  null: false
    t.char    "telefono1",      limit: 15,  null: false
    t.char    "telefono2",      limit: 15,  null: false
    t.char    "fax",            limit: 15,  null: false
    t.varchar "e_mail",         limit: 100, null: false
    t.varchar "agente_aduanal", limit: 50,  null: false
    t.char    "telefono",       limit: 15,  null: false
    t.char    "cod_estab",      limit: 5,   null: false
    t.char    "status",         limit: 1,   null: false
  end

  create_table "agenda", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion", limit: 5,   null: false
    t.char     "usuario",     limit: 5,   null: false
    t.datetime "fecha",                   null: false
    t.varchar  "nombre",      limit: 50,  null: false
    t.varchar  "actividad",   limit: 500, null: false
    t.char     "status",      limit: 1,   null: false
  end

  create_table "agrupaciones_conceptos_nomina", primary_key: "agrupacion_concepto_nomina", force: :cascade do |t|
    t.varchar "nombre",      limit: 80, null: false
    t.char    "afectacion",  limit: 1,  null: false
    t.char    "abreviatura", limit: 5,  null: false
    t.char    "status",      limit: 1,  null: false
  end

  create_table "agrupaciones_rutas", primary_key: "agrupacion_ruta", force: :cascade do |t|
    t.char "transaccion",  limit: 5,                    null: false
    t.char "nombre",       limit: 50,                   null: false
    t.char "abreviatura",  limit: 10,                   null: false
    t.char "status",       limit: 1,                    null: false
    t.char "lista_minima", limit: 5,  default: "     ", null: false
  end

  create_table "agrupaciones_surtido", primary_key: "folio", force: :cascade do |t|
    t.datetime "fecha",                                           null: false
    t.char     "cod_estab",           limit: 5,                   null: false
    t.char     "usuario",             limit: 5,                   null: false
    t.datetime "fecha_cancelacion"
    t.char     "usuario_cancelacion", limit: 5
    t.char     "status",              limit: 1,                   null: false
    t.char     "cortina",             limit: 5, default: "     ", null: false
  end

  create_table "agrupado", primary_key: "campo_codigo", force: :cascade do |t|
    t.varchar "tabla_parent",          limit: 30,                  null: false
    t.varchar "campo_principal",       limit: 50,  default: "",    null: false
    t.varchar "Nombre",                limit: 30
    t.varchar "select_nombre",         limit: 100
    t.boolean "uso_cartera_provee",                default: false, null: false
    t.boolean "uso_destajo",                       default: false, null: false
    t.varchar "campo_llave_agrupado",  limit: 100, default: "",    null: false
    t.boolean "uso_ventas",                        default: false, null: false
    t.boolean "uso_ventas_exclusivo",              default: false, null: false
    t.boolean "uso_compras",                       default: false, null: false
    t.boolean "uso_compras_exclusivo",             default: false, null: false
    t.boolean "uso_inventario",                    default: false, null: false
    t.boolean "uso_equipos",                       default: false, null: false
    t.boolean "uso_cobranza",                      default: false, null: false
  end

  create_table "alertas", primary_key: "codigo", force: :cascade do |t|
    t.char     "transaccion",    limit: 5,   null: false
    t.char     "en_transaccion", limit: 5,   null: false
    t.char     "cod_estab",      limit: 5,   null: false
    t.char     "operacion",      limit: 1,   null: false
    t.datetime "fecha_inicial",              null: false
    t.datetime "fecha_final",                null: false
    t.varchar  "alerta",         limit: 200, null: false
  end

  create_table "alimentacion_conceptos_incentivos", force: :cascade do |t|
    t.char     "concepto_incentivo", limit: 5,                          null: false
    t.char     "codigo",             limit: 10,                         null: false
    t.char     "transaccion",        limit: 5,                          null: false
    t.datetime "fecha",                                                 null: false
    t.decimal  "puntos",                        precision: 9, scale: 1, null: false
  end

  create_table "alimentacion_conceptos_nomina", primary_key: "empleado", force: :cascade do |t|
    t.char    "concepto", limit: 5,                                        null: false
    t.decimal "cantidad",           precision: 19, scale: 4,               null: false
    t.char    "tipo",     limit: 1,                          default: "N", null: false
  end

  create_table "alimentacion_nomina", primary_key: "empleado", force: :cascade do |t|
    t.char    "concepto",           limit: 5,                                                  null: false
    t.decimal "cantidad",                      precision: 19, scale: 4,                        null: false
    t.char    "forma_alimentacion", limit: 1,                           default: " ",          null: false
    t.char    "folio_origen",       limit: 10,                          default: "          ", null: false
    t.char    "tipo",               limit: 1,                           default: "N",          null: false
    t.money   "importe",                       precision: 19, scale: 4, default: 0.0,          null: false
  end

  create_table "alimentacion_nomina_checador", primary_key: "fecha", force: :cascade do |t|
    t.char    "empleado",          limit: 10,                           null: false
    t.char    "concepto",          limit: 5,                            null: false
    t.money   "cantidad_original",             precision: 19, scale: 4, null: false
    t.money   "cantidad",                      precision: 19, scale: 4, null: false
    t.char    "usuario",           limit: 5,                            null: false
    t.varchar "notas",             limit: 100,                          null: false
  end

  create_table "alimentacion_saldos_iniciales_contables", primary_key: "cuenta_contable", force: :cascade do |t|
    t.char  "subcuenta_contable",    limit: 5,                                            null: false
    t.char  "subsubcuenta_contable", limit: 5,                                            null: false
    t.money "saldo_inicial",                   precision: 19, scale: 4,                   null: false
    t.char  "cod_estab",             limit: 5,                          default: "     ", null: false
  end

  create_table "analisis_contable", primary_key: "folio", force: :cascade do |t|
    t.varchar  "nombre",  limit: 100, null: false
    t.datetime "fecha",               null: false
    t.char     "usuario", limit: 5,   null: false
  end

  create_table "analisis_contable_cuentas", primary_key: "folio", force: :cascade do |t|
    t.char "renglon",      limit: 3, null: false
    t.char "cuenta",       limit: 5, null: false
    t.char "subcuenta",    limit: 5, null: false
    t.char "subsubcuenta", limit: 5, null: false
  end

  create_table "analisis_contable_renglones", primary_key: "folio", force: :cascade do |t|
    t.char    "renglon",      limit: 3,   null: false
    t.varchar "concepto",     limit: 100, null: false
    t.char    "tipo_renglon", limit: 1,   null: false
    t.char    "operador1",    limit: 1,   null: false
    t.char    "renglon1",     limit: 3,   null: false
    t.char    "operador2",    limit: 1,   null: false
    t.char    "renglon2",     limit: 3,   null: false
    t.char    "operador3",    limit: 1,   null: false
    t.char    "renglon3",     limit: 3,   null: false
    t.char    "operador4",    limit: 1,   null: false
    t.char    "renglon4",     limit: 3,   null: false
    t.char    "operador5",    limit: 1,   null: false
    t.char    "renglon5",     limit: 3,   null: false
    t.char    "operador6",    limit: 1,   null: false
    t.char    "renglon6",     limit: 3,   null: false
    t.char    "operador7",    limit: 1,   null: false
    t.char    "renglon7",     limit: 3,   null: false
    t.char    "operador8",    limit: 1,   null: false
    t.char    "renglon8",     limit: 3,   null: false
    t.char    "operador9",    limit: 1,   null: false
    t.char    "renglon9",     limit: 3,   null: false
    t.char    "operador10",   limit: 1,   null: false
    t.char    "renglon10",    limit: 3,   null: false
  end

  create_table "analisis_contable_tipos_renglon", primary_key: "tipo_renglon", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "analisis_nuevos_productos", primary_key: "folio", force: :cascade do |t|
    t.char     "solicitante",              limit: 5,                                              null: false
    t.char     "transaccion_solicitante",  limit: 5,                                              null: false
    t.char     "cod_prod",                 limit: 13,                                             null: false
    t.varchar  "descripcion",              limit: 60,                                             null: false
    t.money    "precio_venta",                         precision: 19, scale: 4,                   null: false
    t.decimal  "contenido",                            precision: 19, scale: 8,                   null: false
    t.char     "ua",                       limit: 5,                                              null: false
    t.money    "precio_venta_ua",                      precision: 19, scale: 4,                   null: false
    t.decimal  "contenido_ua",                         precision: 19, scale: 8,                   null: false
    t.char     "unidad_ua",                limit: 5,                                              null: false
    t.money    "costo",                                precision: 19, scale: 4,                   null: false
    t.datetime "fecha_requerida",                                                                 null: false
    t.datetime "fecha_estimada_recepcion",                                                        null: false
    t.decimal  "cantidad_requerida",                   precision: 19, scale: 4,                   null: false
    t.char     "cod_prv",                  limit: 10,                                             null: false
    t.boolean  "unica_venta",                                                                     null: false
    t.char     "comprador",                limit: 5,                                              null: false
    t.varchar  "notas_ventas",             limit: 500,                                            null: false
    t.varchar  "notas_compras",            limit: 500,                                            null: false
    t.boolean  "autorizado",                                                                      null: false
    t.char     "status",                   limit: 1,                                              null: false
    t.char     "tipo_minimo",              limit: 5,                            default: "     ", null: false
    t.money    "minimo",                               precision: 19, scale: 4, default: 0.0
    t.datetime "fecha",                                                                           null: false
    t.char     "usuario_autorizacion",     limit: 5
  end

  create_table "analisis_nuevos_productos_cuota", primary_key: "folio", force: :cascade do |t|
    t.char    "codigo",        limit: 5,                          null: false
    t.char    "transaccion",   limit: 5,                          null: false
    t.decimal "cantidad",                precision: 19, scale: 4, null: false
    t.char    "tipo_cantidad", limit: 1,                          null: false
    t.char    "periodo",       limit: 1,                          null: false
  end

  create_table "analisis_nuevos_productos_similares", primary_key: "folio", force: :cascade do |t|
    t.char    "cod_prod",       limit: 13,                          null: false
    t.decimal "disponible",                precision: 19, scale: 4, null: false
    t.decimal "pvs",                       precision: 19, scale: 4, null: false
    t.money   "costo_promedio",            precision: 19, scale: 4, null: false
    t.money   "ultimo_costo",              precision: 19, scale: 4, null: false
  end

  create_table "anticipos_empleados", force: :cascade do |t|
    t.char     "empleado",            limit: 10,                          null: false
    t.datetime "fecha",                                                   null: false
    t.char     "concepto_nomina",     limit: 5,                           null: false
    t.money    "importe",                        precision: 19, scale: 4, null: false
    t.char     "usuario",             limit: 5,                           null: false
    t.char     "status",              limit: 1,                           null: false
    t.datetime "fecha_cancelacion"
    t.char     "usuario_cancelacion", limit: 5
    t.char     "nomina",              limit: 10
  end

  create_table "anticipos_proveedores", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion",                 limit: 5,                                                  null: false
    t.char     "cod_prv",                     limit: 10,                                                 null: false
    t.datetime "fecha",                                                                                  null: false
    t.money    "importe",                                precision: 19, scale: 4,                        null: false
    t.money    "importe_aplicado",                       precision: 19, scale: 4,                        null: false
    t.char     "razon_anticipos_proveedores", limit: 5,                                                  null: false
    t.char     "status",                      limit: 1,                                                  null: false
    t.datetime "fecha_cancelacion"
    t.char     "folio_origen",                limit: 10,                          default: "          ", null: false
    t.char     "transaccion_origen",          limit: 5,                           default: "     ",      null: false
    t.datetime "fecha_deposito",                                                                         null: false
    t.money    "iva",                                    precision: 19, scale: 4, default: 0.0,          null: false
  end

  create_table "aplica_comisiones", id: false, force: :cascade do |t|
    t.char "aplica_sobre", limit: 1,  null: false
    t.char "nombre",       limit: 30, null: false
    t.char "status",       limit: 1,  null: false
  end

  create_table "aplica_planes_compras", primary_key: "aplica_planes_compras", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "aplicabilidad_aportaciones", primary_key: "aplicabilidad", force: :cascade do |t|
    t.varchar "nombre",      limit: 50, null: false
    t.boolean "proveedores",            null: false
    t.boolean "clientes",               null: false
  end

  create_table "aplicacion_conceptos_nomina", primary_key: "aplicacion_concepto_nomina", force: :cascade do |t|
    t.varchar "nombre", limit: 70, null: false
  end

  create_table "aplicacion_prorrateo_gastos", force: :cascade do |t|
    t.char    "folio",          limit: 10,                null: false
    t.char    "transaccion",    limit: 5,                 null: false
    t.integer "porcentaje",     limit: 1,   default: 100, null: false
    t.varchar "filtro",         limit: 200,               null: false
    t.varchar "filtro_usuario", limit: 200, default: "",  null: false
  end

  create_table "aplicaciones_costos_indirectos", primary_key: "aplicacion_costos_indirectos", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "aplicaciones_costos_indirectos_producto", primary_key: "concepto_costos_indirectos", force: :cascade do |t|
    t.char    "cod_prod",   limit: 13, null: false
    t.integer "porcentaje", limit: 1,  null: false
  end

  create_table "aplicaciones_destajo", primary_key: "aplicacion_destajo", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "aplicaciones_gastos_compras", primary_key: "aplicacion_gastos_compras", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "aplicaciones_gastos_transporte", id: false, force: :cascade do |t|
    t.char "aplicacion_gastos_transporte", limit: 1,  null: false
    t.char "nombre",                       limit: 30, null: false
    t.char "status",                       limit: 1,  null: false
  end

  create_table "aplicaciones_pago", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion",              limit: 5,                               null: false
    t.char     "folio_asignacion_cajeros", limit: 10,  default: "          ",      null: false
    t.datetime "fecha",                                                            null: false
    t.char     "usuario",                  limit: 5,                               null: false
    t.char     "cod_estab",                limit: 5,                               null: false
    t.varchar  "filtro_usuario",           limit: 500
    t.char     "relacion_cobranza",        limit: 10,                              null: false
    t.datetime "fecha_cancelacion"
    t.char     "usuario_cancelacion",      limit: 5
    t.varchar  "notas",                    limit: 200, default: "",                null: false
    t.char     "status",                   limit: 1,                               null: false
    t.datetime "ultima_modificacion",                                              null: false
    t.char     "recibo_caja",              limit: 10,  default: "          ",      null: false
    t.char     "tipo_atencion",            limit: 1,   default: "A",               null: false
    t.varchar  "filtro",                   limit: 500, default: "",                null: false
    t.char     "referencia",               limit: 15,  default: "               ", null: false
    t.boolean  "fiscal",                               default: true,              null: false
    t.datetime "fecha_liquidacion"
    t.char     "embarque",                 limit: 10,  default: "          ",      null: false
  end

  add_index "aplicaciones_pago", ["fecha"], name: "fecha"

  create_table "aplicaciones_razones_credito_clientes", primary_key: "aplicacion_razones_credito_clientes", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "aplicaciones_saldos_afavor", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion",         limit: 5,                null: false
    t.datetime "fecha",                                        null: false
    t.char     "cod_cte",             limit: 10,               null: false
    t.char     "usuario",             limit: 10,               null: false
    t.char     "usuario_cancelacion", limit: 10
    t.datetime "fecha_cancelacion"
    t.char     "cod_estab",           limit: 5,                null: false
    t.varchar  "notas",               limit: 200, default: "", null: false
    t.char     "status",              limit: 1,                null: false
    t.datetime "ultima_modificacion",                          null: false
  end

  create_table "aportaciones", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion",    limit: 5,                                                    null: false
    t.datetime "fecha",                                                                       null: false
    t.char     "cod_prv",        limit: 10,                                                   null: false
    t.char     "cod_estab",      limit: 5,                                                    null: false
    t.varchar  "descripcion",    limit: 200,                                                  null: false
    t.char     "razon",          limit: 2,                                                    null: false
    t.money    "importe",                     precision: 19, scale: 4,                        null: false
    t.char     "aplicabilidad",  limit: 2,                                                    null: false
    t.datetime "fecha_inicial",                                                               null: false
    t.datetime "fecha_final",                                                                 null: false
    t.money    "cuota",                       precision: 19, scale: 4,                        null: false
    t.char     "tipo_cuota",     limit: 1,                                                    null: false
    t.char     "status",         limit: 1,                                                    null: false
    t.varchar  "filtro",         limit: 1000,                                                 null: false
    t.varchar  "filtro_usuario", limit: 1000,                                                 null: false
    t.boolean  "aplicada",                                                                    null: false
    t.varchar  "notas",          limit: 200,                           default: "",           null: false
    t.char     "ejecutivo",      limit: 10,                            default: "          ", null: false
    t.char     "aplica_sobre",   limit: 1,                             default: "R",          null: false
  end

  create_table "aportaciones_otorgadas", primary_key: "folio", force: :cascade do |t|
    t.char "transaccion",           limit: 5,  null: false
    t.char "folio_documento",       limit: 10, null: false
    t.char "transaccion_documento", limit: 5,  null: false
  end

  create_table "aranceles_productos", primary_key: "pais", force: :cascade do |t|
    t.char    "cod_prod",           limit: 13,                         null: false
    t.decimal "porcentaje_arancel",            precision: 9, scale: 4, null: false
  end

  create_table "areas_ranchos", primary_key: "area_rancho", force: :cascade do |t|
    t.varchar "nombre",      limit: 100, null: false
    t.char    "abreviatura", limit: 10,  null: false
    t.char    "status",      limit: 1,   null: false
  end

  create_table "areas_servicio_clientes", primary_key: "area_servicio_clientes", force: :cascade do |t|
    t.varchar "nombre",                  limit: 50, null: false
    t.char    "abreviatura",             limit: 5,  null: false
    t.char    "grupo_servicio_clientes", limit: 5,  null: false
    t.char    "status",                  limit: 1,  null: false
  end

  create_table "aretes_ganado", primary_key: "arete", force: :cascade do |t|
    t.char     "arete_propio",      limit: 20,                                                            null: false
    t.datetime "fecha",                                                                                   null: false
    t.char     "entrada",           limit: 10,                                                            null: false
    t.integer  "partida",           limit: 2,                                                             null: false
    t.char     "especie",           limit: 5,                                                             null: false
    t.char     "raza",              limit: 5,                                                             null: false
    t.char     "clase_especie",     limit: 5,                                                             null: false
    t.char     "sexo",              limit: 1,                                                             null: false
    t.char     "color",             limit: 5,                                                             null: false
    t.decimal  "peso",                          precision: 19, scale: 4,                                  null: false
    t.char     "corral",            limit: 5,                                                             null: false
    t.char     "lote_engorda",      limit: 10,                                                            null: false
    t.datetime "fecha_ingreso",                                                                           null: false
    t.char     "salida",            limit: 10,                                                            null: false
    t.datetime "fecha_salida",                                                                            null: false
    t.varchar  "notas",             limit: 200,                                                           null: false
    t.char     "usuario",           limit: 5,                                                             null: false
    t.char     "status",            limit: 1,                                                             null: false
    t.decimal  "canal_izquierdo",               precision: 19, scale: 4,                                  null: false
    t.decimal  "canal_derecho",                 precision: 19, scale: 4,                                  null: false
    t.decimal  "cabeza",                        precision: 19, scale: 4,                                  null: false
    t.decimal  "piel",                          precision: 19, scale: 4,                                  null: false
    t.decimal  "viscera_roja",                  precision: 19, scale: 4,                                  null: false
    t.decimal  "viscera_verde",                 precision: 19, scale: 4,                                  null: false
    t.decimal  "sangre",                        precision: 19, scale: 4,                                  null: false
    t.char     "lote_anterior",     limit: 10,                           default: "          ",           null: false
    t.char     "arete_electronico", limit: 20,                           default: "                    ", null: false
  end

  create_table "aromas", primary_key: "aroma", force: :cascade do |t|
    t.char "nombre",      limit: 30,                   null: false
    t.char "abreviatura", limit: 3,                    null: false
    t.char "status",      limit: 5,                    null: false
    t.char "jerarquia",   limit: 5,  default: "     ", null: false
  end

  create_table "arqueo_cartera", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion", limit: 5,   null: false
    t.char     "origen",      limit: 1,   null: false
    t.datetime "fecha",                   null: false
    t.char     "usuario",     limit: 5,   null: false
    t.char     "cod_estab",   limit: 5,   null: false
    t.varchar  "notas",       limit: 100, null: false
  end

  create_table "articulos_anuncios", primary_key: "folio", force: :cascade do |t|
    t.char     "tipo",          limit: 1,    null: false
    t.varchar  "titulo",        limit: 100,  null: false
    t.datetime "fecha",                      null: false
    t.datetime "fecha_inicial",              null: false
    t.datetime "fecha_final"
    t.varchar  "contenido",     limit: 7500, null: false
    t.char     "usuario",       limit: 5,    null: false
    t.char     "status",        limit: 1,    null: false
    t.char     "cod_estab",     limit: 5,    null: false
  end

  create_table "asignacion_carga_repartidores", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion", limit: 5,  null: false
    t.char     "repartidor",  limit: 5,  null: false
    t.datetime "fecha",                  null: false
    t.integer  "orden",       limit: 2,  null: false
    t.varchar  "notas",       limit: 50, null: false
  end

  create_table "asignacion_materiales_ordenes_servicio", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion",         limit: 5,                           null: false
    t.datetime "fecha",                                                   null: false
    t.char     "orden_servicio",      limit: 10,                          null: false
    t.money    "importe",                        precision: 19, scale: 4, null: false
    t.money    "iva",                            precision: 19, scale: 4, null: false
    t.decimal  "unidades",                       precision: 19, scale: 4, null: false
    t.decimal  "peso",                           precision: 19, scale: 4, null: false
    t.decimal  "volumen",                        precision: 19, scale: 4, null: false
    t.char     "usuario",             limit: 5,                           null: false
    t.datetime "fecha_cancelacion"
    t.char     "usuario_cancelacion", limit: 5
    t.char     "cod_estab",           limit: 5,                           null: false
    t.char     "status",              limit: 1,                           null: false
  end

  create_table "asignacion_usuarios_cajeros_mostrador", force: :cascade do |t|
    t.char     "usuario",       limit: 5, null: false
    t.char     "cod_estab",     limit: 5, null: false
    t.datetime "fecha_inicial",           null: false
    t.datetime "fecha_final",             null: false
  end

  create_table "asignaciones_cajeros_empleados", force: :cascade do |t|
    t.char     "folio",    limit: 10,  null: false
    t.datetime "fecha",                null: false
    t.char     "empleado", limit: 10,  null: false
    t.varchar  "notas",    limit: 200, null: false
  end

  add_index "asignaciones_cajeros_empleados", ["folio"], name: "IX_asignaciones_cajeros_empleados_folio"

  create_table "asignaciones_equipos_empleados", primary_key: "folio", force: :cascade do |t|
    t.char     "equipo",              limit: 10,                           null: false
    t.char     "empleado",            limit: 10,                           null: false
    t.char     "tipo_destino",        limit: 5,                            null: false
    t.varchar  "domicilio",           limit: 100,                          null: false
    t.datetime "fecha",                                                    null: false
    t.datetime "fecha_inicial",                                            null: false
    t.datetime "fecha_final",                                              null: false
    t.integer  "lectura_inicial",     limit: 4,                            null: false
    t.integer  "lectura_final",       limit: 4,                            null: false
    t.integer  "combustible_inicial", limit: 4,                            null: false
    t.integer  "relleno_combustible", limit: 4,                            null: false
    t.integer  "combustible_final",   limit: 4,                            null: false
    t.money    "cargo",                           precision: 19, scale: 4, null: false
    t.money    "reembolso",                       precision: 19, scale: 4, null: false
    t.varchar  "asunto",              limit: 200,                          null: false
    t.varchar  "notas",               limit: 200,                          null: false
    t.char     "cod_estab",           limit: 5,                            null: false
    t.char     "status",              limit: 1,                            null: false
  end

  create_table "asuntos_llamadas_telefonicas", primary_key: "asunto_llamadas_telefonicas", force: :cascade do |t|
    t.varchar "nombre",      limit: 50,                null: false
    t.char    "abreviatura", limit: 10,                null: false
    t.char    "status",      limit: 1,                 null: false
    t.varchar "notas",       limit: 1000, default: "", null: false
  end

  create_table "asuntos_reportes_servicio", primary_key: "folio", force: :cascade do |t|
    t.varchar "nombre",           limit: 100, null: false
    t.varchar "accion",           limit: 100, null: false
    t.integer "tiempo_respuesta", limit: 2,   null: false
    t.char    "tipo_tiempo",      limit: 1,   null: false
    t.char    "cod_estab",        limit: 5,   null: false
    t.char    "area",             limit: 5,   null: false
    t.char    "departamento",     limit: 5,   null: false
    t.char    "puesto",           limit: 10,  null: false
    t.char    "abreviatura",      limit: 10,  null: false
    t.char    "status",           limit: 1,   null: false
  end

  create_table "autogestiones", primary_key: "folio", force: :cascade do |t|
    t.varchar "nombre",            limit: 100,                 null: false
    t.varchar "tabla_resultados",  limit: 50,  default: "",    null: false
    t.varchar "tabla_origen",      limit: 50,  default: "",    null: false
    t.varchar "campos_no_filtro",  limit: 50,  default: "",    null: false
    t.varchar "filtro_presentado", limit: 50,  default: "",    null: false
    t.boolean "presentado_por",                default: false, null: false
  end

  create_table "autogestiones_transacciones", primary_key: "folio", force: :cascade do |t|
    t.varchar "nombre",                limit: 50, null: false
    t.char    "transaccion",           limit: 5,  null: false
    t.char    "operacion",             limit: 1,  null: false
    t.char    "tipo_tiempo",           limit: 1,  null: false
    t.integer "tiempo_respuesta1",     limit: 2,  null: false
    t.integer "tiempo_respuesta2",     limit: 2,  null: false
    t.char    "transaccion_respuesta", limit: 5,  null: false
    t.char    "operacion_respuesta",   limit: 1,  null: false
    t.char    "folio_respuesta",       limit: 1,  null: false
    t.char    "transaccion_termina",   limit: 5,  null: false
    t.char    "operacion_termina",     limit: 1,  null: false
    t.char    "folio_termina",         limit: 1,  null: false
  end

  create_table "autogestiones_transacciones_operaciones", force: :cascade do |t|
    t.char     "folio",                     limit: 10, null: false
    t.char     "transaccion",               limit: 5,  null: false
    t.char     "operacion",                 limit: 1,  null: false
    t.datetime "fecha",                                null: false
    t.char     "folio_origen",              limit: 10, null: false
    t.char     "transaccion_origen",        limit: 5,  null: false
    t.char     "operacion_origen",          limit: 1,  null: false
    t.datetime "fecha_aviso_no_respuesta1",            null: false
    t.datetime "fecha_aviso_no_respuesta2",            null: false
    t.boolean  "terminada",                            null: false
    t.datetime "fecha_terminada"
  end

  create_table "autored_bitacora_repartidores", primary_key: "NUMERO_DE_VIAJE", force: :cascade do |t|
    t.varchar  "MATRICULA",                 limit: 10,                                         null: false
    t.varchar  "ID_DEL_REPARTIDOR",         limit: 10,                                         null: false
    t.varchar  "NOMBRE_DEL_REPARTIDOR",     limit: 100,                                        null: false
    t.varchar  "DESTINOS",                  limit: 500,                                        null: false
    t.varchar  "HORA_DE_SALIDA",            limit: 50,                                         null: false
    t.varchar  "HORA_PROPUESTA_DE_LLEGADA", limit: 50,                                         null: false
    t.varchar  "HORA_DE_LLEGADA",           limit: 50,                                         null: false
    t.boolean  "MALCLIMA",                                                                     null: false
    t.integer  "RETRASO",                   limit: 4,                                          null: false
    t.integer  "DURACION_DEL_VIAJE",        limit: 4,                                          null: false
    t.money    "COMISION",                              precision: 19, scale: 4,               null: false
    t.datetime "FECHA",                                                                        null: false
    t.varchar  "NOTAS",                     limit: 500,                                        null: false
    t.money    "Kilometraje",                           precision: 19, scale: 4, default: 0.0, null: false
  end

  create_table "autored_cuotas_ventas", primary_key: "transaccion", force: :cascade do |t|
    t.char    "codigo", limit: 10,                          null: false
    t.integer "mes",    limit: 2,                           null: false
    t.integer "año",    limit: 4,                           null: false
    t.money   "cuota",             precision: 19, scale: 4, null: false
  end

  create_table "autorizacion_pedidos", primary_key: "autorizacion_pedido", force: :cascade do |t|
    t.varchar "nombre",        limit: 50,                 null: false
    t.char    "abreviatura",   limit: 5,                  null: false
    t.char    "status",        limit: 1,                  null: false
    t.boolean "valor_default",            default: false, null: false
  end

  create_table "autorizaciones_bancarias", primary_key: "folio", force: :cascade do |t|
    t.char        "transaccion",         limit: 5,                                                        null: false
    t.char        "usuario",             limit: 5,                                                        null: false
    t.char        "cod_estab",           limit: 5,                                                        null: false
    t.char        "equipo",              limit: 5,                                                        null: false
    t.varchar     "codigo_autorizacion", limit: 50,                                                       null: false
    t.money       "monto",                                  precision: 19, scale: 4,                      null: false
    t.varchar     "numero_tarjeta",      limit: 50,                                                       null: false
    t.varchar     "tarjetahabiente",     limit: 150,                                                      null: false
    t.varchar     "fecha_expiracion",    limit: 50,                                                       null: false
    t.varchar     "tipo_operacion",      limit: 50,                                                       null: false
    t.varchar     "tipo_tarjeta",        limit: 50,                                                       null: false
    t.varchar     "banco_emisor",        limit: 50,                                                       null: false
    t.varchar     "fecha_autorizacion",  limit: 50,                                                       null: false
    t.varchar     "arqc",                limit: 50,                                                       null: false
    t.boolean     "contable",                                                        default: false,      null: false
    t.varchar     "terminal",            limit: 50,                                  default: "",         null: false
    t.varchar     "afiliacion",          limit: 50,                                  default: "",         null: false
    t.varchar     "numero_control",      limit: 50,                                  default: "",         null: false
    t.varchar     "aid",                 limit: 50,                                  default: "",         null: false
    t.varchar     "tvr",                 limit: 50,                                  default: "",         null: false
    t.varchar     "tsi",                 limit: 50,                                  default: "",         null: false
    t.varchar     "apn",                 limit: 50,                                  default: "",         null: false
    t.boolean     "firma_electornica",                                               default: false,      null: false
    t.varchar_max "tags_emv",            limit: 2147483647,                          default: "",         null: false
    t.boolean     "autorizado",                                                      default: true,       null: false
    t.varchar     "resultado",           limit: 50,                                  default: "APROBADA", null: false
    t.varchar_max "error",               limit: 2147483647,                          default: "",         null: false
    t.varchar     "metodo_entrada",      limit: 50,                                  default: "",         null: false
    t.varchar     "mensaje",             limit: 200,                                 default: "",         null: false
    t.char        "tipo_periferico",     limit: 1,                                   default: " ",        null: false
    t.varchar     "operacion",           limit: 50,                                  default: "",         null: false
    t.varchar     "referencia",          limit: 50,                                  default: "",         null: false
    t.varchar     "referencia_original", limit: 50,                                  default: "",         null: false
    t.datetime    "fecha",                                                                                null: false
  end

  create_table "autorizaciones_usuarios", id: false, force: :cascade do |t|
    t.char     "folio",                limit: 10,  null: false
    t.char     "transaccion",          limit: 5,   null: false
    t.char     "operacion",            limit: 1,   null: false
    t.datetime "fecha",                            null: false
    t.char     "usuario",              limit: 5,   null: false
    t.char     "usuario_autorizacion", limit: 5,   null: false
    t.varchar  "datos",                limit: 200, null: false
  end

  add_index "autorizaciones_usuarios", ["folio", "transaccion", "operacion"], name: "IX_autorizaciones_usuarios_folio_transaccion_operacion"

  create_table "avisos_mensajes_nuevos", primary_key: "aviso_mensajes_nuevos", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "años_equipos", primary_key: "año_equipos", force: :cascade do |t|
  end

  create_table "back_order_depurado", id: false, force: :cascade do |t|
    t.char     "folio",       limit: 10,                                                 null: false
    t.char     "transaccion", limit: 5,                                                  null: false
    t.datetime "fecha",                                                                  null: false
    t.char     "cod_prod",    limit: 13,                                                 null: false
    t.decimal  "cantidad",               precision: 19, scale: 4,                        null: false
    t.char     "unidad",      limit: 1,                                                  null: false
    t.char     "usuario",     limit: 5,                                                  null: false
    t.char     "cod_cte",     limit: 10,                          default: "          ", null: false
    t.boolean  "comprar",                                         default: false,        null: false
  end

  create_table "bancos", primary_key: "banco", force: :cascade do |t|
    t.char    "nombre",                 limit: 30,                    null: false
    t.char    "abreviatura",            limit: 15,                    null: false
    t.char    "calle",                  limit: 50,                    null: false
    t.char    "num_interior",           limit: 10,                    null: false
    t.char    "num_exterior",           limit: 10,                    null: false
    t.char    "colonia",                limit: 30,                    null: false
    t.char    "pobmunedo",              limit: 50,                    null: false
    t.char    "pais",                   limit: 5,   default: "     ", null: false
    t.char    "estado",                 limit: 5,   default: "     ", null: false
    t.char    "municipio",              limit: 5,   default: "     ", null: false
    t.char    "poblacion",              limit: 5,   default: "     ", null: false
    t.char    "cod_postal",             limit: 6,                     null: false
    t.char    "tel1",                   limit: 16,                    null: false
    t.char    "tel2",                   limit: 16,                    null: false
    t.varchar "e_mail",                 limit: 100,                   null: false
    t.varchar "pagina_web",             limit: 100,                   null: false
    t.char    "formato_ficha",          limit: 10,                    null: false
    t.char    "status",                 limit: 5,                     null: false
    t.char    "codigo_banco_recepctor", limit: 3,   default: "   ",   null: false
    t.char    "codigo_banco_receptor",  limit: 3,   default: "   ",   null: false
    t.varchar "clave_fiscal",           limit: 5,   default: "",      null: false
  end

  create_table "bases_interes", primary_key: "base_interes", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "bases_prorrateo", id: false, force: :cascade do |t|
    t.char    "base_prorrateo", limit: 1,  null: false
    t.varchar "nombre",         limit: 50, null: false
    t.char    "abreviatura",    limit: 3,  null: false
    t.char    "status",         limit: 1,  null: false
  end

  create_table "bases_recurso", primary_key: "base_recurso", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "bitacora_bms", id: false, force: :cascade do |t|
    t.datetime "fecha",                         null: false
    t.varchar  "equipo",             limit: 50, null: false
    t.char     "usuario",            limit: 5,  null: false
    t.char     "cod_estab",          limit: 5,  null: false
    t.varchar  "folio",              limit: 30, null: false
    t.char     "transaccion",        limit: 15
    t.char     "operacion_bitacora", limit: 1,  null: false
  end

  add_index "bitacora_bms", ["fecha"], name: "fecha"

  create_table "bits_parada", primary_key: "bit_parada", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "bolsa_trabajo", primary_key: "folio", force: :cascade do |t|
    t.char     "nombre",                 limit: 30,   null: false
    t.char     "ap_paterno",             limit: 30,   null: false
    t.char     "ap_materno",             limit: 30,   null: false
    t.char     "nombre_completo",        limit: 100,  null: false
    t.char     "calle",                  limit: 50,   null: false
    t.char     "num_exterior",           limit: 10,   null: false
    t.char     "num_interior",           limit: 10,   null: false
    t.char     "colonia",                limit: 30,   null: false
    t.char     "cod_postal",             limit: 6,    null: false
    t.char     "delegacion",             limit: 15,   null: false
    t.char     "pobmunedo",              limit: 50,   null: false
    t.char     "tel1",                   limit: 25,   null: false
    t.char     "tel2",                   limit: 25,   null: false
    t.char     "fax",                    limit: 25,   null: false
    t.char     "celular",                limit: 25,   null: false
    t.char     "rfc",                    limit: 15,   null: false
    t.datetime "fecha_alta",                          null: false
    t.datetime "fecha_nacimiento",                    null: false
    t.varchar  "e_mail",                 limit: 100,  null: false
    t.char     "colonia_codigo",         limit: 10,   null: false
    t.char     "sexo",                   limit: 1,    null: false
    t.char     "estado_civil",           limit: 1,    null: false
    t.integer  "hijos",                  limit: 1,    null: false
    t.integer  "dependientes",           limit: 1,    null: false
    t.char     "nacionalidad",           limit: 5,    null: false
    t.char     "religion",               limit: 2,    null: false
    t.char     "escolaridad",            limit: 5,    null: false
    t.char     "puesto_deseado",         limit: 10,   null: false
    t.char     "reg_imss",               limit: 12,   null: false
    t.char     "curp",                   limit: 18,   null: false
    t.char     "tipo_licencia_conducir", limit: 2,    null: false
    t.boolean  "bicicleta",                           null: false
    t.boolean  "motocicleta",                         null: false
    t.boolean  "automovil",                           null: false
    t.char     "empleado",               limit: 10,   null: false
    t.varchar  "entrevistas",            limit: 1000, null: false
    t.char     "status",                 limit: 1,    null: false
  end

  create_table "bonificaciones_analiticas", force: :cascade do |t|
    t.char  "folio",             limit: 10,                          null: false
    t.char  "transaccion",       limit: 5,                           null: false
    t.char  "operacion",         limit: 1,                           null: false
    t.char  "tarjeta_pyde",      limit: 10,                          null: false
    t.char  "tipo_bonificacion", limit: 1,                           null: false
    t.money "cantidad",                     precision: 19, scale: 4, null: false
  end

  create_table "cadenas", primary_key: "cadena", force: :cascade do |t|
    t.char    "nombre",        limit: 30, default: "                              ", null: false
    t.char    "abreviatura",   limit: 3,  default: "   ",                            null: false
    t.char    "status",        limit: 5,  default: "V    ",                          null: false
    t.boolean "valor_default",            default: false,                            null: false
    t.char    "rotulacion1",   limit: 1,  default: " ",                              null: false
    t.char    "rotulacion2",   limit: 1,  default: " ",                              null: false
    t.char    "rotulacion3",   limit: 1,  default: " ",                              null: false
    t.boolean "autorizacion1",            default: false,                            null: false
    t.boolean "autorizacion2",            default: false,                            null: false
    t.boolean "autorizacion3",            default: false,                            null: false
  end

  create_table "cajas", primary_key: "caja", force: :cascade do |t|
    t.char    "nombre",                  limit: 30,                                                 null: false
    t.boolean "operando",                                                                           null: false
    t.boolean "caja_asignada",                                                                      null: false
    t.decimal "ticket",                             precision: 19, scale: 0,                        null: false
    t.char    "cod_estab",               limit: 5,                                                  null: false
    t.boolean "preparar_stand_alone",                                        default: false,        null: false
    t.char    "status",                  limit: 5,                                                  null: false
    t.bigint  "ticket_stand_alone",      limit: 8,                           default: 0,            null: false
    t.integer "multiplo_rp_pos",         limit: 1,                           default: 0,            null: false
    t.boolean "usa_lector_huella",                                           default: true,         null: false
    t.char    "cliente_venta_publico",   limit: 10,                          default: "          ", null: false
    t.boolean "mostrar_lectura_bascula",                                     default: false,        null: false
  end

  create_table "cajas_valores", primary_key: "caja_valores", force: :cascade do |t|
    t.varchar  "nombre",    limit: 50,                          null: false
    t.char     "uso",       limit: 1,                           null: false
    t.char     "cod_estab", limit: 5,                           null: false
    t.money    "saldo",                precision: 19, scale: 4, null: false
    t.datetime "fecha",                                         null: false
    t.char     "status",    limit: 1,                           null: false
  end

  create_table "cajeros", primary_key: "cajero", force: :cascade do |t|
    t.char     "nombre",                         limit: 30,                           default: "                              ", null: false
    t.char     "clave_secreta",                  limit: 10,                           default: "          ",                     null: false
    t.boolean  "operando",                                                            default: false,                            null: false
    t.datetime "fecha_asignacion"
    t.char     "folio_asignacion",               limit: 10
    t.char     "caja",                           limit: 5,                            default: "     ",                          null: false
    t.char     "status_asignacion",              limit: 1
    t.char     "cod_estab",                      limit: 5,                            default: "     ",                          null: false
    t.varchar  "e_mail",                         limit: 100,                          default: "",                               null: false
    t.char     "status",                         limit: 5,                            default: "V    ",                          null: false
    t.datetime "ultima_modificacion",                                                                                            null: false
    t.boolean  "multiples_cajas",                                                     default: false,                            null: false
    t.money    "importe_maximo_valores",                     precision: 19, scale: 4, default: 0.0,                              null: false
    t.char     "usuario_mensaje_maximo_valores", limit: 5,                            default: "     ",                          null: false
    t.boolean  "maneja_credito_pos",                                                  default: false,                            null: false
    t.money    "meta_diaria",                                precision: 19, scale: 4, default: 0.0,                              null: false
    t.char     "empleado",                       limit: 10,                           default: "          ",                     null: false
  end

  create_table "calculo_asistencia_empleados", primary_key: "fecha", force: :cascade do |t|
    t.char    "empleado",               limit: 10,                         null: false
    t.decimal "retardos",                          precision: 9, scale: 4, null: false
    t.decimal "faltas",                            precision: 9, scale: 4, null: false
    t.decimal "dias_trabajados",                   precision: 9, scale: 4, null: false
    t.decimal "septimo_dia",                       precision: 9, scale: 4, null: false
    t.decimal "incapacidades_con_goce",            precision: 9, scale: 4, null: false
    t.decimal "incapacidades_sin_goce",            precision: 9, scale: 4, null: false
    t.decimal "permisos_con_goce",                 precision: 9, scale: 4, null: false
    t.decimal "permisos_sin_goce",                 precision: 9, scale: 4, null: false
    t.decimal "vacaciones",                        precision: 9, scale: 4, null: false
    t.decimal "horas_extras_dobles",               precision: 9, scale: 4, null: false
    t.decimal "horas_extras_triples",              precision: 9, scale: 4, null: false
  end

  create_table "calculo_diferencia_cambiaria", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion",         limit: 5, null: false
    t.datetime "fecha",                         null: false
    t.char     "tipo",                limit: 1, null: false
    t.char     "usuario",             limit: 5, null: false
    t.char     "cod_estab",           limit: 5, null: false
    t.char     "usuario_cancelacion", limit: 5
    t.datetime "fecha_cancelacion"
    t.char     "status",              limit: 1, null: false
  end

  create_table "cambiar_condicion_pago", primary_key: "cambiar_condicion_pago", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "cambios_contenido_productos", id: false, force: :cascade do |t|
    t.char     "cod_prod",           limit: 10,                          null: false
    t.decimal  "contenido_anterior",            precision: 19, scale: 8, null: false
    t.decimal  "contenido_nuevo",               precision: 19, scale: 8, null: false
    t.char     "usuario",            limit: 5,                           null: false
    t.char     "equipo",             limit: 5,                           null: false
    t.datetime "fecha",                                                  null: false
  end

  create_table "campos_busqueda", primary_key: "Tabla", force: :cascade do |t|
    t.varchar "Campos",              limit: 250, default: "Campos de busqueda", null: false
    t.varchar "llave",               limit: 100, default: "",                   null: false
    t.boolean "mostrar_informacion",             default: true,                 null: false
  end

  create_table "campos_calculados_DIM", primary_key: "campo", force: :cascade do |t|
    t.char    "operando1", limit: 1, null: false
    t.integer "campo1",    limit: 1, null: false
    t.char    "operando2", limit: 1, null: false
    t.integer "campo2",    limit: 1, null: false
    t.char    "operando3", limit: 1, null: false
    t.integer "campo3",    limit: 1, null: false
    t.char    "operando4", limit: 1, null: false
    t.integer "campo4",    limit: 1, null: false
    t.char    "operando5", limit: 1, null: false
    t.integer "campo5",    limit: 1, null: false
  end

  create_table "campos_editables_usuario", primary_key: "tabla", force: :cascade do |t|
    t.char    "usuario",  limit: 5,  null: false
    t.varchar "campo",    limit: 50, null: false
    t.boolean "editable",            null: false
  end

  create_table "cancelaciones_descuentos_financieros", primary_key: "folio", force: :cascade do |t|
    t.char     "factura_proveedor",      limit: 15,                          null: false
    t.char     "cod_prv",                limit: 10,                          null: false
    t.char     "transaccion",            limit: 5,                           null: false
    t.char     "folio_aplicacion",       limit: 10,                          null: false
    t.char     "transaccion_aplicacion", limit: 5,                           null: false
    t.money    "importe",                           precision: 19, scale: 4, null: false
    t.datetime "fecha",                                                      null: false
    t.char     "usuario",                limit: 5,                           null: false
  end

  create_table "caos", id: false, force: :cascade do |t|
    t.char "caos", limit: 10, null: false
  end

  create_table "capacidad_instalada_manufactura", primary_key: "linea_produccion", force: :cascade do |t|
    t.char    "etapa_produccion",            limit: 5,                         null: false
    t.char    "estacion_trabajo",            limit: 5,                         null: false
    t.char    "grupo_costos_manufactura",    limit: 2,                         null: false
    t.char    "codigo_elemento_manufactura", limit: 5,                         null: false
    t.decimal "capacidad_instalada",                   precision: 9, scale: 1, null: false
  end

  create_table "capacidad_instalada_manufactura_real", primary_key: "linea_produccion", force: :cascade do |t|
    t.char     "etapa_produccion",            limit: 5,                          null: false
    t.char     "estacion_trabajo",            limit: 5,                          null: false
    t.char     "grupo_costos_manufactura",    limit: 2,                          null: false
    t.char     "codigo_elemento_manufactura", limit: 5,                          null: false
    t.datetime "fecha",                                                          null: false
    t.decimal  "capacidad_instalada",                   precision: 19, scale: 4, null: false
    t.decimal  "horas",                                 precision: 9,  scale: 4, null: false
  end

  create_table "capacitaciones_personal", primary_key: "folio", force: :cascade do |t|
    t.datetime "fecha_inicial",                                                    null: false
    t.datetime "fecha_final",                                                      null: false
    t.varchar  "descripcion",          limit: 200,                                 null: false
    t.varchar  "instructor",           limit: 50,                                  null: false
    t.datetime "hora",                                                             null: false
    t.varchar  "lugar",                limit: 100,                                 null: false
    t.money    "costo",                                   precision: 19, scale: 4, null: false
    t.char     "empleado_responsable", limit: 10,                                  null: false
    t.varchar  "notas",                limit: 500,                                 null: false
    t.boolean  "realizada",                                                        null: false
    t.binary   "archivo",              limit: 2147483647
    t.varchar  "nombre_archivo",       limit: 255
  end

  create_table "capitales_base_intereses", primary_key: "capital_base_intereses", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "cargas_combustible_lubricante", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion",         limit: 5,                          null: false
    t.datetime "fecha",                                                  null: false
    t.char     "mecanico",            limit: 5,                          null: false
    t.char     "usuario",             limit: 5,                          null: false
    t.char     "usuario_autorizo",    limit: 5,                          null: false
    t.varchar  "notas",               limit: 100,                        null: false
    t.char     "usuario_cancelacion", limit: 5
    t.datetime "fecha_cancelacion"
    t.char     "cod_estab",           limit: 5,                          null: false
    t.char     "status",              limit: 1,                          null: false
    t.char     "equipo",              limit: 10,  default: "          ", null: false
    t.varchar  "responsable",         limit: 50,  default: "",           null: false
    t.integer  "lectura",             limit: 4,   default: 0,            null: false
  end

  create_table "cargas_estandar", primary_key: "folio", force: :cascade do |t|
    t.varchar "nombre",      limit: 50, null: false
    t.char    "abreviatura", limit: 10, null: false
    t.char    "status",      limit: 1,  null: false
  end

  create_table "cargo_abono", primary_key: "clave", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "cargos_abonos_bancarios", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion",         limit: 5,   null: false
    t.datetime "fecha",                           null: false
    t.char     "cod_estab",           limit: 5,   null: false
    t.char     "usuario",             limit: 5,   null: false
    t.char     "usuario_cancelacion", limit: 5
    t.datetime "fecha_cancelacion"
    t.varchar  "notas",               limit: 500, null: false
    t.char     "status",              limit: 1,   null: false
  end

  create_table "cargos_clientes", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion",            limit: 5,                                                        null: false
    t.char     "cod_cte",                limit: 10,                                                       null: false
    t.datetime "fecha",                                                                                   null: false
    t.money    "importe",                            precision: 19, scale: 4,                             null: false
    t.money    "iva",                                precision: 19, scale: 4,                             null: false
    t.money    "total",                              precision: 19, scale: 4
    t.money    "abonos",                             precision: 19, scale: 4, default: 0.0,               null: false
    t.money    "saldo",                              precision: 19, scale: 4
    t.char     "cod_estab",              limit: 5,                                                        null: false
    t.char     "usuario",                limit: 5,                            default: "     ",           null: false
    t.datetime "fecha_pago"
    t.datetime "fecha_cancelacion"
    t.char     "usuario_cancelacion",    limit: 5,                            default: "     ",           null: false
    t.char     "vendedor",               limit: 5,                                                        null: false
    t.char     "status_ubicacion",       limit: 5,                            default: "C    ",           null: false
    t.char     "tipo_cargo_cliente",     limit: 5,                            default: "1    ",           null: false
    t.char     "referencia",             limit: 15,                           default: "               ", null: false
    t.real     "tipo_cambio",                                                                             null: false
    t.char     "moneda",                 limit: 5,                                                        null: false
    t.varchar  "notas",                  limit: 200,                          default: "",                null: false
    t.char     "status",                 limit: 5,                            default: "V    ",           null: false
    t.datetime "ultima_modificacion",                                                                     null: false
    t.char     "transaccion_referencia", limit: 5,                            default: "     ",           null: false
    t.char     "status_cobranza",        limit: 2,                            default: "  ",              null: false
    t.char     "cobrador",               limit: 5,                            default: "     ",           null: false
    t.boolean  "documento_recibido",                                          default: false,             null: false
    t.datetime "fecha_cargo",                                                                             null: false
  end

  add_index "cargos_clientes", ["cod_cte"], name: "cod_cte"
  add_index "cargos_clientes", ["fecha"], name: "fecha"
  add_index "cargos_clientes", ["referencia", "status", "transaccion_referencia"], name: "IX_cargos_clientes_referencia_status_transaccion_referencia"

  create_table "cargos_creditos_aplicados_productos", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion",      limit: 5,                 null: false
    t.datetime "fecha",                                      null: false
    t.char     "cod_estab",        limit: 5,                 null: false
    t.char     "usuario",          limit: 5,                 null: false
    t.char     "tipo",             limit: 1,                 null: false
    t.char     "razon",            limit: 5,                 null: false
    t.char     "concepto_gastos",  limit: 5,                 null: false
    t.varchar  "notas",            limit: 200,               null: false
    t.char     "status",           limit: 1,                 null: false
    t.char     "forma_aplicacion", limit: 1,   default: "I", null: false
  end

  create_table "cargos_proveedores", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion",              limit: 5,                                                        null: false
    t.datetime "fecha",                                                                                     null: false
    t.char     "cod_prv",                  limit: 10,                                                       null: false
    t.money    "importe",                              precision: 19, scale: 4,                             null: false
    t.money    "iva",                                  precision: 19, scale: 4,                             null: false
    t.money    "total",                                precision: 19, scale: 4
    t.money    "importe_aplicado",                     precision: 19, scale: 4,                             null: false
    t.money    "saldo",                                precision: 19, scale: 4
    t.char     "usuario",                  limit: 5,                                                        null: false
    t.char     "usuario_cancelacion",      limit: 5
    t.datetime "fecha_cancelacion"
    t.char     "tipo_cargos_proveedores",  limit: 5,                            default: "1    ",           null: false
    t.char     "clave_cargos_proveedores", limit: 5,                            default: "     ",           null: false
    t.char     "referencia",               limit: 15,                           default: "               ", null: false
    t.char     "moneda",                   limit: 5,                                                        null: false
    t.real     "tipo_cambio",                                                                               null: false
    t.char     "cod_estab",                limit: 5,                                                        null: false
    t.varchar  "notas",                    limit: 500,                                                      null: false
    t.char     "status",                   limit: 5,                                                        null: false
    t.char     "status_ubicacion",         limit: 1,                            default: " ",               null: false
  end

  add_index "cargos_proveedores", ["cod_prv"], name: "cod_prv"
  add_index "cargos_proveedores", ["fecha"], name: "ix_cargos_proveedores_fecha"

  create_table "cartas_cambio_mercancia", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion",            limit: 5,          null: false
    t.datetime "fecha",                                     null: false
    t.char     "folio_referencia",       limit: 10,         null: false
    t.char     "transaccion_referencia", limit: 5,          null: false
    t.char     "cod_prv",                limit: 10,         null: false
    t.char     "usuario",                limit: 5,          null: false
    t.char     "cod_estab",              limit: 5,          null: false
    t.char     "status",                 limit: 1,          null: false
    t.varchar  "notas",                  limit: 500,        null: false
    t.char     "usuario_modificacion",   limit: 5,          null: false
    t.datetime "ultima_modificacion",                       null: false
    t.binary   "archivo",                limit: 2147483647
    t.varchar  "archivo_nombre",         limit: 255
  end

  create_table "catalogos_ilustrados", primary_key: "catalogo_ilustrado", force: :cascade do |t|
    t.varchar "nombre",              limit: 50,                                         null: false
    t.char    "abreviatura",         limit: 5,                                          null: false
    t.decimal "ancho_pagina",                   precision: 9, scale: 2,                 null: false
    t.decimal "largo_pagina",                   precision: 9, scale: 2,                 null: false
    t.char    "unidad_medida",       limit: 1,                                          null: false
    t.integer "fotografias_renglon", limit: 1,                                          null: false
    t.integer "fotografias_columna", limit: 1,                                          null: false
    t.boolean "mostrar_descripcion",                                    default: false, null: false
    t.boolean "mostrar_codigo",                                         default: false, null: false
    t.boolean "mostrar_barras",                                         default: false, null: false
    t.char    "status",              limit: 5,                                          null: false
  end

  create_table "categorias", primary_key: "categoria", force: :cascade do |t|
    t.char    "nombre",      limit: 30,                                                                                                                   null: false
    t.char    "abreviatura", limit: 5,                                                                                                                    null: false
    t.char    "status",      limit: 5,                                                                                                                    null: false
    t.char    "jerarquia",   limit: 100, default: "                                                                                                    ", null: false
    t.integer "orden",       limit: 2,   default: 0,                                                                                                      null: false
  end

  create_table "causantes_devoluciones_clientes", primary_key: "causante_devoluciones_clientes", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "cc_aplicadas", force: :cascade do |t|
    t.char    "transaccion", limit: 5,   null: false
    t.char    "folio",       limit: 10,  null: false
    t.char    "cod_prod",    limit: 13,  null: false
    t.varchar "descuentos",  limit: 150, null: false
    t.varchar "folios_cc",   limit: 100, null: false
  end

  create_table "cdvaplicadas", force: :cascade do |t|
    t.char    "folio",       limit: 10,                                        null: false
    t.char    "transaccion", limit: 5,                                         null: false
    t.char    "cod_prod",    limit: 13,                                        null: false
    t.char    "folio_cdv",   limit: 10,                                        null: false
    t.money   "descuento",              precision: 19, scale: 4,               null: false
    t.money   "importe",                precision: 19, scale: 4,               null: false
    t.decimal "porc_iva",               precision: 5,  scale: 2,               null: false
    t.varchar "tipo_cdv",    limit: 1,                           default: "N", null: false
  end

  create_table "censo_caducidades", force: :cascade do |t|
    t.char     "cod_prod",          limit: 13,                                        null: false
    t.char     "unidad",            limit: 1,                                         null: false
    t.char     "cod_estab",         limit: 5,                                         null: false
    t.varchar  "lote",              limit: 25,                                        null: false
    t.decimal  "cantidad",                     precision: 19, scale: 3,               null: false
    t.datetime "fecha",                                                               null: false
    t.datetime "fecha_fabricacion",                                                   null: false
    t.char     "rotulacion",        limit: 1,                           default: " ", null: false
    t.integer  "temperatura",       limit: 1,                           default: 0,   null: false
  end

  create_table "censo_pedaceria", force: :cascade do |t|
    t.char    "cod_prod",  limit: 13,                                         null: false
    t.char    "cod_estab", limit: 5,                                          null: false
    t.decimal "medida",               precision: 9, scale: 3,                 null: false
    t.integer "cantidad",  limit: 2,                                          null: false
    t.boolean "dañado",                                       default: false, null: false
  end

  create_table "censo_productos_inventario", force: :cascade do |t|
    t.char     "zona_inventario_fisico", limit: 10,                                         null: false
    t.integer  "orden_producto",         limit: 4,                                          null: false
    t.char     "cod_prod",               limit: 13,                                         null: false
    t.decimal  "unidades1",                          precision: 19, scale: 4, default: 0.0, null: false
    t.decimal  "unidades2",                          precision: 19, scale: 4, default: 0.0, null: false
    t.decimal  "piezas1",                            precision: 19, scale: 4, default: 0.0, null: false
    t.decimal  "piezas2",                            precision: 19, scale: 4, default: 0.0, null: false
    t.char     "cod_estab",              limit: 5,                                          null: false
    t.varchar  "notas",                  limit: 200,                          default: "",  null: false
    t.datetime "fecha",                                                                     null: false
  end

  create_table "censo_productos_inventario_localizacion", primary_key: "zona_inventario_fisico", force: :cascade do |t|
    t.char     "localizacion",     limit: 10,                                                           null: false
    t.char     "cod_prod",         limit: 13,                                                           null: false
    t.decimal  "unidades1",                   precision: 19, scale: 4,                                  null: false
    t.decimal  "unidades2",                   precision: 19, scale: 4,                                  null: false
    t.decimal  "piezas1",                     precision: 19, scale: 4,                                  null: false
    t.decimal  "piezas2",                     precision: 19, scale: 4,                                  null: false
    t.char     "cod_estab",        limit: 5,                                                            null: false
    t.char     "lote_fabricacion", limit: 20,                          default: "                    ", null: false
    t.char     "lote_recepcion",   limit: 10,                          default: "          ",           null: false
    t.datetime "fecha_caducidad",                                      default: '1900-01-01 00:00:00',  null: false
  end

  create_table "centros_acopio", primary_key: "centro_acopio", force: :cascade do |t|
    t.varchar "descripcion",      limit: 100,             null: false
    t.char    "abreviatura",      limit: 5,               null: false
    t.varchar "domicilio",        limit: 150,             null: false
    t.char    "poblacion",        limit: 5,               null: false
    t.char    "telefono",         limit: 25,              null: false
    t.char    "celular",          limit: 25,              null: false
    t.varchar "encargado",        limit: 50,              null: false
    t.char    "status",           limit: 1
    t.integer "porcentaje_merma", limit: 1,   default: 0, null: false
  end

  create_table "centros_costo", primary_key: "centro_costo", force: :cascade do |t|
    t.varchar "nombre",      limit: 50, null: false
    t.char    "abreviatura", limit: 10, null: false
    t.char    "status",      limit: 1,  null: false
  end

  create_table "certificados_salud", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion", limit: 5,                            null: false
    t.datetime "fecha",                                            null: false
    t.char     "paciente",    limit: 10,                           null: false
    t.char     "medico",      limit: 5,                            null: false
    t.char     "usuario",     limit: 5,                            null: false
    t.char     "cod_estab",   limit: 5,                            null: false
    t.money    "costo",                   precision: 19, scale: 4, null: false
    t.varchar  "notas",       limit: 500,                          null: false
    t.char     "status",      limit: 1,                            null: false
  end

  create_table "cfd_enviados", force: :cascade do |t|
    t.char     "folio",            limit: 10, null: false
    t.char     "transaccion",      limit: 5,  null: false
    t.datetime "fecha_envio",                 null: false
    t.char     "usuario",          limit: 5,  null: false
    t.char     "cod_estab",        limit: 5,  null: false
    t.varchar  "correo_remitente", limit: 50, null: false
  end

  create_table "cfd_pendientes_cancelar", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion",          limit: 5, null: false
    t.datetime "fecha",                          null: false
    t.char     "usuario",              limit: 5, null: false
    t.datetime "fecha_ultimo_intento",           null: false
  end

  create_table "cfd_proveedores", primary_key: "folio", force: :cascade do |t|
    t.char     "transaccion", limit: 5,                                 null: false
    t.datetime "fecha",                                                 null: false
    t.char     "usuario",     limit: 5,                                 null: false
    t.string   "xml",         limit: 4000,                              null: false
    t.binary   "archivo",     limit: 2147483647
    t.varchar  "nombre",      limit: 255
    t.char     "cod_prv",     limit: 10,         default: "          ", null: false
  end

  create_table "cfdi_ligados", force: :cascade do |t|
    t.char     "folio",            limit: 36,                   null: false
    t.char     "transaccion",      limit: 5,                    null: false
    t.varchar  "uuid",             limit: 50,                   null: false
    t.datetime "fecha",                                         null: false
    t.char     "usuario",          limit: 5,                    null: false
    t.char     "transaccion_cfdi", limit: 5,  default: "2    ", null: false
    t.char     "rowguid_mpolizas", limit: 36
    t.bigint   "partida",          limit: 8,  default: 0,       null: false
  end

  add_index "cfdi_ligados", ["folio", "transaccion"], name: "IX_cfdi_ligados_foliotrans"
  add_index "cfdi_ligados", ["rowguid_mpolizas"], name: "IX_cfdi_ligados_ROWGUID"
  add_index "cfdi_ligados", ["uuid"], name: "IX_cfdi_ligados_UUID"

  create_table "cfdi_nominas", primary_key: "folio", force: :cascade do |t|
    t.char        "nomina",                 limit: 10,         null: false
    t.char        "empleado",               limit: 10,         null: false
    t.ntext       "cadena_original",        limit: 2147483647, null: false
    t.ntext       "sello_digital",          limit: 2147483647, null: false
    t.varchar     "certificado",            limit: 50,         null: false
    t.string      "archivo_xml",            limit: 4000
    t.datetime    "ultima_modificacion",                       null: false
    t.varchar_max "sello_sat",              limit: 2147483647, null: false
    t.varchar     "folio_pac",              limit: 50,         null: false
    t.varchar_max "cadena_original_timbre", limit: 2147483647, null: false
    t.binary      "codigo_barras",          limit: 2147483647
    t.varchar     "certificado_sat",        limit: 50,         null: false
    t.datetime    "fecha_certificacion",                       null: false
    t.char        "status",                 limit: 1,          null: false
    t.string      "acuse_cancelacion",      limit: 4000
  end

  create_table "cfdi_pendientes", primary_key: "uuid", force: :cascade do |t|
    t.char     "rfc",          limit: 20,                            null: false
    t.varchar  "folio",        limit: 20,                            null: false
    t.varchar  "serie",        limit: 20,                            null: false
    t.datetime "fecha",                                              null: false
    t.varchar  "tipo",         limit: 20,                            null: false
    t.money    "importe",                   precision: 19, scale: 4, null: false
    t.money    "descuento",                 precision: 19, scale: 4, null: false
    t.money    "ieps",                      precision: 19, scale: 4, null: false
    t.money    "iva",                       precision: 19, scale: 4, null: false
    t.money    "isr_retenido",              precision: 19, scale: 4, null: false
    t.money    "iva_retenido",              precision: 19, scale: 4, null: false
    t.money    "neto",                      precision: 19, scale: 4, null: false
    t.string   "archivo_xml",  limit: 4000,                          null: false
  end

  create_table "cheques", id: false, force: :cascade do |t|
    t.char     "folio",                     limit: 10,                                                 null: false
    t.char     "transaccion",               limit: 5,                                                  null: false
    t.datetime "fecha",                                                                                null: false
    t.varchar  "cuenta_bancaria",           limit: 20,                                                 null: false
    t.char     "cheque",                    limit: 10,                                                 null: false
    t.money    "importe",                              precision: 19, scale: 4,                        null: false
    t.char     "moneda",                    limit: 5,                                                  null: false
    t.real     "tipo_cambio",                                                                          null: false
    t.datetime "fecha_deposito",                                                                       null: false
    t.datetime "fecha_cobrado"
    t.char     "razon_cancelacion_cheques", limit: 5
    t.char     "cod_estab",                 limit: 5,                                                  null: false
    t.char     "status_cheque",             limit: 1
    t.boolean  "abono_en_cuenta",                                               default: false,        null: false
    t.boolean  "posfechado",                                                    default: false,        null: false
    t.char     "empleado",                  limit: 10,                          default: "          ", null: false
  end

  add_index "cheques", ["cuenta_bancaria", "cheque"], name: "IX_cheques", unique: true

  create_table "choferes_ayudantes", primary_key: "chofer_ayudante", force: :cascade do |t|
    t.char     "nombre",                           limit: 30,                                  null: false
    t.boolean  "chofer",                                                                       null: false
    t.char     "calle",                            limit: 50,                                  null: false
    t.char     "num_exterior",                     limit: 10,                                  null: false
    t.char     "num_interior",                     limit: 10,                                  null: false
    t.char     "pobmunedo",                        limit: 30,                                  null: false
    t.char     "telefono",                         limit: 15,                                  null: false
    t.char     "celular",                          limit: 15,                                  null: false
    t.char     "telefono_localizador",             limit: 15,                                  null: false
    t.char     "pin",                              limit: 10,                                  null: false
    t.varchar  "e_mail",                           limit: 50,                                  null: false
    t.char     "empleado",                         limit: 10,                                  null: false
    t.char     "status",                           limit: 5,                                   null: false
    t.char     "banco",                            limit: 5,  default: "     ",                null: false
    t.char     "sucursal",                         limit: 10, default: "          ",           null: false
    t.char     "cuenta_bancaria",                  limit: 20, default: "                    ", null: false
    t.char     "licencia_manejo",                  limit: 20, default: "                    ", null: false
    t.datetime "vencimiento_licencia_manejo",                                                  null: false
    t.varchar  "colonia",                          limit: 30, default: "",                     null: false
    t.char     "cod_estab",                        limit: 5,  default: "     ",                null: false
    t.char     "status_ubicacion",                 limit: 1,  default: "1",                    null: false
    t.char     "cod_cte",                          limit: 10, default: "          ",           null: false
    t.char     "supervisor",                       limit: 5,  default: "     ",                null: false
    t.char     "tipo_licencia_manejo",             limit: 2,  default: "  ",                   null: false
    t.char     "tipo_licencia_manejo_empresa",     limit: 2,  default: "  ",                   null: false
    t.char     "licencia_manejo_empresa",          limit: 10, default: "          ",           null: false
    t.datetime "vigencia_licencia_manejo_empresa",                                             null: false
    t.boolean  "concesionario",                               default: false,                  null: false
    t.boolean  "comision",                                    default: true,                   null: false
    t.varchar  "clave_secreta",                    limit: 50, default: "",                     null: false
  end

  create_table "choferes_ayudantes_embarques", force: :cascade do |t|
    t.char "embarque",        limit: 10,                   null: false
    t.char "chofer_ayudante", limit: 10,                   null: false
    t.char "transaccion",     limit: 5,  default: "43   ", null: false
  end

  create_table "choferes_fleteros", primary_key: "chofer_fletero", force: :cascade do |t|
    t.char    "nombre",               limit: 30,                                                                null: false
    t.char    "telefono",             limit: 15,                                                                null: false
    t.char    "celular",              limit: 15,                                                                null: false
    t.char    "telefono_localizador", limit: 15,                                                                null: false
    t.char    "pin",                  limit: 10,                                                                null: false
    t.varchar "e_mail",               limit: 50,                                                                null: false
    t.char    "linea_fletera",        limit: 10,                                                                null: false
    t.char    "status",               limit: 5,                                                                 null: false
    t.char    "calle",                limit: 30, default: "                              ",                     null: false
    t.char    "num_exterior",         limit: 10, default: "          ",                                         null: false
    t.char    "num_interior",         limit: 10, default: "          ",                                         null: false
    t.char    "cod_postal",           limit: 6,  default: "      ",                                             null: false
    t.char    "delegacion",           limit: 15, default: "               ",                                    null: false
    t.char    "pobmunedo",            limit: 50, default: "                                                  ", null: false
    t.char    "colonia",              limit: 20, default: "                    ",                               null: false
  end

  create_table "clases_especie", primary_key: "especie", force: :cascade do |t|
    t.char    "clase_especie", limit: 5,  null: false
    t.varchar "nombre",        limit: 50, null: false
    t.char    "abreviatura",   limit: 5,  null: false
    t.char    "sexo",          limit: 1,  null: false
    t.char    "status",        limit: 1,  null: false
  end

  create_table "clases_indicadores_negocio", primary_key: "clase_indicador_negocio", force: :cascade do |t|
    t.varchar "nombre",      limit: 50, null: false
    t.char    "abreviatura", limit: 10, null: false
    t.char    "status",      limit: 1,  null: false
  end

  create_table "clases_productos", primary_key: "clase_producto", force: :cascade do |t|
    t.char "nombre",      limit: 30,                                                                                                                   null: false
    t.char "abreviatura", limit: 5,                                                                                                                    null: false
    t.char "status",      limit: 1,                                                                                                                    null: false
    t.char "jerarquia",   limit: 100, default: "                                                                                                    ", null: false
  end

  create_table "clasificaciones_Clientes", primary_key: "clasificacion_cliente", force: :cascade do |t|
    t.char    "nombre",        limit: 30,                 null: false
    t.char    "abreviatura",   limit: 5,                  null: false
    t.char    "status",        limit: 5,                  null: false
    t.boolean "valor_default",            default: false, null: false
  end

  create_table "clasificaciones_carga", primary_key: "clasificacion_carga", force: :cascade do |t|
    t.varchar "nombre",      limit: 50,                                                                                                                   null: false
    t.char    "abreviatura", limit: 5,                                                                                                                    null: false
    t.char    "status",      limit: 1,                                                                                                                    null: false
    t.char    "jerarquia",   limit: 100, default: "                                                                                                    ", null: false
  end

  create_table "clasificaciones_contables", primary_key: "grupo_contable", force: :cascade do |t|
    t.char    "clasificacion_contable", limit: 5,                                              null: false
    t.char    "nombre",                 limit: 30,  default: "NNN                           ", null: false
    t.char    "abreviatura",            limit: 3,                                              null: false
    t.varchar "guia_descriptiva",       limit: 100,                                            null: false
    t.char    "status",                 limit: 5,   default: "V    ",                          null: false
    t.integer "orden",                  limit: 1,   default: 0,                                null: false
    t.boolean "utilidad",                           default: true,                             null: false
  end

  create_table "clasificaciones_datos_adicionales_clientes", primary_key: "clasificacion_datos_adicionales_clientes", force: :cascade do |t|
    t.varchar "nombre", limit: 100, null: false
    t.char    "status", limit: 1,   null: false
  end

  create_table "clasificaciones_fallas_defectos", primary_key: "clasificacion_falla_defecto", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "clasificaciones_fiscales", primary_key: "clasificacion_fiscal", force: :cascade do |t|
    t.varchar "nombre",         limit: 50,                 null: false
    t.char    "abreviatura",    limit: 5,                  null: false
    t.boolean "persona_moral",                             null: false
    t.boolean "desglosa_iva",                              null: false
    t.char    "formato_rfc",    limit: 15,                 null: false
    t.char    "status",         limit: 1,                  null: false
    t.boolean "retencion",                 default: false, null: false
    t.boolean "valor_default",             default: false, null: false
    t.char    "regimen_fiscal", limit: 2,  default: "  ",  null: false
  end

  create_table "clasificaciones_indicadores_negocio", primary_key: "clase_indicador_negocio", force: :cascade do |t|
    t.char    "clasificacion_indicador_negocio", limit: 3,  null: false
    t.varchar "nombre",                          limit: 50, null: false
    t.char    "abreviatura",                     limit: 10, null: false
    t.char    "status",                          limit: 1,  null: false
  end

  create_table "clasificaciones_productos", primary_key: "clasificacion_productos", force: :cascade do |t|
    t.varchar "nombre",      limit: 50,                                                                                                                   null: false
    t.char    "abreviatura", limit: 5,                                                                                                                    null: false
    t.char    "status",      limit: 5,                                                                                                                    null: false
    t.char    "jerarquia",   limit: 100, default: "                                                                                                    ", null: false
  end

  create_table "clasificaciones_ruta", primary_key: "clasificacion", force: :cascade do |t|
    t.char    "transaccion", limit: 5,  null: false
    t.varchar "nombre",      limit: 50, null: false
    t.char    "abreviatura", limit: 5,  null: false
    t.char    "status",      limit: 5,  null: false
  end

  create_table "clasificadores_productos_familia", primary_key: "familia", force: :cascade do |t|
    t.char "transaccion",  limit: 5, null: false
    t.char "clasificador", limit: 5, null: false
  end

  create_table "claves_afectacion_inventario", primary_key: "clave_afectacion_inventario", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "claves_aprovechable", primary_key: "clave_aprovechable", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "claves_autorizacion", primary_key: "clave_autorizacion", force: :cascade do |t|
    t.char     "usuario",               limit: 5,                            null: false
    t.datetime "fecha",                                                      null: false
    t.char     "cod_estab",             limit: 5,                            null: false
    t.char     "equipo",                limit: 5,                            null: false
    t.char     "transaccion_operacion", limit: 5,                            null: false
    t.char     "usuario_operacion",     limit: 10,                           null: false
    t.char     "tipo_operacion",        limit: 1,                            null: false
    t.money    "monto",                             precision: 19, scale: 4, null: false
    t.varchar  "notas",                 limit: 200,                          null: false
    t.char     "status",                limit: 1,                            null: false
  end

  create_table "claves_autorizacion_cajas", primary_key: "clave_autorizacion_cajas", force: :cascade do |t|
    t.varchar "nombre",        limit: 50,                 null: false
    t.boolean "permitida",                default: true,  null: false
    t.boolean "autorizacion",             default: true,  null: false
    t.boolean "valor_default",            default: false, null: false
  end

  create_table "claves_cargos_clientes", primary_key: "clave_cargos_clientes", force: :cascade do |t|
    t.char    "nombre",              limit: 30,                   null: false
    t.char    "abreviatura",         limit: 3,                    null: false
    t.char    "tipo_cargo_cliente",  limit: 5,  default: "1    ", null: false
    t.char    "status",              limit: 5,                    null: false
    t.boolean "interes_moratorio",              default: false,   null: false
    t.char    "tasa_iva_interior",   limit: 2,  default: "  ",    null: false
    t.char    "tasa_iva_fronterizo", limit: 2,  default: "  ",    null: false
  end

  create_table "claves_cargos_proveedores", primary_key: "clave_cargos_proveedores", force: :cascade do |t|
    t.char    "nombre",                  limit: 30,                                           null: false
    t.char    "abreviatura",             limit: 3,                                            null: false
    t.char    "tipo_cargos_proveedores", limit: 5,                          default: "     ", null: false
    t.char    "status",                  limit: 5,                                            null: false
    t.decimal "iva_interior",                       precision: 9, scale: 4, default: 15.0,    null: false
    t.decimal "iva_frontera",                       precision: 9, scale: 4, default: 10.0,    null: false
  end

  create_table "claves_codigos", primary_key: "clave_codigos", force: :cascade do |t|
    t.char    "transaccion",        limit: 5,                    null: false
    t.varchar "nombre",             limit: 50,                   null: false
    t.bigint  "folio",              limit: 8,  default: 1,       null: false
    t.integer "relleno",            limit: 1,  default: 0,       null: false
    t.boolean "digito_verificador",            default: false,   null: false
    t.char    "cod_estab",          limit: 5,  default: "     ", null: false
    t.char    "status",             limit: 5,  default: "v    ", null: false
    t.boolean "consecutivo_libre",             default: false,   null: false
  end

  create_table "claves_condiciones_venta_pos", primary_key: "clave_condiciones_venta_pos", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "claves_costo_precio_venta_igual", primary_key: "clave_costo_precio_venta_igual", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "claves_creditos_proveedores", primary_key: "clave_creditos_proveedores", force: :cascade do |t|
    t.varchar "nombre",                    limit: 50,                   null: false
    t.char    "abreviatura",               limit: 5,                    null: false
    t.char    "tipo_creditos_proveedores", limit: 5,  default: "     ", null: false
    t.char    "status",                    limit: 5,                    null: false
    t.char    "tasa_iva_interior",         limit: 2,  default: "3 ",    null: false
    t.char    "tasa_iva_fronterizo",       limit: 2,  default: "4 ",    null: false
    t.char    "tasa_ieps",                 limit: 2,  default: "  ",    null: false
  end

  create_table "claves_evaluacion_establecimientos", primary_key: "clave_evaluacion_establecimientos", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "claves_eventos", primary_key: "clave", force: :cascade do |t|
    t.varchar "nombre",                   limit: 50, null: false
    t.char    "abreviatura",              limit: 10, null: false
    t.char    "transaccion_propietario",  limit: 5,  null: false
    t.char    "transaccion_destinatario", limit: 5,  null: false
  end

  create_table "claves_fechas_gastos_embarques", primary_key: "clave", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "claves_gestiones_cobranza", primary_key: "clave_gestion_cobranza", force: :cascade do |t|
    t.varchar "nombre",      limit: 200, null: false
    t.char    "abreviatura", limit: 10,  null: false
    t.char    "status",      limit: 1,   null: false
  end

  create_table "claves_implementacion", primary_key: "clave", force: :cascade do |t|
    t.varchar "nombre", limit: 10, null: false
  end

  create_table "claves_iva", primary_key: "clave_iva", force: :cascade do |t|
    t.char "nombre", limit: 30
    t.char "status", limit: 5
  end

  create_table "claves_manejo_recibo_valores", primary_key: "clave_manejo_recibo_valores", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "claves_movimientos_bancarios", primary_key: "clave_movimientos_bancarios", force: :cascade do |t|
    t.varchar "nombre",                       limit: 50,                   null: false
    t.char    "abreviatura",                  limit: 5,                    null: false
    t.boolean "depositos",                               default: false,   null: false
    t.boolean "retiros",                                 default: false,   null: false
    t.boolean "alimentable",                                               null: false
    t.boolean "requiere_aclaracion",                     default: false,   null: false
    t.char    "status",                       limit: 5,                    null: false
    t.char    "clave_cargos_clientes",        limit: 5,  default: "     ", null: false
    t.boolean "registro_contable_automatico",            default: true,    null: false
  end

  create_table "claves_prorrateo", primary_key: "clave_prorrateo", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "claves_recorrido_embarques", primary_key: "clave_recorrido_embarques", force: :cascade do |t|
    t.varchar "nombre",        limit: 50, null: false
    t.boolean "valor_default",            null: false
  end

  create_table "claves_registro_contable_automatico", primary_key: "clave_registro_contable_automatico", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "claves_registro_impuestos", primary_key: "clave", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "claves_resultados_gestion", primary_key: "clave_resultado_gestion", force: :cascade do |t|
    t.varchar "nombre",      limit: 50, null: false
    t.char    "abreviatura", limit: 6,  null: false
    t.char    "status",      limit: 1,  null: false
    t.char    "evento",      limit: 5,  null: false
    t.char    "exige",       limit: 1,  null: false
  end

  create_table "claves_secofi", primary_key: "clave_secofi", force: :cascade do |t|
    t.char "nombre", limit: 30
    t.char "status", limit: 5
  end

  create_table "claves_ssa", primary_key: "clave_ssa", force: :cascade do |t|
    t.char    "nombre",        limit: 50
    t.char    "status",        limit: 1
    t.char    "grupo_ssa",     limit: 20, default: "                    ", null: false
    t.boolean "receta",                   default: false,                  null: false
    t.integer "mayoreo",       limit: 2,  default: 0,                      null: false
    t.boolean "permiso",                  default: false,                  null: false
    t.boolean "valor_default",            default: false,                  null: false
  end

  create_table "claves_sumarizacion_registro_contable", primary_key: "clave_sumarizacion_registro_contable", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "claves_validacion_datos", primary_key: "clave_validacion_datos", force: :cascade do |t|
    t.char    "tipo_dato_solicitudes_credito", limit: 2,                            null: false
    t.money   "valor_inicial",                             precision: 19, scale: 4, null: false
    t.money   "valor_final",                               precision: 19, scale: 4, null: false
    t.integer "puntos",                        limit: 2,                            null: false
    t.varchar "nombre",                        limit: 100,                          null: false
  end

  create_table "claves_valor_pagar", primary_key: "clave_valor_pagar", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "claves_valorizacion_devoluciones", primary_key: "clave_valorizacion_devoluciones", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "claves_verificacion_especificaciones", primary_key: "clave_verificacion_especificaciones", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

  create_table "claves_verificacion_margen_ventas", primary_key: "clave", force: :cascade do |t|
    t.varchar "nombre", limit: 50, null: false
  end

