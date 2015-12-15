Feature: Logging into Tumblr
	Background: 
		Given I am on the login page

	Scenario: Unsuccessful login with incorrect credentials
		When I input "incorrect username" into username field
		When I input "incorrect password" into password field 
		And I choose login
		Then a message should be displayed saying error incorrect password or captcha

	Scenario: Successful login with correct credentials
		When I input "hmohammad@spartaglobal.com" into username field
		When I input "testing123" into password field 
		And I choose login 
		Then I should be able to see my blog dashboard

	 
