class UserResult < ApplicationRecord
  validates_uniqueness_of :user_id
  belongs_to :user
  belongs_to :result
end
