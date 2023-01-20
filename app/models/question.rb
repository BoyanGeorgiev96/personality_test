class Question < ApplicationRecord
  validates_presence_of :content

  has_many :question_answers, dependent: :destroy
  has_many :answers, through: :question_answers
end
