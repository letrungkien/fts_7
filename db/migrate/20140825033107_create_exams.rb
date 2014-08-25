class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :user_id
      t.integer :exam_question_id
      t.boolean :admin_check
      
      t.timestamps
    end
  end
end
