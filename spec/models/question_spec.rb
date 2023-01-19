require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should validate_presence_of(:content) }
  it { should have_many(:answers) }
  it { should have_many(:question_answers) }
end
