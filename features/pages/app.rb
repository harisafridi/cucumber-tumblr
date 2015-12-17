class App
	def initialize(browser)
	 @b = browser 
	end

	def generic
     GenericPage.new @b
    end

    def tumblrlogin 
     LoginTumblr.new @b
	end

    def tumblrdashboard 
	 TumblrDashboard.new @b
	end
end