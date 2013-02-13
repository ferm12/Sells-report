require "amalgalite"

class Report
	def initialize(table_to_analyze, db_handler)
		@table_to_analyze = table_to_analyze
		@db = db_handler.db
	end
	
	def get_books_by_title(title)
		i = 0
		@db.execute("SELECT title FROM #{@table_to_analyze} WHERE title='#{title}'") do |n|
			i += 1
		end
		puts "There are #{i} sales with title '#{title}'"
	end
	
	def get_books_by_isbn_asin(isbn_asin)
		i = 0
		@db.execute("SELECT ean FROM #{@table_to_analyze} WHERE ean='#{isbn_asin}'") do |n|
			i += 1
		end
		puts "There are #{i} sales with the ISBN/ASIN '#{isbn_asin}'"
	end
end






























	# def get_books_with_title(title)
	# 	db.execute("SELECT title FROM	sample1 WHERE title='#{title}'")
	# 	i = 0
	# 	@table.each do |row|
	# 		if (row.title == title)	
	# 			i += 1	
	# 		end
	# 	end
	# 	puts "There are #{i} books with title '#{title}'"
	# end
