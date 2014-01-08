require 'spec_helper'

feature "Users may end or add distractions to current sesh", %q{
	# As a user,
	# I'd like to add distractions to new sessions and also end the session
	# so that I have good metrics regarding my study/work habits
} do

# *Allow creation of new distractions that belong_to current session
# *Allow update of session.ended_at
# *and return to sessions index
	background do
    User.create(:email => 'user@example.com', :password => 'caplin')
  end
	scenario "user can add distractions" do
		visit root_path
		click_link 'Log in'
		fill_in 'Email', with:  'user@example.com'
    fill_in 'Password', with:  'caplin'
    click_button 'Sign in'
    expect(page).to have_content('Signed in')
    fill_in 'sesh', with: 'Test'
    click_button 'MAKE A NEW SESH'
    click_button 'One Distraction'
    expect(page).to have_content('Distraction saved ')
    click_button 'END SESH BRO'
    expect(page).to have_content('Sesh was successfully ended.')
  end
end