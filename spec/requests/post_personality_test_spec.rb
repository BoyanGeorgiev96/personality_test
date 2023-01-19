require 'rails_helper'

RSpec.describe "POST '/api/v1/personality_test'", type: :request do
  before do
    host! 'localhost:3000'
    get '/api/v1/login'
    create(:question)
    create(:question)
    4.times do |i|
      create(:answer, score: i + 1)
      create(:question_answer, answer_id: i + 1)
    end
    params = { answer_id: 1 }
    post '/api/v1/personality_test', params:
  end

  it 'is expected to create new UserAnswer' do
    answer = JSON.parse(response.body)['answer']
    expect(response).to be_successful
    expect(answer['answer_id']).to eql(1)
    expect(answer['user_id']).to eql(1)
  end
end
