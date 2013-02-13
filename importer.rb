require "csv"
require_relative 'sale_nook'
require_relative 'sale_itunes'
require_relative 'sale_kindle'
require_relative 'db_handler'
require_relative 'sale'

module Importer	#Imports the table(csv file)
  def self.import_nook(file, db_handler)
    CSV.foreach(file, :headers => true) do |table_row|
      sale = SaleNook.new(table_row)
      report_sale = Sale.new(sale, "nook")
      db_handler.insert_sale_to_nook(sale)
      db_handler.insert_to_sale(report_sale)
    end
  end

  def self.import_itunes(file, db_handler)
    CSV.foreach(file, :headers => true) do |table_row|
      sale = SaleItunes.new(table_row)
      report_sale = Sale.new(sale, "itunes")
      db_handler.insert_sale_to_itunes(sale)
      db_handler.insert_to_sale(report_sale)
    end
  end

  #by aarti
  def self.import_kindle(file, db_handler)
    header_row = []
    values_from_header = []
    counter = 0
    parsed_file = CSV::read(file)
    parsed_file.each_with_index do |row, idx|
      unless row.empty?
        break if self.end_of_file(row)
        if idx <= counter + 3
          # puts "Header Row found: #{row}"
          header_row << row
        end
        if idx == counter + 3
          values_from_header = self.parse_header(header_row)
          # puts "Header Values: #{values_from_header}"
        end
        if (idx > counter + 3)
          unless self.last_row(row[0]) or self.no_sales( row , values_from_header[:store])
            # puts "Data Row: #{row}"
            row << values_from_header[:currency]
            row << values_from_header[:start_date]
            row << values_from_header[:end_date]
            row << values_from_header[:store]
            sale = SaleKindle.new(row)
						report_sale = Sale.new(sale,"kindle")
            db_handler.insert_sale_to_kindle(sale)
						db_handler.insert_to_sale(report_sale)
          else
            # puts "Last Row or No Sales detected for store #{values_from_header[:store]}: #{row}"
            counter = 3+idx
            header_row.clear
          end
        end

      end
    end
  end

  def self.end_of_file( row)
    if !row[0].nil?
      return row[0].include? "*There can be 5 Transaction Types"
    end
    false
  end


  def self.no_sales(row=["There were no sales during this period",nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil], store )
    if row[1].nil? && !row[0].nil?
      # puts " No sale for country #{store}"
      return row[0].include? "There were no sales during this period"
    end
    false
  end
  # def self.first_row(row_col0 = "Title")
  def self.first_row(row_col0)
    row_col0.include? "Title"
  end

  # def self.last_row(row_col0 = "Total Royalty")
  def self.last_row(row_col0)
    row_col0.include? "Total"
  end

  def self.parse_header(header_row)
    # header = 	header_row[0]
    currency =	parse_currency(header_row[1][7])
    start_date =parse_start_date(header_row[2][0])
    end_date =	parse_end_date(header_row[2][0])
    store = 		parse_store(header_row[3][0])

    return {currency: currency, start_date: start_date, end_date: end_date, store: store}
  end

  # def self.parse_currency(currency_from_report="(USD)" )
  def self.parse_currency(currency_from_report )
    currency_from_report.delete '()'
  end

  # def self.parse_start_date(report_period="Sales report for the period 01-Oct-2012 to 31-Oct-2012")
  def self.parse_start_date(report_period)
    date = report_period.slice(28,11)
    formated_date = Date.parse(date)
    formated_date.strftime('%Y-%m-%d')
  end

  # def self.parse_end_date(report_period="Sales report for the period 01-Oct-2012 to 31-Oct-2012" )
  def self.parse_end_date(report_period)
    date = report_period.slice(43,11)
    formated_date = Date.parse(date)
    formated_date.strftime('%Y-%m-%d')
  end

  # def self.parse_store(country ="Amazon Kindle US Store")
  def self.parse_store(country)
    country.slice(14,8)
  end
end
