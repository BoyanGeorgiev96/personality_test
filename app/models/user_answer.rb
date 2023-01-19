class UserAnswer < ApplicationRecord
  validates :user_id, uniqueness: { scope: :answer_id }
  belongs_to :user
  belongs_to :answer

  def self.old_answer(user_id, answer_id)
    where(user_id:, answer_id:).first
  end
end
