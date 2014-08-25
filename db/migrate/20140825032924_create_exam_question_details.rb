class CreateExamQuestionDetails < ActiveRecord::Migration
  def change
    create_table :exam_question_details do |t|
      t.integer :exam_question_id
      t.integer :checkbox_question_quantity
      t.integer :textbox_question_quantity
      t.integer :radio_button_question_quantity

      t.timestamps
    end
  end
end
