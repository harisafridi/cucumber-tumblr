=begin
class Product

	attr_accessor: :sku, :title, :description, :image_url, :price
    
    @@products = []
	def initialize(params = {})

		raise ArgumentError, "No named parameter `title` provided as a string" unless params[:title]
		@title = params[:title]
		@sku = params[:sku] || "SKU-#{rand(10000)}"
		@description = params[:description] || "SKU-#{rand(10000)}"
		@image_url = params[:image_url] || "http:///"
		@price = params[:price] || 10000


		MyApi.call

		@@products << self
	end

	def price_in_pounds
		"£#{@price.to_f/100}"
	end

	def self.all
		@@products
	end

	def self.first
		@@products
	end

	def self.last
		@@products
	end

	def self.find(params)
		results = []
		raise ArgumentError, "No named parameter `title` provided as a string" unless params[:title]
		@@products.each do |product|
		results << product if params[:sku] && product.sku == params[:sku]
		results << product if params[:price] && product.price == params[:price]

		results << product if params[:title] && product.title.include? == params[:title]
	end

	if results.size == 1
		return results[0]
	elsif results.size == 0
		return nil
	else
	return results
end
#Product.new title: "Title"
#Product.find sku: "SKU:312"
end
end
=end