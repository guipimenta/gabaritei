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


	# O selenium atua como um browser, precisa ter um servidor rails rodando
	# Problma: o rake:test e o rails -s -e test compartilham o mesmo banco
	# SQLite nao suporta concurrent access
	# Solucao: criar um ambiente separado do teste para rodar o servidor
	# Dessa forma, criei um novo env chamado selenium
	# Aqui o programa reseta o banco e roda um novo processo, o servidor selenium

	def setupSeleniumEnv
		#Clear selenium db
		system("RAILS_ENV=selenium rake db:reset")
		#Starts server from selenium env
		@pid = spawn("RAILS_ENV=selenium rails s")
	end


	#
	# Finaliza o servidor de testes
	# Mata a instância do servidor rails
	# Necessario somente quando estivermos rodando
	# Servidor de testes junto com o computador de desenvolvimento
	#
	def teardown
		#Clear selenium db
		system("RAILS_ENV=selenium rake db:reset")
		#End server
		Process.kill("SIGKILL", @pid)
	end
  
end
