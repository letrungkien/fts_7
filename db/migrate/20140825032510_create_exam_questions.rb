class CreateExamQuestions < ActiveRecord::Migration
  def change
    create_table :exam_questions do |t|
      t.integer :subject_id
      t.integer :level_id
      t.string :name

      t.timestamps
    end
    add_index :exam_questions, :name
  end
end
