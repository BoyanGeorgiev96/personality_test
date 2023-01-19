require 'rails_helper'

RSpec.describe 'GET /login', type: :request do
  before do
    host! 'localhost:3000'
    get '/api/v1/login'
  end
  it 'is expected to login the user via cookie' do
    expect(response.header['Set-Cookie'].split('=')[0]).to eql('_interslice_session')
  end
end
