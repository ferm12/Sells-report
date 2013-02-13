require_relative 'importer'
require_relative 'db_handler'
require_relative 'reports'
#main
###############################################nook

puts "Enter Nook sales file to import"
file_nook = gets.chomp
db_handler = DBhandler.new
Importer.import_nook(file_nook, db_handler) 
# 
# puts "Do you want to display the nook table"
# nook_table = gets.chomp
# if (nook_table == "y")
# 	db_handler.show_nook_table
# 	puts "Sale report"
# 	db_handler.show_sale_table
# end
# 
# puts "Show sales of which title"
# book_title = gets.chomp
# report = Report.new("sales_nook", db_handler)
# report.get_books_by_title(book_title)
# 
# puts "Enter the ISNB/ASIN of the book"
# book_isnb_asin = gets.chomp
# report.get_books_by_isbn_asin(book_isnb_asin)
# 
###############################################itunes
puts "Enter itunes sales file to import"
file_itunes = gets.chomp
Importer.import_itunes(file_itunes, db_handler)
# 
# puts "Do you want to display the itunes table? y,n"
# itunes_table = gets.chomp
# if (itunes_table == "y")
# 	db_handler.show_itunes_table
# 	puts "Sale report"
# 	db_handler.show_sale_table
# end
# puts "On the itunes table which title you wan to see the sales on?"
# book_title2 = gets.chomp
# report2 = Report.new("sales_itunes", db_handler)
# report2.get_books_by_title(book_title2)
# 
###############################################kindle
puts "Enter kindle sales file to import"
file_kindle = gets.chomp
# db_handler = DBhandler.new
Importer.import_kindle(file_kindle, db_handler)
# db_handler.show_kindle_table

# puts "Do you want to display the nook table"
# kindle_table = gets.chomp
# if (kindle_table == "y")
# 	db_handler.show_kindle_table
# end

# def parse_currency(currency_from_report="(USD)" )
# 	currency_from_report.delete "()"
# end  
# puts "#{parse_currency()}"
# 
# 
# def parse_start_date(report_period="Sales report for the period 01-Oct-2012 to 31-Oct-2012" )
# 	date = report_period.slice(28,11)
# 	formated_date = Date.parse(date)
# 	formated_date.strftime('%Y-%m-%d')
# end
# puts "#{parse_start_date()}"
# 
# def parse_end_date(report_period="Sales report for the period 01-Oct-2012 to 31-Oct-2012" )
# 	date = report_period.slice(43,11)
# 	formated_date = Date.parse(date)
# 	formated_date.strftime('%Y-%m-%d')
# end
# puts "#{parse_end_date()}"
# 
# def parse_store(country ="Amazon Kindle US Store")
# 	country.slice(14,8)
# end 
# puts "#{parse_store()}"
# def first_row(row_col0 = "Title")
# 	row_col0.include? "Title"
# end
# 
# puts first_row
		
# def first_row(row_col0 = "this this a test Title")
# 	row_col0.include? "Title"
# end
# 
# unless first_row()
# 	puts "false"
# else	
# 	puts "true"
# end
# test = [["adfadf","lad aldhlf kl a",],[],[]]
# puts Date.today
