require 'rails_helper'

RSpec.describe Result, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:min_score) }
  it { should validate_presence_of(:max_score) }
  it { should validate_numericality_of(:min_score).is_in(0..42).only_integer }
  it { should validate_numericality_of(:max_score).is_in(13..55).only_integer }
  it { should have_many(:users) }
  it { should have_many(:user_results) }

  it 'is expected to calculate the correct result' do
    create(:result)
    expect(Result.calculate(20).name).to eql('Introvert')
  end
  it 'is expected to raise an error if score is not between 0 and 55' do
    create(:result, max_score: 55)
    # Test above 55
    expect { Result.calculate(56) }.to raise_error(StandardError)
    # Test below 0
    expect { Result.calculate(-1) }.to raise_error(StandardError)
  end
end
