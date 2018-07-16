require 'rack/test'
require 'json'
require_relative '../../app/quepido'

module QuePido
  RSpec.describe 'Que Pido API' do
    include Rack::Test::Methods

    def app
      QuePido::API::new
    end
    it 'returns a random meal' do
      get '/que/todas'
      expect(last_response.status).to eq(200)
      parsed = JSON.parse(last_response.body)
      expect(parsed).to include(a_kind_of(String))
    end

  end
end

   
