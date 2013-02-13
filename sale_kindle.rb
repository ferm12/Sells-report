class SaleKindle #salekindle class
  attr_reader :title, :asin, :transac_type, :units_sold, :units_refunded, :units_sold_borrowed, :perc_of_borrows, :avg_list_price, :avg_offer_price, :avg_file_size_MB, :avg_delivery_cost, :royalty, :crcy, :start_date, :end_date, :country, :store, :import_date

  def initialize(table_row)
    @title							=table_row[0]	#Title
    @asin								=table_row[1]	#ASIN
    @transac_type				=table_row[2]	#Transaction Type*
    @units_sold					=table_row[3]	#Units Sold
    @units_refunded			=table_row[4]	#Units Refunded
    @units_sold_borrowed=table_row[5]	#Net Units Sold or Borrowed**
    @perc_of_borrows		=table_row[6]	#Percentage of Borrows***
    @avg_list_price			=table_row[7]	#Average List Price
    @avg_offer_price		=table_row[8]	#Average Offer Price
    @avg_file_size_MB		=table_row[9]	#Average File Size
    @avg_delivery_cost	=table_row[10]	#Average Delivery Cost
    @royalty						=table_row[11]	#Royalty
    @crcy								=table_row[12]	#(USD)
    @start_date					=table_row[13]	#Sales report for the period
    @end_date			 			=table_row[14]	#Sales report for the period
    @country						=table_row[15]	#Amazon Kindle US/UK/DE/FR/.. Store
		@store							= "kindle"
		@import_date				= Date.today
  end
end
