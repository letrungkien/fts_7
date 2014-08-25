class CreateAnswerSheetDetails < ActiveRecord::Migration
  def change
    create_table :answer_sheet_details do |t|
      t.integer :answer_sheet_id
      t.integer :answer_id
      t.string :answer_text
      t.integer :question_id

      t.timestamps
    end
  end
end
