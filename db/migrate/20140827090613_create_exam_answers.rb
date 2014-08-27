class CreateExamAnswers < ActiveRecord::Migration
  def change
    create_table :exam_answers do |t|
      t.integer :exam_id
      t.integer :question_id
      t.boolean :admin_check

      t.timestamps
    end
  end
end
