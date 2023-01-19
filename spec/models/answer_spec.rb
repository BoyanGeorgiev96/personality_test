require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:score) }
  it { should validate_numericality_of(:score).is_in(1..4).only_integer }
  it { should have_one(:question) }
  it { should have_one(:question_answer) }
  it { should have_many(:user_answers) }
  it { should have_many(:users) }

  it 'is expected to pluck correct answer ids' do
    answer1 = create(:answer)
    answer2 = create(:answer)
    user = create(:user)
    create(:user_answer)
    create(:user_answer, answer_id: 2)
    ids = user.answers.pluck_ids
    expect(ids).to eql([answer1.id, answer2.id])
  end
end
