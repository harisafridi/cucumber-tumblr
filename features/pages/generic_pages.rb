class  GenericPage
	puts "loaded this page"
	include RSpec::Matchers
	attr_accessor :browser

	def initialize(browser)
		@browser = browser
	end

	def el(key)
		@browser.element(css: EL(key))
	end
	def element_exists?(el)
		@browser.element(el).exists?
	end

	def url
		@browser.url
	end

	def title
		@browser.title
	end
end