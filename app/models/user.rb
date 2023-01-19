class User < ApplicationRecord
  has_many :user_answers
  has_many :answers, through: :user_answers

  has_one :user_result
  has_one :result, through: :user_result
end
