class AddSubjectToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :subject_id, :integer
  end
end
