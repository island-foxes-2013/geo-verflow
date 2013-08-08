require 'spec_helper'

describe 'Authentication' do
  
  describe 'Sign In Page' do
    before { visit signin_path }

    it "should display 'sign in'" do
      page.should have_content('Sign In')
    end

    it "should have a form to enter username and password" do
      page.should have_css('form')
    end

    describe 'with valid information' do

      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "user[username]", with: user.username
        fill_in "user[password]", with: user.password
        click_button "Sign In"
      end

      it "should show a profile link" do
        page.should have_link('Profile', href: user_path(user))
      end

      it "should have a sign out link" do
        page.should have_link('Sign out', href: signout_path)
      end

      it "should not have a link to sign in" do
        page.should_not have_link('Sign in', href: signin_path)
      end
      
    end
  end
end