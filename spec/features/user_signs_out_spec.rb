require 'spec_helper'

feature "user signs out", %q{
  As a User
  I want to sign out
  So that other people can't use my account
} do

  scenario "user signs out" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    click_on "Sign out"

    expect(page).to have_content "Signed out successfully."
  end
end
Run the tests.

If you were paying close attention to the test we wrote above you might have noticed that we're using a #sign_in_as method. This is a custom helper method that we have to now define. You can create helper methods for your tests inside the spec/support directory:

# spec/support/authentication_helpers.rb

module Helpers
  module Authentication
    def sign_in_as(user)
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Sign in"
    end
  end
end
