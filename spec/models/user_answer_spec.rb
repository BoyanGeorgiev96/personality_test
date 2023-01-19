require 'rails_helper'

RSpec.describe UserAnswer, type: :model do
  it { should validate_uniqueness_of(:user_id).scoped_to(:answer_id) }
  it { should belong_to(:user) }
  it { should belong_to(:answer) }

  it 'is expected to destroy an answer' do
    create(:user)
    create(:answer)
    create(:user_answer)
    UserAnswer.old_answer(1, 1).destroy
    expect(UserAnswer.first).to be_nil
  end
end
