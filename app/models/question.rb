class Question < ActiveRecord::Base

	#Relacoes (Answers ainda deve ser implementado)
	has_many :answers

	#Opcoes de tipo de Questao, funciona mais ou menos como um enum
	TYPE = [
				DISCURSIVE_TYPE = 'Discursiva', 
				ALTERNATIVE_TYPE = 'Alternativa'
			]

	#Acho que seria bom implementar tambem o mesmo tipo de "truque" para o campo Area (Area de conhecimento)


	#Metodos do model
	#Gosto desse tipo de metodos com interrogacao, acho que eles sao auto explicativos tambem
	def alternative?
		if self.type == Question::ALTERNATIVE_TYPE
			return true
		else
			return false
		end
	end


	def discursive?
		if self.type == Question::DISCURSIVE_TYPE
			return true
		else
			return false
		end
	end

	#Funciona como um set para tipo de alternativa, nao seria necessario fazer isso no Model, mas ao fazer desse modo, 
	#evitamos alguns typos. Depois do set o model ainda precisa ser salvo la no controller!
	#Best practices: http://rails-bestpractices.com/posts/708-clever-enums-in-rails
	def discursive_type
		self.type = Question::DISCURSIVE_TYPE
	end

	def alternative_type
		self.type = Question::ALTERNATIVE_TYPE
	end


end
