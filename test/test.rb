ENV['RACK_ENV'] = 'test'

require './app.rb'
require 'test/unit'
require 'rack/test'


require 'capybara/dsl'
require './test/helper.rb'

#capybara base class 


#require 'capybara/poltergeist'

#Capybara.javascript_driver = :poltergeist]

class HelloWorldTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

 # def test_it_says_hello_world
 #   get '/'
 #   assert last_response.ok?
 # end

  
end


class CapybaraTestCase < Test::Unit::TestCase
  include Capybara::DSL

   def setup
    Capybara.app = Sinatra::Application.new
  end
  
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
  
  def test_button_spec
	visit '/'
	assert page.has_css?('div', text: "Ta-da", visible: false )
	click_button 'click me'
	assert page.has_css?('div', text: "Ta-da", visible: true )
  end

  
end



