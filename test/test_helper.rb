ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'database_cleaner'

	class ActiveSupport::TestCase
	# Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
	fixtures :all

	# Add more helper methods to be used by all tests here... 

	#
	#Seta as configuracoes para o Capybara funcionar corretamente
	#
	def setupCapybara
		#Sobrescreve o default driver para usar o chrome
		#Firefox 35 e incompativel com o capybara (talvez arrumem depois)
		Capybara.register_driver :chrome do |app|
  			Capybara::Selenium::Driver.new(app, :browser => :chrome)
		end

		Capybara.default_driver = :chrome

		#Capybara.default_driver = Capybara::Selenium::Driver.new(app, :browser => :chrome)


		Capybara.run_server = false

		#Talvez criar um servidor de testes
		Capybara.app_host = "http://localhost:3000"
	end

  
end
