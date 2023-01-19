require 'rails_helper'

RSpec.describe 'GET api/v1/personality_test', type: :request do
  before do
    host! 'localhost:3000'
    get '/api/v1/login'
    create(:question)
    4.times do |i|
      create(:answer, score: i + 1)
      create(:question_answer, answer_id: i + 1)
    end
    create(:user_answer)
    get '/api/v1/personality_test'
  end

  it 'is expected to render json containing questions with their answers, and answers already given by users' do
    body = JSON.parse(response.body)
    expect(response).to be_successful
    expect(body['questions'].size).to eql(1)
    expect(body['questions'][0]['answers'].size).to eql(4)
    expect(body['answered'].size).to eql(1)
  end
end
