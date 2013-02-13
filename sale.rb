class Sale #sale class
	attr_reader :isbn, :asin, :sale_date, :qty, :selling_price, :proceed, :total_proceed, :crcy, :country, :store, :transac_type, :avg_offer_price, :import_date
	def initialize(sale, store)
	  if store == "nook"
			@isbn 					= sale.ean 									#["EAN"]
			@asin						= "" 
			@sale_date			= sale.invoice_date 				#["Invoice Date"] 
			@qty 						= sale.units_sold						#["Units Sold"] 
			@selling_price	= sale.consumer_unit_price	#["Consumer Unit Price VAT Exclusive"]
			@proceed 				= sale.item_cost						#["Item Cost"]
			@total_proceed	= sale.total_cost						#["Total Cost"]
			@crcy 					= sale.crcy_of_list_price		#["Currency Of List Price"]
			@country				= sale.country							#"US"
			@store					= sale.store								#"nook"
			@transac_type		= ""
			@avg_offer_price=	""
			@import_date  	= sale.import_date					#Date.today
	  elsif store == "itunes"
			@isbn 					= sale.isrc_isbn 						#table_row["ISRC/ISBN"]  
			@asin						= ""
			@sale_date 			= sale.end_date 						#["End Date"] 
			@qty 						= sale.qty  								#table_row["Quantity"]
			@selling_price	= sale.customer_price 			#["Customer Price"]
			@proceed 				= sale.partner_shr 					#["Partner Share"]
			@total_proceed	= sale.extended_partner_shr	#["Extended Partner Share"]
			@crcy 					= sale.customer_crcy				#["Customer Currency"] 
			@country      	= sale.country_of_sale 			#["Country of Sale"]
			@store					= sale.store								#"itunes"
			@transac_type 	= ""
			@avg_offer_price=	""
			@import_date 		= sale.import_date					#Date.today
		else # store == "kindle"
			@isbn 					=	""
			@asin						= sale.asin 					#[1]ASIN
			@sale_date			= sale.start_date			#[13]Sales report for the period 
			@qty 						= sale.units_sold			#[3]Units Sold
			@selling_price	= sale.avg_list_price	#[7]Average List Price
			@proceed 				= ""
			@total_proceed	= sale.royalty				#[11]Royalty
			@crcy 					= sale.crcy						#[12](USD)
			@country				= sale.country				#[15]Amazon Kindle US Store
			@store					= sale.store					#"kindle"
			@transac_type 	= sale.transac_type
			@avg_offer_price= sale.avg_offer_price
 			@import_date		= sale.import_date		#"Date.today"
		end  	
	end
end
