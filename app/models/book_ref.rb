class BookRef < ActiveRecord::Base
  belongs_to :booking
  belongs_to :room_information

 #  	def self.search(params = {})
 #    	products = params[:product_ids].present? ? BookRef.find(params[:start_date]) : Product.all
	# end
end



