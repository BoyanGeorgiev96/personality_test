class Answer < ApplicationRecord
  validates_presence_of :content, :score
  validates :score, numericality: { only_integer: true, in: 1..4 }

  has_one :question_answer
  has_one :question, through: :question_answer

  has_many :user_answers
  has_many :users, through: :user_answers

  scope :select_attributes_for_questions, -> { select(:id, :content, :score) }
  scope :pluck_ids, -> { pluck(:id) }
end
