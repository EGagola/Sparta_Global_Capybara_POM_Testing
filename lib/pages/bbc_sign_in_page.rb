require 'capybara/dsl'

class BbcSignInPage
  include Capybara::DSL

  SIGN_IN_PAGE_URL = 'https://account.bbc.com/signin'

  def visit_sign_in_page
    visit(SIGN_IN_PAGE_URL)
  end

  def input_invalid_username
    fill_in('user-identifier-input', :with => 'Moams')
  end

  def input_valid_username
    fill_in('user-identifier-input', :with => 'egagola@spartaglobal.com')
  end

  def input_valid_email_not_existing_account
    fill_in('user-identifier-input', :with => 'elliotgagola@spartaglobal.com')
  end

  def input_invalid_password_too_short
    fill_in('password-input', :with => 't3sting')
  end

  def input_invalid_password_no_numbers
    fill_in('password-input', :with => 'nonumbers')
  end

  def input_invalid_password_no_letters
    fill_in('password-input', :with => '123456789')
  end

  def input_valid_password
    fill_in('password-input', :with => 'FruitM1x')
  end

  def click_sign_in_button
    find('#submit-button').click
  end

end
