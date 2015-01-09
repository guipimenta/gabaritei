class CreateDisciplinas < ActiveRecord::Migration
  def change
    create_table :disciplinas do |t|
      t.string :name
      t.integer :department
      t.integer :professor

      t.timestamps
    end
  end
end
