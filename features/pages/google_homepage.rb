puts "loaded this page"
class GoogleHomePage < GenericPage
	LOC = "http://google.com"

	EL = {
		search_field: "nflmdlv",
		message: "fnwefsmfkl"
	}

puts "loaded this page"
	def visit
		@browser.goto "http://google.com"
	end

	def search_box
		@browser.text_field(name: 'q')
	end

	def search_box=(term)
		@browser.text_field(name: 'q').set term
	end

	def search_button
		@browser.button(name: 'btnG').when_present
	end

	def search_for(term)
		visit
		search_box = term
		search_button.click
	end
end