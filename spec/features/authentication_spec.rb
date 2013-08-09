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

    describe 'signin with valid information' do

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

      describe "signout" do
        before do
          click_link "Sign out"
        end

        it "should show us the sign in link again" do
          page.should have_link('Sign in', href: signin_path)
        end
      end
    end

    describe "with invalid information" do
      before { click_button "Sign In" }

      it "should show error messages" do
        page.should have_content("Invalid")
      end
    end
  end

  describe "Sign Up" do
    before { visit signup_path }

    it "should display 'sign up' " do
      page.should have_content('Sign Up')
    end

    it "should have a form" do
      page.should have_css('form')
    end

    it "should have a field for username" do
      page.should have_css('input#user_username')
    end

    it "should have a field for password" do
      page.should have_css('input#user_password')
    end

    describe "with valid information" do
      before do
        fill_in "user[username]", with: 'aaaa'
        fill_in "user[password]", with: 'aaaa'
        click_button "Sign Up"
      end

      it "should log a user in and show a sign out link" do
        page.should have_link('Sign out', href: signout_path)
      end
    end

    describe "with a taken username" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "user[username]", with: user.username
        fill_in "user[password]", with: user.password
        click_button "Sign Up"
      end

      it "should show error messages" do
        page.should have_content("Invalid")
      end
    end
  end
end