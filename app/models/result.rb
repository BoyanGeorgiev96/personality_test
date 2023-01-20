class Result < ApplicationRecord
  validates_presence_of :name, :content, :min_score, :max_score
  validates_presence_of :content
  validates :min_score, numericality: { only_integer: true, in: 0..42 }
  validates :max_score, numericality: { only_integer: true, in: 13..55 }

  has_many :user_results, dependent: :destroy
  has_many :users, through: :user_results

  def self.calculate(score)
    result = find_by(min_score: Float::INFINITY..score, max_score: score..Float::INFINITY)
    raise StandardError unless result

    result
  end
end
