class User < ApplicationRecord
  has_many :user_answers, dependent: :destroy
  has_many :answers, through: :user_answers

  has_one :user_result, dependent: :destroy
  has_one :result, through: :user_result
end
