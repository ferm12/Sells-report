require "amalgalite"

class DBhandler #dbhandler class  
	attr_reader :db
	
	def initialize
		@db = Amalgalite::Database.new("kitereaders_sales.db")
		@db.execute("CREATE TABLE IF NOT EXISTS sales_nook(id INTEGER PRIMARY KEY, vendor_num SMALLINT, ean INTEGER, title TEXT, author TEXT, publisher TEXT, format TEXT, order_type TEXT, egift_date TEXT, sale_crcy FLOAT, dlp_sale_crcy FLOAT, consumer_unit_price FLOAT, units_sold TINYINT, units_returned TINYINT, royalty FLOAT, units_cost_sale_crcy FLOAT, total_cost_sale_crcy FLOAT, payment_crcy FLOAT, total_cost FLOAT, item_cost FLOAT, crcy_of_list_price FLOAT, invoice_date TEXT, country TEXT, store TEXT, import_date INTEGER)")
		@db.execute("CREATE TABLE IF NOT EXISTS sales_itunes(id INTEGER PRIMARY KEY, start_date TEXT, end_date TEXT, upc TEXT, isrc_isbn BIGINT, vendor_id BIGINT, qty SMALLINT, partner_shr FLOAT, extended_partner_shr FLOAT, partner_shr_crcy VARCHAR, sales_or_return VARCHAR, apple_id INTEGER, author TEXT, title TEXT, publisher TEXT, grid TEXT, product_type_id VARCHAR, isa_other_id TEXT, country_of_sale VARCHAR, pre_order_flag TEXT, promo_code VARCHAR, customer_price FLOAT, customer_crcy VARCHAR, store TEXT ,import_date INTEGER)")
		@db.execute("CREATE TABLE IF NOT EXISTS sales_kindle(id INTEGER PRIMARY KEY, title TEXT, asin BIGINT, transac_type TEXT, units_sold INTEGER, units_refunded SMALLINT, units_sold_borrowed INTEGER, perc_of_borrows TEXT, avg_list_price FLOAT, avg_offer_price TEXT, avg_file_size_MB TEXT, avg_delivery_cost TEXT, royalty FLOAT, crcy TEXT, start_date INTEGER, end_date INTEGER, country TEXT, store TEXT,import_date INTEGER)")
		@db.execute("CREATE TABLE IF NOT EXISTS sale(id INTEGER PRIMARY KEY, isbn INTEGER, asin INTEGER, sale_date TEXT, qty SMALLINT, selling_price FLOAT, proceed FLOAT, total_proceed FLOAT, crcy TEXT, country TEXT, store TEXT, transac_type TEXT, avg_offer_price TEXT, import_date INTEGER)")
		@db.execute("CREATE TABLE IF NOT EXISTS books(id INTEGER PRIMARY KEY, account_id INTEGER, isbn BIGINT, asin TEXT, title TEXT)"
		@db.execute("CREATE TABLE IF NOT EXISTS accounts(id INTEGER PRIMARY KEY, account_id INTEGER, account_name TEXT, royalty FLOAT)")
	)
	end

