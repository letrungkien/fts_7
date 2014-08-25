class CreateAnswerSheets < ActiveRecord::Migration
  def change
    create_table :answer_sheets do |t|
      t.integer :exam_id
      t.integer :question_id
      t.boolean :admin_check

      t.timestamps
    end
  end
end
