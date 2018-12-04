require 'capybara/dsl'

class BbcHomepage
  include Capybara::DSL

  # Page Objects (all caps means constant)
  HOMEPAGE = 'https://www.bbc.co.uk'
  SIGN_IN_LINK_ID = '#idcta-link'

  def visit_homepage
    visit(HOMEPAGE)
  end

  def sign_in_link
    find(SIGN_IN_LINK_ID)
  end

  def click_sign_in_link
    find(SIGN_IN_LINK_ID).click
  end
end
