Given(/^I am on the login page$/) do
  @browser.goto "http://tumblr.com/login"
end

When(/^I input "([^"]*)" into username field$/) do |arg1|
  @browser.text_field(name: 'user[email]').when_present.set arg1
end

When(/^I input "([^"]*)" into password field$/) do |arg1|
  @browser.text_field(name: 'user[password]').when_present.set arg1
end

When(/^I choose login$/) do
  @browser.button(id: 'signup_forms_submit').click
end

Then(/^I should be able to see my blog dashboard$/) do
 
  @browser.div(id: 'account_button').when_present.click
  #expect(@browser.div(id: 'account_button').when_present.text).to eq "Log out"
  expect(@browser.div(id: 'inbox_button').when_present.text).to eq "Inbox"

end

Then(/^a message should be displayed saying "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
