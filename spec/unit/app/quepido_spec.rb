require_relative '../../../app/quepido'
require 'rack/test'

module QuePido
  RSpec.describe API do
    include Rack::Test::Methods

    def app
      API.new(menu: menu)
    end

    let(:menu) { instance_double('QuePido::Menu') }

    describe 'GET /que/:type' do
      context 'when type exist' do

        before do
          allow(menu).to receive(:dame_elemento_random_de)
            .with('clasicas')
            .and_return({ 'meal' => 'asado' })
        end

        it 'returns a meal of the queried type' do
          get '/que/clasicas'
          parsed = JSON.parse(last_response.body)
          expect(parsed).to eq('meal' => 'asado')
        end
        
        it 'responds with a 200 (OK)' do
          get '/que/clasicas'
          expect(last_response.status).to eq(200)
        end
        
      end 
    end
    
  end
end

