class SaleItunes # saleItunes
	attr_reader :start_date, :end_date, :upc, :isrc_isbn, :vendor_id, :qty, :partner_shr, :extended_partner_shr, :partner_shr_crcy, :sales_or_return, :apple_id, :author, :title, :publisher, :grid, :product_type_id, :isa_other_id, :country_of_sale, :pre_order_flag, :promo_code, :customer_price, :customer_crcy, :store, :import_date
	def initialize(table_row)
		@start_date= table_row["Start Date"]
		@end_date						= table_row["End Date"]			
		@upc								= table_row["UPC"]
		@isrc_isbn					= table_row["ISRC/ISBN"]
		@vendor_id 					= table_row["Vendor Identifier"]
		@qty								= table_row["Quantity"]
		@partner_shr				= table_row["Partner Share"]
		@extended_partner_shr= table_row["Extended Partner Share"]
		@partner_shr_crcy		= table_row["Partner Share Currency"]
		@sales_or_return 		= table_row["Sales or Return"]
		@apple_id						= table_row["Apple Identifier"]
		@author							= table_row["Artist/Show/Developer/Author"] 
		@title							= table_row["Title"]
		@publisher					= table_row["Label/Studio/Network/Developer/Publisher"]
		@grid								= table_row["Grid"]
		@product_type_id		= table_row["Product Type Identifier"]
		@isa_other_id				= table_row["ISA/Other Identifier"]
		@country_of_sale		= table_row["Country Of Sale"]
		@pre_order_flag			= table_row["Pre-order Flag"]
		@promo_code					= table_row["Promo Code"]
		@customer_price			= table_row["Customer Price"] 
		@customer_crcy			= table_row["Customer Currency"]
		@store							= "itunes"
		@import_date				= Date.today
	end
end
