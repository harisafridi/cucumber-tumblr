class TumblrDashboard < GenericPage
  EL = {
    title: 'editor-plaintext',
    body: 'editor-plaintext',
    button_post_text: 'icon_post_text',
    post: 'create_post_button'
     }
	
	def click_post_text
		@browser.i(class: EL[:button_post_text]).when_present.click
	end 

	def write_title (title_text)
        @browser.element(class: EL[:title]).when_present.send_keys title_text
	end

    def write_body (body_text)
        @browser.element(class: EL[:body]).when_present.send_keys "\t#{body_text}"
    end

	def post
		@browser.button(class: EL[:post]).when_present.click
		@browser.driver.manage.timeouts.implicit_wait = 5
		if @browser.alert.exists? {
          @browser.send_keys :return }
        end
    end
    def verify_post_body (body)
    	@browser.driver.manage.timeouts.implicit_wait = 3
    		puts "The body here: #{body}"
    	if @browser.alert.exists? {
          @browser.send_keys :return }
        end
    	@browser.goto "https://www.tumblr.com/blog/afridiharis"
    	@browser.driver.manage.timeouts.implicit_wait = 3
		@browser.divs(class: "post_body").each do |o| 
         expect(o.text).to match /#{body}/
        end
    end
    def verify_post_title (title)
		@browser.divs(class: "post_title").each do |o| 
			puts "The title here: #{title}"
         expect(o.text).to include title
       end
    end
end