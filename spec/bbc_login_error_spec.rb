require 'spec_helper'

describe "Incorrect user details produces valid error" do

  context "it should respond with the correct error when incorrect details are input" do

    it "should produce three error messages when both username and password are left blank" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_homepage
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.find("#form-message-username").text).to eq "Something's missing. Please check and try again."
      expect(@bbc_site.bbc_sign_in_page.find("#form-message-password").text).to eq "Something's missing. Please check and try again."
      expect(@bbc_site.bbc_sign_in_page.find("#form-message-general").text).to eq "Sorry, those details don't match. Check you've typed them correctly."
    end

    it "should produce an error when inputting an incorrect username with a valid password" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_sign_in_page.visit_sign_in_page
      @bbc_site.bbc_sign_in_page.input_invalid_username
      @bbc_site.bbc_sign_in_page.input_valid_password
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.find("#form-message-username").text).to eq "Sorry, we can’t find an account with that username. If you're over 13, try your email address instead or get help here."
    end

    it "should produce an error when inputting a blank username with a valid password" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_sign_in_page.visit_sign_in_page
      @bbc_site.bbc_sign_in_page.input_valid_password
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.find("#form-message-username").text).to eq "Something's missing. Please check and try again."
    end

    it "should produce an error when inputting a valid username and an invalid password that is too short" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_sign_in_page.visit_sign_in_page
      @bbc_site.bbc_sign_in_page.input_valid_email_not_existing_account
      @bbc_site.bbc_sign_in_page.input_invalid_password_too_short
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.find("#form-message-password").text).to eq "Sorry, that password is too short. It needs to be eight characters or more."
    end

    it "should produce an error when inputting a valid username and an invalid password that has no numbers in" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_sign_in_page.visit_sign_in_page
      @bbc_site.bbc_sign_in_page.input_valid_email_not_existing_account
      @bbc_site.bbc_sign_in_page.input_invalid_password_no_numbers
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.find("#form-message-password").text).to eq "Sorry, that password isn't valid. Please include something that isn't a letter."
    end

    it "should produce an error when inputting a valid username and an invalid password that has no letters in" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_sign_in_page.visit_sign_in_page
      @bbc_site.bbc_sign_in_page.input_valid_email_not_existing_account
      @bbc_site.bbc_sign_in_page.input_invalid_password_no_letters
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.find("#form-message-password").text).to eq "Sorry, that password isn't valid. Please include a letter."
    end

    it "should return an error if both a valid username and password are entered, but the username doesn't match an existing account" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_sign_in_page.visit_sign_in_page
      @bbc_site.bbc_sign_in_page.input_valid_email_not_existing_account
      @bbc_site.bbc_sign_in_page.input_valid_password
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.find("#form-message-username").text).to eq "Sorry, we can’t find an account with that email. You can register for a new account or get help here."
    end

    it "should return an error when there is a valid username and password, but the password entered doesn't match the password registered on the account" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_sign_in_page.visit_sign_in_page
      @bbc_site.bbc_sign_in_page.input_valid_username
      @bbc_site.bbc_sign_in_page.input_valid_password
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.find("#form-message-password").text).to eq "Uh oh, that password doesn’t match that account. Please try again."
    end
  end
end
