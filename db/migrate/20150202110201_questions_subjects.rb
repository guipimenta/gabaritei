class QuestionsSubjects < ActiveRecord::Migration
  create_table :questions_subjects do |t|
  	t.belongs_to :subject, index: true
    t.belongs_to :question, index: true
    t.timestamps null: false
  end
end
