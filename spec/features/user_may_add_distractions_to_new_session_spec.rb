require 'spec_helper'

feature "Users may end or add distractions to current sesh", %q{
	# As a user,
	# I'd like to add distractions to new sessions and also end the session
	# so that I have good metrics regarding my study/work habits
} do

# *Allow creation of new distractions that belong_to current session
# *Allow update of session.ended_at
# *and return to sessions index

	scenario "user can add distractions" do
    @user = FactoryGirl.build(:user)
    @user.skip_confirmation!
    @user.save!
  	visit root_path
  	click_link 'Log in'
  	fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
    
    fill_in 'sesh_name', with: 'Test'
    click_button 'MAKE A NEW SESH'
    click_button 'One Distraction'
    expect(page).to have_content('Distraction saved ')
    click_button 'END SESH BRO'
    expect(page).to have_content('Sesh was successfully ended.')
  end
end