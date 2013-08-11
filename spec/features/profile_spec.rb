require 'spec_helper'

def login(user)
  visit signin_path
  fill_in "user[username]", with: user.username
  fill_in "user[password]", with: user.password
  click_button "Sign In"
end 

describe 'Profile' do
	let!(:user) { FactoryGirl.create(:user) }

	before do
		login user
		visit user_path(user)
	end

	it "should display username" do
		page.should have_content(user.username)
	end

	it "should display Questions heading" do
  		page.should have_content('Questions')
	end

	it "should display Comments heading" do
  		page.should have_content('Answers')
	end

	it "should show my geotags" do
		pending
	end

	it "should show my prefered topics" do
		pending
	end

end