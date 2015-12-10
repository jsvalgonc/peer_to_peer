Given /^I am on (.+)$/ do |page_name|
  path_to_page_name = path_to(page_name)
  visit path_to_page_name 
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end


When /^I select "([^"]*)" as the (.+) "([^"]*)" date$/ do |date, model, selector|
  date = Date.parse(date)
  select(date.year.to_s, :from => "#{model}[#{selector}(1i)]")
  select(date.strftime("%B"), :from => "#{model}[#{selector}(2i)]")
  select(date.day.to_s, :from => "#{model}[#{selector}(3i)]")
end




When /^In line "(.*?)" I press "(.*?)"$/ do |line,button|
  find(:xpath, "//tr[contains(.,line)]/td/a", :text => button).click
end

When(/^I chosee "(.*?)" from drop box "(.*?)"$/) do |option, box|
  select(option, :from => box)
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
  @investor = FactoryGirl.create(:investor, full_name: investor)
  @account_movements = FactoryGirl.create(:account_movement, value: value, investor: @investor)
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

Given(/^there's a entrepreneur named "(.*?)"$/) do |full_name|
  #@investor = FactoryGirl.create(:investor, full_name: full_name, address: "Rua do Lá Vai Um, n.1, 456º Frente", zip_code: "1000-000",town: "Lisboa",country: "Portugal",fiscal_number: "12345678")
  @investor = FactoryGirl.create(:guedes, full_name: full_name)
end

Given(/^there's a project named "(.*?)" by "(.*?)"$/) do |project, entrepreneur|  #@investor = FactoryGirl.create(:investor, full_name: full_name, address: "Rua do Lá Vai Um, n.1, 456º Frente", zip_code: "1000-000",town: "Lisboa",country: "Portugal",fiscal_number: "12345678")
#  Falta fazer a ligação ao investidor
  @entrepreneur = FactoryGirl.create(:entrepreneur, full_name: entrepreneur)
  @project = FactoryGirl.create(:ArrumarCarros,description: project, entrepreneur: @entrepreneur)
end


World(NavigationHelpers)