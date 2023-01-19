class AddUniqueIndexToUserAnswer < ActiveRecord::Migration[7.0]
  def change
    add_index :user_answers, %i[user_id answer_id], unique: true
  end
end