#	def create_table(table)
#		@db.execute("CREATE TABLE IF NOT EXISTS #{table}(vendor_num SMALLINT, ean INTEGER, title TEXT, author TEXT, publisher TEXT, format TEXT, order_type TEXT, egift_date TEXT, sale_crcy FLOAT, dlp_sale_crcy FLOAT, consumer_unit_price FLOAT, units_sold TINYINT, units_returned TINYINT, royalty FLOAT, units_cost_sale_crcy FLOAT, total_cost_sale_crcy FLOAT, payment_crcy FLOAT, total_cost FLOAT, item_cost FLOAT, crcy_of_list_price FLOAT, invoice_date TEXT)")
#	end
	
	def insert_sale_to_nook(sale)
		@db.execute("INSERT INTO sales_nook VALUES(NULL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", sale.vendor_num, sale.ean, sale.title, sale.author, sale.publisher, sale.format, sale.order_type, sale.egift_date, sale.sale_crcy, sale.dlp_sale_crcy, sale.consumer_unit_price, sale.units_sold, sale.units_returned, sale.royalty, sale.unit_cost_sale_crcy, sale.total_cost_sale_crcy, sale.payment_crcy, sale.total_cost, sale.item_cost, sale.crcy_of_list_price, sale.invoice_date, sale.country, sale.store, sale.import_date)
	end
	
	def insert_sale_to_itunes(sale)
		@db.execute("INSERT INTO sales_itunes VALUES(NULL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", sale.start_date, sale.end_date, sale.upc, sale.isrc_isbn, sale.vendor_id, sale.qty, sale.partner_shr, sale.extended_partner_shr, sale.partner_shr_crcy, sale.sales_or_return, sale.apple_id, sale.author, sale.title, sale.publisher, sale.grid, sale.product_type_id, sale.isa_other_id, sale.country_of_sale, sale.pre_order_flag, sale.promo_code, sale.customer_price, sale.customer_crcy, sale.store ,sale.import_date)
	end
	
	def insert_sale_to_kindle(sale)
		@db.execute("INSERT INTO sales_kindle VALUES(NULL,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",sale.title, sale.asin, sale.transac_type, sale.units_sold, sale.units_refunded, sale.units_sold_borrowed, sale.perc_of_borrows, sale.avg_list_price, sale.avg_offer_price, sale.avg_file_size_MB, sale.avg_delivery_cost, sale.royalty, sale.crcy, sale.start_date, sale.end_date, sale.country, sale.store, sale.import_date)			
	end
	
	def insert_to_sale(sale)
		@db.execute("INSERT INTO sale VALUES(NULL,?,?,?,?,?,?,?,?,?,?,?,?,?)",sale.isbn, sale.asin, sale.sale_date, sale.qty, sale.selling_price, sale.proceed, sale.total_proceed, sale.crcy, sale.country, sale.store, sale.transac_type, sale.avg_offer_price, sale.import_date) 
	end
	
	def insert_to_book(book)
		@db.execute("INSERT INTO books VALUES(NULL,?,?,?,?)",book.account_id, book.isbn, book.asin, book.title)
	end

	def insert_to_account(account)
		@db.execute("INSERT INTO accounts VALUES(NULL,?,,?)",account_id, account_name,accoutn.royalty)
	end

	def show_nook_table
		col_info = @db.execute("PRAGMA table_info(sales_nook)")
		col_info.each do |col_info| 
			col_name = col_info[1]		#prints the column name  
			print "#{col_name}|"
		end
		puts ""
		@db.execute("SELECT * FROM sales_nook") do |row|
			puts "#{row['vendor_num']}|#{row['ean']}|#{row['title']}|#{row['author']}|#{row['publisher']}|#{row['format']}|#{row['order_type']}|#{row['egift_date']}|#{row['dlp_sale_crcy']}|#{row['consumer_unit_price']}|#{row['units_sold']}|#{row['units_returned']}|#{row['royalty']}|#{row['unit_cost_sale_crcy']}|#{row['total_cost_sale_crcy']}|#{row['payment_crcy']}|#{row['total_cost']}|#{row['item_cost']}|#{row['crcy_of_list_price']}|#{row['invoice_date']}|#{row['import_date']}"
		end 
	end
	
	def show_itunes_table
		col_info = @db.execute("PRAGMA table_info(sales_itunes)")
		col_info.each do |col_info| 
			col_name = col_info[1]		#prints the column name  
			print "#{col_name}|"
		end
		puts ""
		@db.execute("SELECT * FROM sales_itunes") do |row|
			puts "#{row['start_date']}|#{row['end_date']}|#{row['upc']}|#{row['isrc_isbn']}|#{row['vendor_id']}|#{row['qty']}|#{row['partner_shr']}|#{row['extended_partner_shr']}|#{row['partner_shr_crcy']}|#{row['sales_or_return']}|#{row['apple_id']}|#{row['author']}|#{row['title']}|#{row['publisher']}|#{row['grid']}|#{row['product_type_id']}|#{row['isa_other_id']}|#{row['country_of_sale']}|#{row['pre_order_flag']}|#{row['promo_code']}|#{row['customer_price']}|#{row['customer_crcy']}|#{row['import_date']}"
		end 
	end
	
	def show_kindle_table
		col_info = @db.execute("PRAGMA table_info(sales_kindle)")
		col_info.each do |col_info| 
			col_name = col_info[1]		#prints the column name  
			print "#{col_name}|"
		end
		puts ""
		@db.execute("SELECT * FROM sales_kindl") do |row|
			puts "#{row['title']}|#{row['asin']}|#{row['transac_type']}|#{row['units_sold']}|#{row['units_refunded']}|#{row['units_sold_borrowed']}|#{row['perc_of_borrows']}|#{row['avg_list_price']}|#{row['avg_offer_price']}|#{row['avg_file_size_MB']}|#{row['avg_delivery_cost']}|#{row['royalty']}|#{row['crcy']}|#{row['start_end_date']}|#{row['country']}|#{row['import_date']}"
		end 
	end
	
	def show_sale_table
		col_info = @db.execute("PRAGMA table_info(sale)")
		col_info.each do |col_info| 
			col_name = col_info[1]		#prints the column name  
			print "#{col_name}|"
		end
		puts ""
		@db.execute("SELECT * FROM sale") do |row|
			puts "|#{row['isbn']}|#{row['sale_date']}|#{row['qty']}|#{row['selling_price']}|#{row['proceed']}|#{row['total_proceed']}|#{row['crcy']}|#{row['import_date']}"
		end
	end
end
