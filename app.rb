require 'sinatra'
require 'slim'

class MyApp < Sinatra::Base
  # This combination shows 500 Error
  # disable :raise_errors
  # disable :show_exceptions

  # This combination shows undefined method join for string
  # enable :raise_errors
  # enable :show_exceptions

  # This combination shows undefined method blowup for hash
  # This is the *actual* error
  enable :raise_errors
  disable :show_exceptions

  # No combination shows the Sinatra error page.

  # Template calls #blowup on @foo
  # should raise NoMethodError: undefined method blowup for hash
  get '/slim' do
    @foo = {bar: "baz"}
    slim :example
  end

  # Template calls #blowup on @foo
  # should raise NoMethodError: undefined method blowup for hash
  get '/erb' do
    @foo = {bar: "baz"}
    erb :example
  end

  # Routing block calls #blowup on @foo
  # should raise NoMethodError: undefined method blowup for hash
  get '/sinatra' do
    @foo = {bar: "baz"}
    @foo.blowup
    "Hello World"
  end
end
