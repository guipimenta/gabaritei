require 'test_helper'

class QuestionsSubjectsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  run = 0 
  setup do
    if run == 0
    	setupCapybara
      run = 1
    end
  end




  #
  # Testes de criacao e relacionamento
  # entre os models subjects e questions
  # Testa tambem os controllers e filtros
  # de disciplinas
  #
  
  test "CreateQuestion" do
    visit('/subjects')
    assert page.has_content?('Listing subjects')
    click_link "New Subject"
    assert page.has_content?('New subject')
    fill_in 'subject_name', :with => 'Geografia'
    click_button 'Criar'
    assert page.has_content?('Subject was successfully created.')


    visit('/questions')
    assert page.has_content?('Banco de Questoes')
    click_link "New Question"
    assert page.has_content?('Nova quest')
    fill_in 'question_question', :with => 'Lorem Ipsum of Geography'
    select('Geografia', :from => 'subjects')
    click_button 'Criar'
    assert page.has_content?('Question was successfully created.')
    click_link "Back"
    assert page.has_content?('Lorem Ipsum of Geography')
    
  end

  test "FilterQuestionBySubject" do

    visit('/questions')
    assert page.has_content?('Banco de Questoes')
    click_link "New Question"
    assert page.has_content?('Nova quest')
    fill_in 'question_question', :with => 'Lorem Ipsum of Quimica 2'
    select('Quimica', :from => 'subjects')
    click_button 'Criar'
    assert page.has_content?('Question was successfully created.')
    click_link "Back"
    assert page.has_content?('Lorem Ipsum of Quimica 2')

    visit('/questions')
    select('Quimica', :from => 'subject_id')
    click_button 'Filtrar'
    assert page.has_content?('Lorem Ipsum of Quimica 2')
  end

  test "CreateMultipleSubjectQuestion" do

    visit('/subjects')
    assert page.has_content?('Listing subjects')
    click_link "New Subject"
    assert page.has_content?('New subject')
    fill_in 'subject_name', :with => 'Fisica'
    click_button 'Criar'
    assert page.has_content?('Subject was successfully created.')

    visit('/subjects')
    assert page.has_content?('Listing subjects')
    click_link "New Subject"
    assert page.has_content?('New subject')
    fill_in 'subject_name', :with => 'Quimica'
    click_button 'Criar'
    assert page.has_content?('Subject was successfully created.')


    visit('/questions')
    assert page.has_content?('Banco de Questoes')
    click_link "New Question"
    assert page.has_content?('Nova quest')
    fill_in 'question_question', :with => 'Lorem Ipsum of Multiple Subject'
    find(:xpath, "id('subjects')/option[1]").click
    find(:xpath, "id('subjects')/option[2]").click
    click_button 'Criar'
    assert page.has_content?('Question was successfully created.')
  end

  test "CreateSubject" do
    visit('/subjects')
    assert page.has_content?('Listing subjects')
    click_link "New Subject"
    assert page.has_content?('New subject')
    fill_in 'subject_name', :with => 'Geografia'
    click_button 'Criar'
    assert page.has_content?('Subject was successfully created.')
  end

end
