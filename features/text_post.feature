Feature: Posting a Text Post to Tumblr
	Background: 
		Given I choose text post on tumblr

	Scenario: Successful post with title and body
		When I input "title" into tile field
		And I input "body message" into body text field
		And I choose Post
		Then my post should be viewable on my blog with body message

	