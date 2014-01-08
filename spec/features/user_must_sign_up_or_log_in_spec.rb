require 'spec_helper'

feature "User must may log in or sign up before accessing core functions", %q{
	# As a user
	# I am prompted to log in or sign up on homepage
	# So that I may use the distraction-tracking abilities of the app
} do

# *Greeted with sign up/login query
# *unless they are remembered
# *trying to access other parts of site while not logged in results in erro

scenario "user is not signed up" do
  visit root_path
  click_button 'Sign up'
  fill_in 'Email', with: 'Amanda@chamberlain.st'
  fill_in 'Password',exactness: true, with: SlamPoet4Lyfe
  fill_in 'Password confirmation', with: SlamPoet4Lyfe
  click_button 'Sign up'

  expect(page).to have_content("A message with a confirmation link has been sent to your email address.")
  end
end