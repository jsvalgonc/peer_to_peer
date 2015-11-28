Given /^I am on (.+)$/ do |page_name|
  path_to_page_name = path_to(page_name)
  visit path_to_page_name 
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end


When /^In line "(.*?)" I press "(.*?)"$/ do |line,button|
  find(:xpath, "//tr[contains(.,line)]/td/a", :text => button).click
end


When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  User.new(:email => email, :password => password, :password_confirmation => password).save!

  visit 'users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Entrar"
end

Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I am authenticated as a Financial Manager$/ do
  email = 'testingFM@man.net'
  password = 'secretpass'
  role = :finance
  User.new(:email => email, :password => password, :password_confirmation => password, :role => role).save!

  visit 'users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Entrar"
end

Given(/^there's a investor named "(.*?)"$/) do |full_name|
  #@investor = FactoryGirl.create(:investor, full_name: full_name, address: "Rua do Lá Vai Um, n.1, 456º Frente", zip_code: "1000-000",town: "Lisboa",country: "Portugal",fiscal_number: "12345678")
  @investor = FactoryGirl.create(:investor)
end

Given(/^there's a movement of (\d+) in "(.*?)" account$/) do |value, investor|
  byebug
  @account_movements = FactoryGirl.create(:account_movement, value: value)
  byebug
end

Given(/^I am authenticated as "(.*?)"$/) do |arg1|
  email = 'josesilva@man.net'
  password = 'secretpass'
  role = :investor
  User.new(:email => email, :password => password, :password_confirmation => password, :role => role).save!
  visit 'users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Entrar"
end



World(NavigationHelpers)