require 'sinatra/base'
require 'sinatra/cross_origin'
require 'json'

module QuePido
  class API < Sinatra::Base
    
    def initialize(menu: Menu.new)
      @menu = menu
      super()
    end

    set :bind, '0.0.0.0'
    configure do
      enable :cross_origin
    end
    before do
      response.headers['Access-Control-Allow-Origin'] = '*'
    end
    
    options "*" do
      response.headers["Allow"] = "GET, POST, OPTIONS"
      response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
      response.headers["Access-Control-Allow-Origin"] = "*"
      200
    end

    not_found do
      status 404
      "Esta p&aacute;gina no existe :("
    end

    get '/' do
      send_file 'public/index.html'
    end

    get '/que/:type' do
      JSON.generate(@menu.dame_elemento_random_de(params['type']))
    end

    get '/que' do
      todas.to_json
    end

    #def dame_elemento_random_de(lista)
    #  maxIndex = Random.rand(lista.size - 1)
    #  JSON.generate('meal' => lista[maxIndex])
    #end
  end
end
