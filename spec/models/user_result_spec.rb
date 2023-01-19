require 'rails_helper'

RSpec.describe UserResult, type: :model do
  it { should validate_uniqueness_of(:user_id) }
  it { should belong_to(:user) }
  it { should belong_to(:result) }
end
