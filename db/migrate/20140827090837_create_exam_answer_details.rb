class CreateExamAnswerDetails < ActiveRecord::Migration
  def change
    create_table :exam_answer_details do |t|
      t.integer :exam_answer_id
      t.integer :answer_id
      t.string :answer_text
      t.integer :question_id

      t.timestamps
    end
  end
end
