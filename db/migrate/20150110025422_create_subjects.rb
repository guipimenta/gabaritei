class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :professor_id
      t.integer :department_id

      t.timestamps
    end
  end
end
