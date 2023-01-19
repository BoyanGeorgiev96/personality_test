require 'rails_helper'

RSpec.describe Answer, type: :model do
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:score) }
  it { should validate_numericality_of(:score).is_in(1..4).only_integer }
  it { should have_one(:question) }
  it { should have_one(:question_answer) }
  it { should have_many(:user_answers) }
  it { should have_many(:users) }

  it 'is expected to select attributes for question' do
    question = create(:question)
    3.times do |i|
      create(:answer)
      create(:question_answer, answer_id: i + 1)
    end
    answers = question.answers.select_attributes_for_questions
    expect(answers.size).to eql(3)
    answers.each do |answer|
      expect(answer.attributes.keys).to eql(%w[id content score])
    end
  end

  it 'is expected to select answer ids' do
    answer1 = create(:answer)
    answer2 = create(:answer)
    user = create(:user)
    create(:user_answer)
    create(:user_answer, answer_id: 2)
    ids = user.answers.pluck_ids
    expect(ids).to eql([answer1.id, answer2.id])
  end
end
