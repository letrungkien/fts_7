class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :subject_id
      t.integer :level_id
      t.string :content
      t.string :type

      t.timestamps
    end
  end
end
