require 'test_helper'

class QuestionsSubjectsTest < ActionDispatch::IntegrationTest
   include Capybara::DSL
   setup do
	@question = questions(:one)
	@subject = subjects(:one)
	setupCapybara
   end

	
  test "GetAllQuestionsFromSubject" do
   visit('/questions')
   
   if page.has_content?('Lorem Ipsum of Geography')
	Question.where(question: "Lorem Ipsum of Geography").destroy_all
	visit('/questions')
   end
   
   
   
   assert page.has_content?('Banco de Questoes')
   
   click_link "New Question"
   
   assert page.has_content?('Nova quest')
   
   fill_in 'question_question', :with => 'Lorem Ipsum of Geography'
   
   fill_in 'question_subject_id', :with => '1'
   
   click_button 'Criar'
   
   assert page.has_content?('Question was successfully created.')
   
   click_link "Back"
   
   assert page.has_content?('Lorem Ipsum of Geography')
   
   select('Geografia', :from => 'subject_id')
   
   click_button 'Filtrar'
   
   assert page.has_content?('Lorem Ipsum of Geography')
   
   
  end
end
