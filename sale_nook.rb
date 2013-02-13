class SaleNook #nook class
	attr_reader :vendor_num, :ean, :title, :author, :publisher, :format, :order_type, :egift_date, :sale_crcy, :dlp_sale_crcy, :consumer_unit_price, :units_sold, :units_returned, :royalty, :unit_cost_sale_crcy, :total_cost_sale_crcy, :payment_crcy, :total_cost, :item_cost, :crcy_of_list_price, :invoice_date, :country, :store, :import_date 	
	def initialize(table_row)
		@vendor_num				= table_row["Vendor Number"]
		@ean						= table_row["EAN"]			
		@title 					= table_row["Title"]
		@author 					= table_row["Author"]
		@publisher 				= table_row["Publisher Name"]
		@format					= table_row["Format"]
		@order_type 			= table_row["Order Type"]
		@egift_date				= table_row["eGift Date"]
		@sale_crcy				= table_row["Sale Currency"]
		@dlp_sale_crcy 		= table_row["DLP Sale Currency VAT Exclusive"]
		@consumer_unit_price	= table_row["Consumer Unit Price VAT Exclusive"]
		@units_sold				= table_row["Units Sold"] 
		@units_returned		= table_row["Units Returned"]
		@royalty					= table_row["Royalty"]
		@unit_cost_sale_crcy	= table_row["Unit Cost Sale Currency"]
		@total_cost_sale_crcy= table_row["Total Cost Sale Currency"]
		@payment_crcy			= table_row["Payment Currency"]
		@total_cost				= table_row["Total Cost"]
		@item_cost				= table_row["Item Cost"]
		@crcy_of_list_price	= table_row["Currency Of List Price"]
		@invoice_date			= table_row["Invoice Date"]
		@country					= "US"
		@store						= "nook"
		@import_date			=Date.today 
	end
end
