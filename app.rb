require 'sinatra'
require 'slim'

class MyApp < Sinatra::Base
  get '/' do
    @foo = {bar: "baz"}
    slim :example
  end
end
