require 'sinatra/config_file'

module QuePido
  class Menu
    register Sinatra::ConfigFile 
    config_file '../config/comidas.yml'
    clasicas = settings.clasicas
    etnicas = settings.etnicas
    todas = clasicas + etnicas

  end
end
