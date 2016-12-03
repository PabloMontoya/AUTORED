class Lineasprod < ActiveRecord::Base
	has_many :products
	self.table_name = "lineas_productos"
end