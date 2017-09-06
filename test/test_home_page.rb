require 'selenium-webdriver'
require 'test/unit'

module Test
  class TestHomePage < Test::Unit::TestCase

    def setup
      base="#{ENV['JEKYLL_BASEURL']}"
      @driver = Selenium::WebDriver.for :phantomjs
      @driver.navigate.to(base)

    end

    def teardown
      @driver.quit
    end

    def test_home_page_title
      assert_equal('Your awesome title', @driver.title)
    end
  end
end
