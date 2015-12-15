
browser = Watir::Browser.new :chrome


Before do 
	@browser = browser	
	#@App = App.new browser
end

at_exit do 
    @browser.close
end