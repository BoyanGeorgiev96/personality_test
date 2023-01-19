require 'rails_helper'

RSpec.describe 'PATCH api/v1/personality_test', type: :request do
  before do
    host! 'localhost:3000'
    get '/api/v1/login'
    create(:question)
    create(:question)
    4.times do |i|
      create(:answer, score: i + 1)
      create(:question_answer, answer_id: i + 1)
    end
    create(:user_answer)
    params = { old_answer_id: 1, new_answer_id: 2 }
    patch '/api/v1/personality_test', params:
  end
  it 'is expected to change answer successfully' do
    body = JSON.parse(response.body)
    expect(response).to be_successful
    expect(body['answer']['answer_id']).to eql(2)
  end
end
