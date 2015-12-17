class LoginTumblr < GenericPage
	LOC = "https://www.tumblr.com/login"
  EL = {
    username: 'user[email]',
    password: 'user[password]',
    click_login: 'signup_forms_submit'
     }
	
	def visit
		@browser.goto LOC
	end

	def login_username (username)
    @browser.text_field(name: EL[:username]).when_present.set username
	end

  def login_password (password)
     @browser.text_field(name: EL[:password]).when_present.set password
  end

	def login
		@browser.button(id: EL[:click_login]).when_present.click
	end

end