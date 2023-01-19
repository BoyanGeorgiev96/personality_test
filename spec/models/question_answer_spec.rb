require 'rails_helper'

RSpec.describe QuestionAnswer, type: :model do
  it { should belong_to(:question) }
  it { should belong_to(:answer) }
  it { should validate_uniqueness_of(:answer_id) }
end
