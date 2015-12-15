Given(/^I am on the login page$/) do
  binding.pry
  
end

When(/^I input "([^"]*)" into username field$/) do |arg1|
  @browser.text_field(name: 'user[email]').when_present.set arg1
end

When(/^I input "([^"]*)" into password field$/) do |arg1|
  @browser.text_field(name: 'user[password]').when_present.set arg1
end

When(/^I choose login$/) do
  @browser.button(id: 'signup_forms_submit').when_present.click
end

Then(/^I should be able to see my blog dashboard$/) do
 
  #@browser.div(id: 'account_button').when_present.click
  #expect(@browser.div(id: 'account_button').when_present.text).to eq "Log out"
  expect(@browser.div(id: 'inbox_button').when_present.text).to eq "Inbox"

end

Then(/^a message should be displayed saying error incorrect password or captcha$/) do
  expect(@browser.li(class: 'error').when_present.text).to match /Your email or password were incorrect.|Don't forget to fill out the Captcha!/
end

Given(/^I choose text post on tumblr$/) do
    expect(@browser.url).to match /.*dashboard/
    @browser.i(class: "icon_post_text").when_present.click
    
end

When(/^I input "([^"]*)" into tile field$/) do |title|
  @browser.element(class: 'editor-plaintext').when_present.send_keys title
    
end

When(/^I input "([^"]*)" into body text field$/) do |bmessage|
  @browser.element(class: 'editor-plaintext').send_keys "\t#{bmessage}"
end

When(/^I choose Post$/) do
  @browser.button(class: "create_post_button").wait_while_present.click
  

end

Then(/^my post should be viewable on my blog with body message$/) do 
  @browser.goto "https://www.tumblr.com/blog/afridiharis"
   @browser.divs(class: "post_body").each do |o| 
         expect(o.text).to match /body message/
       end
end