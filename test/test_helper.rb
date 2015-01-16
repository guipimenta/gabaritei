ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'database_cleaner'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  # Add more helper methods to be used by all tests here... 
  
  #Seta as configuracoes para o Capybara funcionar corretamente
  def setupCapybara
	Capybara.default_driver = :selenium
	Capybara.run_server = false
	Capybara.app_host = "http://localhost:3000"
	
	#Clear selenium db
	system("RAILS_ENV=selenium rake db:reset")
	#Starts server from selenium env
	@pid = spawn("RAILS_ENV=selenium rails s")
	
	
	
  end
  
	def teardown
		#Clear selenium db
		system("RAILS_ENV=selenium rake db:reset")
		#End server
		Process.kill("QUIT", @pid)
	end
  
end
