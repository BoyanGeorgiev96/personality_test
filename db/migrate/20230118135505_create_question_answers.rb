class CreateQuestionAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :question_answers do |t|
      t.integer :question_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
