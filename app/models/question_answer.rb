class QuestionAnswer < ApplicationRecord
  validates_uniqueness_of :answer_id
  belongs_to :question
  belongs_to :answer
end
