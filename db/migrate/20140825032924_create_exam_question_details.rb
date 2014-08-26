class CreateExamQuestionDetails < ActiveRecord::Migration
  def change
    create_table :exam_question_details do |t|
      t.integer :exam_question_id
      t.integer :quantity
      t.string :answer_type

      t.timestamps
    end
  end
end
