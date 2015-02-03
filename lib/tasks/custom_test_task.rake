namespace :custom_test_task do
  desc "Prepares a custom testing environment for running selenium and test server on same computer"
  task runtests_selenium: :environment do
  	#Clear selenium db
	system("RAILS_ENV=selenium rake db:reset")
	#Starts server from selenium env
	@pid = spawn("RAILS_ENV=selenium rails s")

	#inicializa testes
	system("rake test:integration")

	#Clear selenium db
	system("RAILS_ENV=selenium rake db:reset")
	
	#End server
	Process.kill("SIGKILL", @pid)
  end

end
